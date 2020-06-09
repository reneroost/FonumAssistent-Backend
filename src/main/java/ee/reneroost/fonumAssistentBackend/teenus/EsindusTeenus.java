package ee.reneroost.fonumAssistentBackend.teenus;

import ee.reneroost.fonumAssistentBackend.olem.Esindus;
import ee.reneroost.fonumAssistentBackend.repositoorium.EsindusRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EsindusTeenus {

    @Autowired
    private EsindusRepo esindusRepo;

    public List<Esindus> saaEsindused() {
        return esindusRepo.findAll();
    }

    public Esindus saaEsindusIdPohjal(int id) {
        return esindusRepo.findById(id).orElse(null);
    }

    public Esindus lisaEsindus(Esindus esindus) {
        return esindusRepo.save(esindus);
    }

    public List<Esindus> lisaEsindused(List<Esindus> esindused) {
        return esindusRepo.saveAll(esindused);
    }

    public String kustutaEsindus(Integer id) {
        esindusRepo.deleteById(id);
        return "Kustutatud esinduse id: " + id;
    }

    public Esindus muudaEsindust(Esindus esindus) {
        Esindus eksisteerivEsindus = esindusRepo.findById(esindus.getId()).orElse(null);
        assert eksisteerivEsindus != null;
        eksisteerivEsindus.setNimi(esindus.getNimi());
        eksisteerivEsindus.setNimiLyhend(esindus.getNimiLyhend());
        eksisteerivEsindus.setNimiSisseytlev(esindus.getNimiSisseytlev());
        eksisteerivEsindus.setNimiSeesytlev(esindus.getNimiSeestytlev());
        eksisteerivEsindus.setNimiSeestytlev(esindus.getNimiSeestytlev());
        return esindusRepo.save(eksisteerivEsindus);
    }
}
