package ee.reneroost.fonumAssistentBackend.teenus;

import ee.reneroost.fonumAssistentBackend.olem.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class VaruosaJaotusTeenus {

    @Autowired
    private EsindusTeenus esindusTeenus;
    @Autowired
    private VaruosaTeenus varuosaTeenus;
    @Autowired
    private PrioriteetsusTeenus prioriteetsusTeenus;

    public List<JaotusJuhis> saaJaotusJuhisedKoik() {
        List<JaotusJuhis> jaotusJuhised = new ArrayList<>();

        List<Esindus> esindused = esindusTeenus.saaEsindused();
        List<Varuosa> varuosad = varuosaTeenus.saaVaruosad();
        List<Prioriteetsus> prioriteetsused = prioriteetsusTeenus.saaPrioriteetsused();
        for (Varuosa varuosa : varuosad) {
            List<Integer> jaotus = Arrays.asList(
                    varuosa.getKogusKristiineKeskuses(),
                    varuosa.getKogusViruKeskuses(),
                    varuosa.getKogusLounaKeskuses());

            // Leiab vastava seadmetootja jaoks esinduste järjekorra
            Prioriteetsus prioriteetsus = prioriteetsused.get(0);
            for (Prioriteetsus otsitavPrioriteetsus : prioriteetsused) {
                if (otsitavPrioriteetsus.getTootja().equals(varuosa.getTootja())) {
                    prioriteetsus = otsitavPrioriteetsus;
                }
            }

            // Moodustab esinduste järjekorra
            List<String> esindustePrioriteetsusJarjestus = Arrays.asList(
                    prioriteetsus.getEsimeneEsindus(),
                    prioriteetsus.getTeineEsindus(),
                    prioriteetsus.getKolmasEsindus());
            int[][] jaotusMaatriks = arvutaJaotusMaatriks(
                    esindused,
                    jaotus,
                    esindustePrioriteetsusJarjestus);

            for (int saatevEsindus = 0; saatevEsindus < jaotusMaatriks.length; saatevEsindus++) {
                for (int saavEsindus = 0; saavEsindus < jaotusMaatriks[saatevEsindus].length; saavEsindus++) {
                    if (jaotusMaatriks[saatevEsindus][saavEsindus] > 0) {
                        int kogus = jaotusMaatriks[saatevEsindus][saavEsindus];
                        JaotusJuhis jaotusjuhis = (new JaotusJuhis(
                                jaotusJuhised.size(),
                                varuosa.getId(),
                                saaJaotusJuhis(
                                        varuosa,
                                        jaotusMaatriks,
                                        esindused,
                                        saatevEsindus,
                                        saavEsindus),
                                kogus,
                                varuosa.getMudel(),
                                varuosa.getVaruosaLiik(),
                                esindused.get(saatevEsindus).getNimi(),
                                esindused.get(saatevEsindus).getNimiSeestytlev(),
                                esindused.get(saavEsindus).getNimi(),
                                esindused.get(saavEsindus).getNimiSisseytlev()
                        )
                        );
                        jaotusjuhis.setKogusKristiineKeskuses(varuosa.getKogusKristiineKeskuses());
                        jaotusjuhis.setKogusViruKeskuses(varuosa.getKogusViruKeskuses());
                        jaotusjuhis.setKogusLounaKeskuses(varuosa.getKogusLounaKeskuses());
                        if (saatevEsindus == 0) {
                            jaotusjuhis.setKogusKristiineKeskuses(varuosa.getKogusKristiineKeskuses() - kogus);
                        } else if (saatevEsindus == 1) {
                            jaotusjuhis.setKogusViruKeskuses(varuosa.getKogusViruKeskuses() - kogus);
                        } else if (saatevEsindus == 2) {
                            jaotusjuhis.setKogusLounaKeskuses(varuosa.getKogusLounaKeskuses() - kogus);
                        }
                        if (saavEsindus == 0) {
                            jaotusjuhis.setKogusKristiineKeskuses(varuosa.getKogusKristiineKeskuses() + kogus);
                        } else if (saavEsindus == 1) {
                            jaotusjuhis.setKogusViruKeskuses(varuosa.getKogusViruKeskuses() + kogus);
                        } else if (saavEsindus == 2) {
                            jaotusjuhis.setKogusLounaKeskuses(varuosa.getKogusLounaKeskuses() + kogus);
                        }
                        jaotusJuhised.add(jaotusjuhis);
                    }
                }
            }
        }
        return jaotusJuhised;
    }

    public List<JaotusJuhis> saaJaotusJuhisedEsinduseKohta(int saatevEsindus) {
        List<JaotusJuhis> jaotusJuhised = new ArrayList<>();

        List<Esindus> esindused = esindusTeenus.saaEsindused();
        List<Varuosa> varuosad = varuosaTeenus.saaVaruosad();
        List<Prioriteetsus> prioriteetsused = prioriteetsusTeenus.saaPrioriteetsused();
        if (saatevEsindus == 3) {
            jaotusJuhised = saaJaotusJuhisedKoik();
        } else {
            for (Varuosa varuosa : varuosad) {
                List<Integer> jaotus = Arrays.asList(
                        varuosa.getKogusKristiineKeskuses(),
                        varuosa.getKogusViruKeskuses(),
                        varuosa.getKogusLounaKeskuses());
                Prioriteetsus prioriteetsus = prioriteetsused.get(0);
                for (Prioriteetsus otsitavPrioriteetsus : prioriteetsused) {
                    if (otsitavPrioriteetsus.getTootja().equals(varuosa.getTootja())) {
                        prioriteetsus = otsitavPrioriteetsus;
                    }
                }
                List<String> esindustePrioriteetsusJarjestus = Arrays.asList(
                        prioriteetsus.getEsimeneEsindus(),
                        prioriteetsus.getTeineEsindus(),
                        prioriteetsus.getKolmasEsindus());
                int[][] jaotusMaatriks = arvutaJaotusMaatriks(
                        esindused,
                        jaotus,
                        esindustePrioriteetsusJarjestus);
                for (int saavEsindus = 0; saavEsindus < jaotusMaatriks[saatevEsindus].length; saavEsindus++) {
                    if (jaotusMaatriks[saatevEsindus][saavEsindus] > 0) {
                        int kogus = jaotusMaatriks[saatevEsindus][saavEsindus];
                        JaotusJuhis jaotusjuhis = (new JaotusJuhis(
                                        jaotusJuhised.size(),
                                        varuosa.getId(),
                                        saaJaotusJuhis(
                                                varuosa,
                                                jaotusMaatriks,
                                                esindused,
                                                saatevEsindus,
                                                saavEsindus),
                                        kogus,
                                        varuosa.getMudel(),
                                        varuosa.getVaruosaLiik(),
                                        esindused.get(saatevEsindus).getNimi(),
                                        esindused.get(saatevEsindus).getNimiSeestytlev(),
                                        esindused.get(saavEsindus).getNimi(),
                                        esindused.get(saavEsindus).getNimiSisseytlev()
                                )
                        );
                        jaotusjuhis.setKogusKristiineKeskuses(varuosa.getKogusKristiineKeskuses());
                        jaotusjuhis.setKogusViruKeskuses(varuosa.getKogusViruKeskuses());
                        jaotusjuhis.setKogusLounaKeskuses(varuosa.getKogusLounaKeskuses());
                        if (saatevEsindus == 0) {
                            jaotusjuhis.setKogusKristiineKeskuses(varuosa.getKogusKristiineKeskuses() - kogus);
                        } else if (saatevEsindus == 1) {
                            jaotusjuhis.setKogusViruKeskuses(varuosa.getKogusViruKeskuses() - kogus);
                        } else if (saatevEsindus == 2) {
                            jaotusjuhis.setKogusLounaKeskuses(varuosa.getKogusLounaKeskuses() - kogus);
                        }
                        if (saavEsindus == 0) {
                            jaotusjuhis.setKogusKristiineKeskuses(varuosa.getKogusKristiineKeskuses() + kogus);
                        } else if (saavEsindus == 1) {
                            jaotusjuhis.setKogusViruKeskuses(varuosa.getKogusViruKeskuses() + kogus);
                        } else if (saavEsindus == 2) {
                            jaotusjuhis.setKogusLounaKeskuses(varuosa.getKogusLounaKeskuses() + kogus);
                        }
                        jaotusJuhised.add(jaotusjuhis);
                    }
                }
            }
        }
        return jaotusJuhised;
    }

    private static int[][] arvutaJaotusMaatriks(
            List<Esindus> esindused,
            List<Integer> jaotusPraegu,
            List<String> esindustePrioriteetsusJarjestus) {
        int varuosadeHulk = jaotusPraegu.stream().mapToInt(Integer::intValue).sum();
        int esindusteHulk = esindused.size();
        int[] erinevus = new int[esindusteHulk];
        int[][] saatmisMaatriks = new int[esindusteHulk][esindusteHulk];
        int[] jaotusUus = arvutaKogused(
                arvutaPrioriteetsus(
                        esindused,
                        esindustePrioriteetsusJarjestus), varuosadeHulk);
        for (int i = 0; i < esindusteHulk; i++) {
            erinevus[i] = jaotusPraegu.get(i) - jaotusUus[i];
        }
        while (!(erinevus[0] == 0 && erinevus[1] == 0 && erinevus[2] == 0)) {
            // i == puudu, j == üle;
            for (int i = 0; i < esindusteHulk; i++) {
                if (erinevus[i] < 0) {
                    for (int j = 0; j < esindusteHulk; j++) {
                        if (erinevus[j] > 0) {
                            if (Math.abs(erinevus[i]) == Math.abs(erinevus[j])) {
                                saatmisMaatriks[i][j] = erinevus[i];
                                saatmisMaatriks[j][i] = erinevus[j];
                                erinevus[i] = erinevus[j] = 0;
                            } else if (Math.abs(erinevus[i]) > Math.abs(erinevus[j])) {
                                saatmisMaatriks[i][j] = -(erinevus[j]);
                                saatmisMaatriks[j][i] = erinevus[j];
                                erinevus[i] += erinevus[j];
                                erinevus[j] = 0;
                            } else if (Math.abs(erinevus[i]) < Math.abs(erinevus[j])) {
                                saatmisMaatriks[i][j] = erinevus[i];
                                saatmisMaatriks[j][i] = -(erinevus[i]);
                                erinevus[j] += erinevus[i];
                                erinevus[i] = 0;
                            }
                        }
                    }
                }
            }
        }
        return saatmisMaatriks;
    }

    private String saaJaotusJuhis(
            Varuosa varuosa,
            int[][] jaotusMaatriks,
            List<Esindus> esindused,
            int saatevEsindus,
            int saavEsindus) {

        return "Saata " + jaotusMaatriks[saatevEsindus][saavEsindus] + " " +
                varuosa.getMudel() + " " +
                varuosa.getVaruosaLiik() + " " +
                esindused.get(saatevEsindus).getNimiSeestytlev() + " " +
                esindused.get(saavEsindus).getNimiSisseytlev() + ".";
    }

    private static int[] arvutaPrioriteetsus(
            List<Esindus> esindused,
            List<String> esindustePrioriteetsusJarjestus) {
        int esindusteHulk = esindused.size();
        int[] jarjekord = new int[esindusteHulk];
        for (int i = 0; i < esindusteHulk; i++) {
            for (int j = 0; j < esindusteHulk; j++) {
                if (esindused.get(i).getNimi().equals(esindustePrioriteetsusJarjestus.get(j))) {
                    jarjekord[j] = i;
                }
            }
        }
        return jarjekord;
    }

    private static int[] arvutaKogused(int[] prioriteetsusJarjestus, int kogus) {
        int esindusteHulk = prioriteetsusJarjestus.length;
        int[] kogused = new int[esindusteHulk];
        int jareleJaanudKogus = kogus;
        // Siin saab muuta maks kogust mitteprioriteetsel, praegu 3
        if (kogus <= 3 * esindusteHulk) {
            for (int i = 0; i < esindusteHulk; i++) {
                kogused[i] = kogus / esindusteHulk;
            }
            jareleJaanudKogus -= esindusteHulk * kogused[0];
            int i = 0;
            while (jareleJaanudKogus > 0) {
                kogused[prioriteetsusJarjestus[i]] += 1;
                jareleJaanudKogus--;
                i++;
            }
        } else {
            for (int i = 0; i < prioriteetsusJarjestus.length; i++) {
                kogused[i] = 3;
            }
            jareleJaanudKogus -= 3 * esindusteHulk;
            kogused[prioriteetsusJarjestus[0]] += jareleJaanudKogus;
        }
        return kogused;
    }
}
