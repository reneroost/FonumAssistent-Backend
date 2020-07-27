package ee.reneroost.fonumAssistentBackend.kontroller;

import ee.reneroost.fonumAssistentBackend.olem.JaotusJuhis;
import ee.reneroost.fonumAssistentBackend.teenus.VaruosaJaotusTeenus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class VaruosaJaotusKontroller {

    @Autowired
    private VaruosaJaotusTeenus varuosaJaotusTeenus;

    @GetMapping("/varuosaJaotusedEsinduseKohta/{valitudEsindus}")
    public List<JaotusJuhis> saaVaruosaJaotusedEsinduseKohta(@PathVariable int valitudEsindus) {
        return varuosaJaotusTeenus.saaJaotusJuhisedEsinduseKohta(valitudEsindus);
    }
}
