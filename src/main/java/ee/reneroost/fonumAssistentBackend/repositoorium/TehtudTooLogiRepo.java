package ee.reneroost.fonumAssistentBackend.repositoorium;

import ee.reneroost.fonumAssistentBackend.olem.TehtudTooLogi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin
@RepositoryRestResource(collectionResourceRel = "tehtudtoologi", path = "tehtudtoologi")
public interface TehtudTooLogiRepo extends JpaRepository<TehtudTooLogi, Integer> {
}
