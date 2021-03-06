package ee.reneroost.fonumAssistentBackend.olem;

import lombok.Data;

import javax.persistence.*;
import java.util.Arrays;
import java.util.List;

@Entity
@Table(name = "varuosa")
@Data
public class Varuosa {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String tootja;
    private String mudel;
    private String valjatulekuAeg;
    private int hinnaMuutusteHulk;
    private String varuosaLiik;
    private String varuosaLiikTeenus;
    private float artikliHind;
    private int teenuseHind;
    private int kogus;
    private int kogusKristiineKeskuses;
    private int kogusViruKeskuses;
    private int kogusLounaKeskuses;
}
