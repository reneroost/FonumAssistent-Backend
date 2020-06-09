package ee.reneroost.fonumAssistentBackend.kontroller;

import ee.reneroost.fonumAssistentBackend.olem.Esindus;
import ee.reneroost.fonumAssistentBackend.teenus.EsindusTeenus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
public class EsindusKontroller {

    @Autowired
    private EsindusTeenus esindusTeenus;

    @GetMapping("/esindused")
    public List<Esindus> saaKoikEsindused() {
        return esindusTeenus.saaEsindused();
    }

    @GetMapping("/esindusIdPohjal/{id}")
    public Esindus esindusIdPohjal(@PathVariable int id) {
        return esindusTeenus.saaEsindusIdPohjal(id);
    }

    @PostMapping("/lisaEsindus")
    public Esindus lisaEsindus(@RequestBody Esindus esindus) {
        return esindusTeenus.lisaEsindus(esindus);
    }

    @PostMapping("/lisaEsindused")
    public List<Esindus> lisaEsindus(@RequestBody List<Esindus> esindused) {
        return esindusTeenus.lisaEsindused(esindused);
    }

    @PutMapping("/muudaEsindust")
    public Esindus muudaEsindust(@RequestBody Esindus esindus) {
        return esindusTeenus.muudaEsindust(esindus);
    }

    @DeleteMapping("/kustutaEsindus/{id}")
    public String kustutaEsindus(@PathVariable Integer id) {
        System.out.println("Antud id: " + id);
        return esindusTeenus.kustutaEsindus(id);
    }


}
