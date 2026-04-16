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
    static void main() {
        Github.Release release = HttpRequest.get("https://api.github.com/repos/wushuo894/ani-rss/releases/latest")
                .thenFunction(res -> GsonStatic.fromJson(res.body(), Github.Release.class));

        Optional<Github.Assets> first = release.getAssets()
                .stream()
                .filter(it -> it.getName().equals("ani-rss.dmg"))
                .findFirst();

        if (first.isEmpty()) {
            log.error("dmg 不存在");
            return;
        }

        String version = release.getName().replace("v", "");

        Github.Assets assets = first.get();
        String sha256 = assets.getDigest().replace("sha256:", "");

        String s = FileUtil.readUtf8String(new File("Casks/ani-rss.rb"));

        String versionReg = "version \".+\"";
        String sha256Reg = "sha256 \".+\"";

        s = s.replaceFirst(versionReg, "version \"" + version + "\"");
        s = s.replaceFirst(sha256Reg, "sha256 \"" + sha256 + "\"");

        log.info(s);

        FileUtil.writeUtf8String(s, new File("Casks/ani-rss.rb"));
    }
}
