package ee.reneroost.fonumAssistentBackend.olem;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "jaotus_reegel")
@Data
public class JaotusReegel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private int esimeneJaotus;
    private int teineJaotus;
    private int kolmasJaotus;
}
