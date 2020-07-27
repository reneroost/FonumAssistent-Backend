package ee.reneroost.fonumAssistentBackend.teenus;

import ee.reneroost.fonumAssistentBackend.olem.YksikVaartused;
import ee.reneroost.fonumAssistentBackend.repositoorium.YksikVaartusedRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class YksikVaartusedTeenus {

    @Autowired
    private YksikVaartusedRepo yksikVaartusedRepo;

    public List<YksikVaartused> saaYksikVaartused() {
        return yksikVaartusedRepo.findAll();
    }

    public YksikVaartused muudaYksikVaartused(YksikVaartused yksikVaartused) {
        List<YksikVaartused> yksikVaartusedList = yksikVaartusedRepo.findAll();
        YksikVaartused eksisteerivYksikVaartused = yksikVaartusedList.get(0);
        eksisteerivYksikVaartused.setPiirKriitiline(yksikVaartused.getPiirKriitiline());
        eksisteerivYksikVaartused.setPiirLeebe(yksikVaartused.getPiirLeebe());
        return yksikVaartusedRepo.save(eksisteerivYksikVaartused);
    }

    public YksikVaartused muudaVanusePiiri(int uusPiir) {
        List<YksikVaartused> yksikVaartusedList = yksikVaartusedRepo.findAll();
        YksikVaartused eksisteerivYksikVaartused = yksikVaartusedList.get(0);
        eksisteerivYksikVaartused.setPiirVanus(uusPiir);
        return yksikVaartusedRepo.save(eksisteerivYksikVaartused);
    }

    public YksikVaartused muudaPiirVanus(int uusPiirVanus) {
        List<YksikVaartused> yksikVaartusedList = yksikVaartusedRepo.findAll();
        YksikVaartused eksisteerivYksikVaartused = yksikVaartusedList.get(0);
        eksisteerivYksikVaartused.setPiirVanus(uusPiirVanus);
        return yksikVaartusedRepo.save(eksisteerivYksikVaartused);
    }
}
