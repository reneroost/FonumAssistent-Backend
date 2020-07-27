package ee.reneroost.fonumAssistentBackend.kontroller;

import ee.reneroost.fonumAssistentBackend.olem.TehtudTooLogi;
import ee.reneroost.fonumAssistentBackend.olem.TehtudToodeKogus;
import ee.reneroost.fonumAssistentBackend.teenus.TehtudTooLogiTeenus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
public class TehtudTooLogiKontroller {

    @Autowired
    private TehtudTooLogiTeenus tehtudTooLogiTeenus;

    @GetMapping("/tehtudtoodelogid")
    public List<TehtudTooLogi> saaKoikTehtudToodeLogid() {
        return tehtudTooLogiTeenus.saaLogid();
    }

    @PostMapping("/lisaTehtudtoologi")
    public TehtudTooLogi lisaTehtudTooLogi(@RequestBody TehtudTooLogi tehtudTooLogi) {
        return tehtudTooLogiTeenus.lisaLogi(tehtudTooLogi);
    }

    @GetMapping("/enimkulunudvaruosad/{perioodKuudes}/{minKogus}")
    public List<TehtudToodeKogus> saaEnimkulunudVaruosad(@PathVariable int perioodKuudes, @PathVariable int minKogus) {
        return tehtudTooLogiTeenus.saaEnimkulunudVaruosad(perioodKuudes, minKogus);
    }
}
