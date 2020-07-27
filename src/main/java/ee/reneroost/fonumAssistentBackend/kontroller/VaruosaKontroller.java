package ee.reneroost.fonumAssistentBackend.kontroller;

import ee.reneroost.fonumAssistentBackend.olem.Varuosa;
import ee.reneroost.fonumAssistentBackend.teenus.VaruosaTeenus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
public class VaruosaKontroller {

    @Autowired
    private VaruosaTeenus varuosaTeenus;

    @GetMapping("/varuosad")
    public List<Varuosa> saaKoikVaruosad() {
        return varuosaTeenus.saaVaruosad();
    }

    @GetMapping("/varuosaIdPohjal/{id}")
    public Varuosa saaVaruosaIdPohjal(@PathVariable int id) {
        return varuosaTeenus.saaVaruosaIdPohjal(id);
    }

    @GetMapping("varuosadEsindusePohjal/{esinduseId}")
    public List<Varuosa> saaVaruosadEsindusePohjal(@PathVariable int esinduseId) {
        return varuosaTeenus.saaVaruosadEsindusePohjal(esinduseId);
    }

    @PostMapping("/lisaVaruosa")
    public Varuosa lisaVaruosa(@RequestBody Varuosa varuosa) {
        return varuosaTeenus.lisaVaruosa(varuosa);
    }

    @PostMapping("/lisaVaruosad")
    public List<Varuosa> lisaVaruosad(@RequestBody List<Varuosa> varuosad) {
        return varuosaTeenus.lisaVaruosad(varuosad);
    }

    @PutMapping("/muudaVaruosa")
    public Varuosa muudaVaruosa(@RequestBody Varuosa varuosa) {
        return varuosaTeenus.muudaVaruosa(varuosa);
    }

    @DeleteMapping("/kustutaVaruosa/{id}")
    public String kustutaVaruosa(@PathVariable Integer id) {
        return varuosaTeenus.kustutaVaruosa(id);
    }

    @GetMapping("/saaOtsakorralVaruosad/{miinimum}/{maksimum}")
    public List<Varuosa> saaOtsakorralVaruosad(@PathVariable int miinimum, @PathVariable int maksimum) {
        return varuosaTeenus.saaOtsakorralVaruosad(miinimum, maksimum);
    }

    @GetMapping("/saaVanemadVaruosad/{vanusePiir}")
    public List<Varuosa> saaVanemadVaruosad(@PathVariable int vanusePiir) {
        return varuosaTeenus.saaVanemadVaruosad(vanusePiir);
    }

    @GetMapping("/saaHinnaSoovitus/{varuosaId}")
    public int saaHinnaSoovitus(@PathVariable Integer varuosaId) {
        return varuosaTeenus.saaHinnaSoovitus(varuosaId);
    }

}
