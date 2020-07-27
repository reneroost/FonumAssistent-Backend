package ee.reneroost.fonumAssistentBackend.teenus;

import ee.reneroost.fonumAssistentBackend.olem.Varuosa;
import ee.reneroost.fonumAssistentBackend.repositoorium.VaruosaRepo;
import ee.reneroost.fonumAssistentBackend.utiil.Kuupaev;
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

    public List<Varuosa> saaVaruosadEsindusePohjal(int esinduseId) {
        List<Varuosa> koikVaruosad = varuosaRepo.findAll();
        List<Varuosa> varuosad = new ArrayList<>();
        if (esinduseId == 0) {
            for (Varuosa varuosa: koikVaruosad) {
                if (varuosa.getKogusKristiineKeskuses() > 0) {
                    varuosad.add((varuosa));
                }
            }
        } else if (esinduseId == 1) {
            for (Varuosa varuosa: koikVaruosad) {
                if (varuosa.getKogusViruKeskuses() > 0) {
                    varuosad.add((varuosa));
                }
            }
        } else if (esinduseId == 2) {
            for (Varuosa varuosa: koikVaruosad) {
                if (varuosa.getKogusLounaKeskuses() > 0) {
                    varuosad.add((varuosa));
                }
            }
        }
        return varuosad;
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

    public List<Varuosa> saaOtsakorralVaruosad(int miinimum, int maksimum) {
        List<Varuosa> koikVaruosad = varuosaRepo.findAll();
        List<Varuosa> otsakorralVaruosad = new ArrayList<>();
        for (Varuosa varuosa: koikVaruosad) {
            if (varuosa.getKogus() >= miinimum && varuosa.getKogus() <= maksimum) {
                otsakorralVaruosad.add(varuosa);
            }
        }
        return otsakorralVaruosad;
    }

    public List<Varuosa> saaVanemadVaruosad(int vanusePiir) {
        List<Varuosa> koikVaruosad = varuosaRepo.findAll();
        List<Varuosa> vanemadVaruosad = new ArrayList<>();
        for (Varuosa varuosa: koikVaruosad) {
            int vanus = new Kuupaev(varuosa.getValjatulekuAeg()).vanusKuudes();
            if (vanus >= vanusePiir && varuosa.getHinnaMuutusteHulk() < 1) {
                vanemadVaruosad.add(varuosa);
            }
        }
        return vanemadVaruosad;
    }

    public int saaHinnaSoovitus(Integer varuosaId) {
        Varuosa varuosa = varuosaRepo.findById(varuosaId).orElse(null);;
        assert varuosa != null;
        int vanus = new Kuupaev(varuosa.getValjatulekuAeg()).vanusKuudes();
        int vanaHind = varuosa.getTeenuseHind();
        double langetusProtsent;
//        if (vanus < 18) {
//            langetusProtsent = 0;
//        } else if (vanus <= 30) {
//            langetusProtsent = 0.25;
//        } else if (vanus <= 42) {
//            langetusProtsent = 0.5;
//        } else {
//            langetusProtsent = 0.75;
//        }
        if (vanus < 18) {
            langetusProtsent = 0;
        } else if (vanus <= 30 && varuosa.getKogus() > 2) {
            langetusProtsent = 0.25;
        } else if (vanus <= 42 && varuosa.getKogus() > 1) {
            langetusProtsent = 0.5;
        } else {
            langetusProtsent = 0.75;
        }
        return uueHinnaArvutaja(vanaHind, langetusProtsent);
    }

    private static int uueHinnaArvutaja(int vanaHind, double langetusProtsent) {
        int uusHind = (int) ((vanaHind + 1 ) - (vanaHind * langetusProtsent)) - 1;
        if (uusHind < 10) {
            uusHind = 9;
        }
        if (uusHind % 10 == 9 || uusHind % 10 == 4) {
            return uusHind;
        } else if (uusHind % 10 < 4) {
            uusHind += 4 - (uusHind % 10);
        } else {
            uusHind += 9 - (uusHind % 10);
        }
        return uusHind;
    }

}
