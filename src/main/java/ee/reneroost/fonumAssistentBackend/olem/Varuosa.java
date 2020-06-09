package ee.reneroost.fonumAssistentBackend.olem;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "varuosa")
@Data
public class Varuosa {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String tootja;
    private String mudel;
    private String varuosaLiik;
    private float artikliHind;
    private float teenuseHind;
    private int kogus;
    private int kogusKristiineKeskuses;
    private int kogusViruKeskuses;
    private int kogusLounaKeskuses;
}
