package ee.reneroost.fonumAssistentBackend.olem;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "esindus")
@Data
public class Esindus {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nimi;
    private String nimiLyhend;
    private String nimiSisseytlev;
    private String nimiSeesytlev;
    private String nimiSeestytlev;
    private String asukoht;
}
