package ee.reneroost.fonumAssistentBackend.teenus;

import ee.reneroost.fonumAssistentBackend.olem.Prioriteetsus;
import ee.reneroost.fonumAssistentBackend.repositoorium.PrioriteetsusRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PrioriteetsusTeenus {

    @Autowired
    private PrioriteetsusRepo prioriteetsusRepo;

    public List<Prioriteetsus> saaPrioriteetsused() {
        return prioriteetsusRepo.findAll();
    }
}
