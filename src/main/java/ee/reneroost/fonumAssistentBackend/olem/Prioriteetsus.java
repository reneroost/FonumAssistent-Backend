package ee.reneroost.fonumAssistentBackend.olem;

import lombok.Data;

import javax.persistence.*;
import java.util.Arrays;
import java.util.List;

@Entity
@Table(name = "prioriteetsus")
//@Data
public class Prioriteetsus {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String tootja;
    private String esimeneEsindus;
    private String teineEsindus;
    private String kolmasEsindus;

    public String getTootja() {
        return tootja;
    }

    public String getEsimeneEsindus() {
        return esimeneEsindus;
    }

    public String getTeineEsindus() {
        return teineEsindus;
    }

    public String getKolmasEsindus() {
        return kolmasEsindus;
    }
}
