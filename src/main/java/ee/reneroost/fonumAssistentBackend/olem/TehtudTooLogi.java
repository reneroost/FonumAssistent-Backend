package ee.reneroost.fonumAssistentBackend.olem;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "tehtud_too_logi")
@Data
public class TehtudTooLogi {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String tootja;
    private String mudel;
    private String varuosaLiik;
    private String varuosaLiikTeenus;
    private double artikliHind;
    private int teenuseHind;
    private int kogus;
    private String tehtudTooKpKell;
}
