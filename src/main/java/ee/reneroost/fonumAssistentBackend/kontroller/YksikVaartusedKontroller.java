package ee.reneroost.fonumAssistentBackend.kontroller;

import ee.reneroost.fonumAssistentBackend.olem.YksikVaartused;
import ee.reneroost.fonumAssistentBackend.teenus.YksikVaartusedTeenus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
public class YksikVaartusedKontroller {

    @Autowired
    private YksikVaartusedTeenus yksikVaartusedTeenus;

    @GetMapping("/yksikVaartused")
    public List<YksikVaartused> saaYksikVaartused() {
        return yksikVaartusedTeenus.saaYksikVaartused();
    }

    @PutMapping("/muudaYksikVaartused")
    public YksikVaartused muudaYksikVaartused(@RequestBody YksikVaartused yksikVaartused) {
        return yksikVaartusedTeenus.muudaYksikVaartused(yksikVaartused);
    }

    @GetMapping("/muudaPiirVanus/{uusPiirVanus}")
    public YksikVaartused muudaPiirVanus(@PathVariable int uusPiirVanus) {
        return yksikVaartusedTeenus.muudaPiirVanus(uusPiirVanus);
    }

}
