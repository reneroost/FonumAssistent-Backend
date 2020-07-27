package ee.reneroost.fonumAssistentBackend.repositoorium;

import ee.reneroost.fonumAssistentBackend.olem.Prioriteetsus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin
@RepositoryRestResource(collectionResourceRel = "jaotusprioriteetsused", path = "jaotusprioriteetsused")
public interface PrioriteetsusRepo extends JpaRepository<Prioriteetsus, Integer> {
}
