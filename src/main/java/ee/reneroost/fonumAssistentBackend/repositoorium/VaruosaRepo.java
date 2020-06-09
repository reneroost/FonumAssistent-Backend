package ee.reneroost.fonumAssistentBackend.repositoorium;

import ee.reneroost.fonumAssistentBackend.olem.Varuosa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

//@CrossOrigin("http://localhost:4200")
@CrossOrigin
@RepositoryRestResource(collectionResourceRel = "varuosad", path = "varuosad")
public interface VaruosaRepo extends JpaRepository<Varuosa, Integer> {
    Varuosa findByMudel(String mudel);
}
