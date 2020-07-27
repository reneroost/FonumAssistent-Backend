package ee.reneroost.fonumAssistentBackend.teenus;

import ee.reneroost.fonumAssistentBackend.olem.TehtudTooLogi;
import ee.reneroost.fonumAssistentBackend.olem.TehtudToodeKogus;
import ee.reneroost.fonumAssistentBackend.repositoorium.TehtudTooLogiRepo;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class TehtudTooLogiTeenus {

    @Autowired
    private TehtudTooLogiRepo tehtudTooLogiRepo;

    public List<TehtudTooLogi> saaLogid() {
        return tehtudTooLogiRepo.findAll();
    }

    public TehtudTooLogi lisaLogi(TehtudTooLogi tehtudTooLogi) {
        return tehtudTooLogiRepo.save(tehtudTooLogi);
    }

    @SneakyThrows
    public List<TehtudToodeKogus> saaEnimkulunudVaruosad(int perioodKuudes, int minKogus) {
        List<TehtudTooLogi> koikTooLogid = tehtudTooLogiRepo.findAll();
        List<TehtudToodeKogus> toodeKogusedMinPiiranguta = new ArrayList<>();
        List<TehtudToodeKogus> toodeKogused = new ArrayList<>();
        SimpleDateFormat vormindaja = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        DateTimeFormatter vormindajaLocal = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        Date algusKuupaev = arvutaAlgusKuupaev(perioodKuudes);
        for (TehtudTooLogi tooLogi : koikTooLogid) {
            boolean onOlemas = false;
            Date tooKuupaev = vormindaja.parse(tooLogi.getTehtudTooKpKell());
            if (!algusKuupaev.after(tooKuupaev)) {
                for (TehtudToodeKogus toodekogus : toodeKogusedMinPiiranguta) {
                    if (toodekogus.getMudel().equals(tooLogi.getMudel()) &&
                            toodekogus.getVaruosaLiik().equals(tooLogi.getVaruosaLiik())) {
                        toodekogus.setKogused(toodekogus.getKogused() + tooLogi.getKogus());
                        onOlemas = true;
                    }
                }
                if (!onOlemas) {
                    toodeKogusedMinPiiranguta.add(new TehtudToodeKogus(tooLogi));
                }
            }
        }
        for (TehtudToodeKogus too : toodeKogusedMinPiiranguta) {
            if (too.getKogused() >= minKogus) {
                toodeKogused.add(too);
            }
        }
        return toodeKogused;
    }

    public static Date arvutaAlgusKuupaev(int kuudeHulk) {
        LocalDateTime praeguneKuupaevLocal = LocalDateTime.now();
        LocalDateTime uusKuupaevLocal = LocalDateTime.from(praeguneKuupaevLocal).minusMonths(kuudeHulk);
        return java.util.Date.from(uusKuupaevLocal.atZone(ZoneId.systemDefault())
        .toInstant());
    }
}
