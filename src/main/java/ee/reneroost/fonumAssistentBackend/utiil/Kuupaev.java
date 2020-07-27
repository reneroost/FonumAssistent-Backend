package ee.reneroost.fonumAssistentBackend.utiil;

import java.time.LocalDate;

public class Kuupaev {

    private int aasta;
    private int kuu;

    public Kuupaev(int aasta, int kuu) {
        this.aasta = aasta;
        this.kuu = kuu;
    }

    public Kuupaev(String aastaJaKuu) {
        this.aasta = Integer.parseInt(aastaJaKuu.substring(0,4));
        this.kuu = Integer.parseInt(aastaJaKuu.substring(5,7));
    }

    public int vanusKuudes() {
        int praeguneAasta = LocalDate.now().getYear();
        int praeguneKuu = LocalDate.now().getMonthValue();
        int vanusAastat = praeguneAasta - this.aasta;
        int vanusKuud = praeguneKuu - this.kuu;
        return vanusAastat * 12 + vanusKuud;
    }
}
