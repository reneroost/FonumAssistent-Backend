package ee.reneroost.fonumAssistentBackend.repositoorium;

import ee.reneroost.fonumAssistentBackend.olem.YksikVaartused;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin
@RepositoryRestResource(collectionResourceRel = "yksikvaartused", path = "yksikvaartused")
public interface YksikVaartusedRepo extends JpaRepository<YksikVaartused, Integer> {

}
