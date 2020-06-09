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
}
