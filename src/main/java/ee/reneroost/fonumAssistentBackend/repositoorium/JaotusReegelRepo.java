package ee.reneroost.fonumAssistentBackend.repositoorium;

import ee.reneroost.fonumAssistentBackend.olem.JaotusReegel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin
@RepositoryRestResource(collectionResourceRel = "jaotusreeglid", path = "jaotusreeglid")
public interface JaotusReegelRepo extends JpaRepository<JaotusReegel, Integer> {}
