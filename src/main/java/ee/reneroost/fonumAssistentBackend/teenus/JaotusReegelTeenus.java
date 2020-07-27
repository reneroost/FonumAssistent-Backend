package ee.reneroost.fonumAssistentBackend.teenus;

import ee.reneroost.fonumAssistentBackend.olem.JaotusReegel;
import ee.reneroost.fonumAssistentBackend.repositoorium.JaotusReegelRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JaotusReegelTeenus {

    @Autowired
    private JaotusReegelRepo jaotusReegelRepo;

    public List<JaotusReegel> saaJaotusReeglid() {
        return jaotusReegelRepo.findAll();
    }
}
