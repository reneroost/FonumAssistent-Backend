package ee.reneroost.fonumAssistentBackend.olem;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "yksik_vaartused")
@Data
public class YksikVaartused {

    @Id
    private String id;

    private int piirLeebe;
    private int piirKriitiline;
    private int piirVanus;
}
