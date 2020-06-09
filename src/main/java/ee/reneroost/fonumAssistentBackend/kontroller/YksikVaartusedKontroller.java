package ee.reneroost.fonumAssistentBackend.kontroller;

import ee.reneroost.fonumAssistentBackend.olem.YksikVaartused;
import ee.reneroost.fonumAssistentBackend.teenus.YksikVaartusedTeenus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class YksikVaartusedKontroller {

    @Autowired
    private YksikVaartusedTeenus yksikVaartusedTeenus;

    @GetMapping("/yksikvaartused")
    public List<YksikVaartused> saaYksikVaartused() {
        return yksikVaartusedTeenus.saaYksikVaartused();
    }


}
