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
        System.out.println("Antud id: " + id);
        return varuosaTeenus.kustutaVaruosa(id);
    }

    @GetMapping("/saaKoikOtsakorralVaruosad")
    public List<Varuosa> saaKoikOtsakorralVaruosad() {
        return varuosaTeenus.saaKoikOtsakorralVaruosad();
    }

    @GetMapping("/saaLeebeltOtsakorralVaruosad")
    public List<Varuosa> saaLeebeltOtsakorralVaruosad() {
        return varuosaTeenus.saaLeebeltOtsakorralVaruosad();
    }

    @GetMapping("/saaKriitiliseltOtsakorralVaruosad")
    public List<Varuosa> saaKriitiliseltOtsakorralVaruosad() {
        return varuosaTeenus.saaKriitiliseltOtsakorralVaruosad();
    }

}
