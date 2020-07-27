package ee.reneroost.fonumAssistentBackend.konfiguratsioon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;

import javax.persistence.EntityManager;
import javax.persistence.metamodel.EntityType;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Configuration
public class MinuAndmeteRestKonfiguratsioon implements RepositoryRestConfigurer {

    private EntityManager olemiHaldur;

    @Autowired
    public MinuAndmeteRestKonfiguratsioon(EntityManager olemiHaldur) {
        this.olemiHaldur = olemiHaldur;
    }

    @Override
    public void configureRepositoryRestConfiguration(RepositoryRestConfiguration konfig) {
        paljastaIDd(konfig);
    }

    private void paljastaIDd(RepositoryRestConfiguration konfig) {
        Set<EntityType<?>> olemid = olemiHaldur.getMetamodel().getEntities();

        List<Class> olemiKlassid = new ArrayList<>();

        for (EntityType ajutineOlemiTyyp: olemid) {
            olemiKlassid.add(ajutineOlemiTyyp.getJavaType());
        }

        Class[] domeeniTyybid = olemiKlassid.toArray(new Class[0]);
        konfig.exposeIdsFor(domeeniTyybid);
    }

}
