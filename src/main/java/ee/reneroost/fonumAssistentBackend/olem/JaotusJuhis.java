package ee.reneroost.fonumAssistentBackend.olem;

import lombok.Data;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Data
public class JaotusJuhis {

    private int id;
    private int varuosaId;
    private String jaotusJuhis;
    private int kogus;
    private String mudel;
    private String varuosaLiik;
    private String saatevEsindus;
    private String saatevEsindusSeest;
    private String saavEsindus;
    private String saavEsindusSisse;
    private int kogusKristiineKeskuses;
    private int kogusViruKeskuses;
    private int kogusLounaKeskuses;

    public JaotusJuhis(int id, int varuosaId, String jaotusJuhis, int kogus, String mudel, String varuosaLiik, String saatevEsindus, String saatevEsindusSeest, String saavEsindus, String saavEsindusSisse) {
        this.id = id;
        this.varuosaId = varuosaId;
        this.jaotusJuhis = jaotusJuhis;
        this.kogus = kogus;
        this.mudel = mudel;
        this.varuosaLiik = varuosaLiik;
        this.saatevEsindus = saatevEsindus;
        this.saatevEsindusSeest = saatevEsindusSeest;
        this.saavEsindus = saavEsindus;
        this.saavEsindusSisse = saavEsindusSisse;
    }

    public JaotusJuhis(int id, int varuosaId, String jaotusJuhis, int kogus, String mudel, String varuosaLiik, String saatevEsindus, String saatevEsindusSeest, String saavEsindus, String saavEsindusSisse, int kogusKristiineKeskuses, int kogusViruKeskuses, int kogusLounaKeskuses) {
        this.id = id;
        this.varuosaId = varuosaId;
        this.jaotusJuhis = jaotusJuhis;
        this.kogus = kogus;
        this.mudel = mudel;
        this.varuosaLiik = varuosaLiik;
        this.saatevEsindus = saatevEsindus;
        this.saatevEsindusSeest = saatevEsindusSeest;
        this.saavEsindus = saavEsindus;
        this.saavEsindusSisse = saavEsindusSisse;
        this.kogusKristiineKeskuses = kogusKristiineKeskuses;
        this.kogusViruKeskuses = kogusViruKeskuses;
        this.kogusLounaKeskuses = kogusLounaKeskuses;
    }
}
