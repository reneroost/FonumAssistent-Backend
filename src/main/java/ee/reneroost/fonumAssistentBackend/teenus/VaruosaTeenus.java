package ee.reneroost.fonumAssistentBackend.teenus;

import ee.reneroost.fonumAssistentBackend.olem.Varuosa;
import ee.reneroost.fonumAssistentBackend.repositoorium.VaruosaRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class VaruosaTeenus {

    @Autowired
    private VaruosaRepo varuosaRepo;

    public List<Varuosa> saaVaruosad() {
        return varuosaRepo.findAll();
    }

    public Varuosa saaVaruosaIdPohjal(int id) {
        return varuosaRepo.findById(id).orElse(null);
    }

    //    public Varuosa saaVaruosaMudeliPohjal(String mudel) {
//        return varuosaRepo.findByMudel(mudel);
//    }

    public List<Varuosa> lisaVaruosad(List<Varuosa> varuosad) {
        return varuosaRepo.saveAll(varuosad);
    }

    public Varuosa lisaVaruosa(Varuosa varuosa) {
        return varuosaRepo.save(varuosa);
    }


    public String kustutaVaruosa(Integer id) {
        varuosaRepo.deleteById(id);
        return "Kustutatud varuosa id:" + id;
    }

    public Varuosa muudaVaruosa(Varuosa varuosa) {
        Varuosa eksisteerivVaruosa = varuosaRepo.findById(varuosa.getId()).orElse(null);
        assert eksisteerivVaruosa != null;
        eksisteerivVaruosa.setTootja(varuosa.getTootja());
        eksisteerivVaruosa.setMudel(varuosa.getMudel());
        eksisteerivVaruosa.setArtikliHind(varuosa.getArtikliHind());
        eksisteerivVaruosa.setTeenuseHind(varuosa.getTeenuseHind());
        eksisteerivVaruosa.setKogus(varuosa.getKogus());
        eksisteerivVaruosa.setKogusKristiineKeskuses(varuosa.getKogusKristiineKeskuses());
        eksisteerivVaruosa.setKogusViruKeskuses(varuosa.getKogusViruKeskuses());
        eksisteerivVaruosa.setKogusLounaKeskuses(varuosa.getKogusLounaKeskuses());
        return varuosaRepo.save(eksisteerivVaruosa);
    }

    public List<Varuosa> saaKoikOtsakorralVaruosad() {
        List<Varuosa> koikVaruosad = varuosaRepo.findAll();
        List<Varuosa> otsakorralVaruosad = new ArrayList<>();
        for (Varuosa varuosa: koikVaruosad) {
            if (varuosa.getKogus() <= 6) {
//                assert false;
                otsakorralVaruosad.add(varuosa);
            }
        }
        return otsakorralVaruosad;
    }


    public List<Varuosa> saaLeebeltOtsakorralVaruosad() {
        List<Varuosa> koikVaruosad = varuosaRepo.findAll();
        List<Varuosa> otsakorralVaruosad = new ArrayList<>();
        for (Varuosa varuosa: koikVaruosad) {
            if (varuosa.getKogus() <= 6 && varuosa.getKogus() >= 4) {
//                assert false;
                otsakorralVaruosad.add(varuosa);
            }
        }
        return otsakorralVaruosad;
    }

    public List<Varuosa> saaKriitiliseltOtsakorralVaruosad() {
        List<Varuosa> koikVaruosad = varuosaRepo.findAll();
        List<Varuosa> otsakorralVaruosad = new ArrayList<>();
        for (Varuosa varuosa: koikVaruosad) {
            if (varuosa.getKogus() <= 3) {
//                assert false;
                otsakorralVaruosad.add(varuosa);
            }
        }
        return otsakorralVaruosad;
    }

}
