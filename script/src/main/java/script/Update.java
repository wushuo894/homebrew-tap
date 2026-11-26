package script;

import cn.hutool.core.io.FileUtil;
import cn.hutool.http.HttpRequest;
import lombok.extern.slf4j.Slf4j;
import script.commons.GsonStatic;
import script.entity.Github;

import java.io.File;
import java.util.Optional;

@Slf4j
public class Update {
    // 手动更新工作流的入口，分别同步两个 Cask。
    static void main() {
        // updateCask("ani-rss", "ani-rss.dmg");
        updateCask("ani-rss-desktop", "ani-rss-desktop-%s-arm64.dmg");
    }

    // 根据最新发布的标签和对应 DMG 的摘要更新 Cask。
    private static void updateCask(String name, String assetNamePattern) {
        Github.Release release = HttpRequest.get("https://api.github.com/repos/wushuo894/" + name + "/releases/latest")
                .thenFunction(res -> GsonStatic.fromJson(res.body(), Github.Release.class));

        if (release == null || release.getTagName() == null || release.getAssets() == null) {
            log.error("{} 无法读取最新发布", name);
            return;
        }

        String version = release.getTagName().replaceFirst("^v", "");
        String assetName = assetNamePattern.formatted(version);

        // 只有对应 DMG 和有效的 SHA-256 均存在时才写入版本。
        Optional<Github.Assets> first = release.getAssets()
                .stream()
                .filter(it -> assetName.equals(it.getName()))
                .filter(it -> it.getDigest() != null && it.getDigest().matches("sha256:[0-9a-fA-F]{64}"))
                .findFirst();

        if (first.isEmpty()) {
            log.error("{} 缺少 {} 或有效的 SHA-256", name, assetName);
            return;
        }

        Github.Assets assets = first.get();
        String sha256 = assets.getDigest().replace("sha256:", "");

        File cask = new File("Casks/" + name + ".rb");
        String s = FileUtil.readUtf8String(cask);

        String versionReg = "version \".+\"";
        String sha256Reg = "sha256 \".+\"";

        s = s.replaceFirst(versionReg, "version \"" + version + "\"");
        s = s.replaceFirst(sha256Reg, "sha256 \"" + sha256 + "\"");

        log.info(s);

        FileUtil.writeUtf8String(s, cask);
    }
}
