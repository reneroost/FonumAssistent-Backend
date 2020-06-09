package ee.reneroost.fonumAssistentBackend.olem;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "yksik_vaartused")
@Data
public class YksikVaartused {

    @Id
    private String id;

    private int piirPehme;
    private int piirKriitiline;
}
