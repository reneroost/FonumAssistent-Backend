package ee.reneroost.fonumAssistentBackend.olem;

import lombok.Data;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Data
public class TehtudToodeKogus {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String tootja;
    private String mudel;
    private String varuosaLiik;
    private String varuosaLiikTeenus;
    private double artikliHind;
    private int teenuseHind;
    private int kogused;

    public TehtudToodeKogus(TehtudTooLogi tooLogi) {
        this.tootja = tooLogi.getTootja();
        this.mudel = tooLogi.getMudel();
        this.varuosaLiik = tooLogi.getVaruosaLiik();
        this.varuosaLiikTeenus = tooLogi.getVaruosaLiikTeenus();
        this.artikliHind = tooLogi.getArtikliHind();
        this.teenuseHind = tooLogi.getTeenuseHind();
        this.kogused = 1;
    }
}
