DROP SCHEMA IF EXISTS fonum_andmebaas;

CREATE SCHEMA fonum_andmebaas;
USE fonum_andmebaas;

-- ------------------------------------------
-- Tabel varuosa_liik
-- ------------------------------------------
CREATE TABLE IF NOT EXISTS fonum_andmebaas.varuosa_liik (
    id BIGINT NOT NULL AUTO_INCREMENT,
    liigi_nimi VARCHAR(255) NULL DEFAULT NULL,
    PRIMARY KEY (id)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1;

-- ------------------------------------------
-- Tabel varuosa
-- ------------------------------------------
CREATE TABLE IF NOT EXISTS fonum_andmebaas.varuosa (
    id BIGINT NOT NULL AUTO_INCREMENT,
    tootja VARCHAR(255) DEFAULT NULL,
    mudel VARCHAR(255) DEFAULT NULL,
    valjatuleku_aeg VARCHAR(255) DEFAULT NULL,
    hinna_muutuste_hulk INT DEFAULT NULL,
    varuosa_liik VARCHAR(255) DEFAULT NULL,
    varuosa_liik_teenus VARCHAR(255) DEFAULT NULL,
    artikli_hind DECIMAL(9, 2) DEFAULT NULL,
    teenuse_hind INT DEFAULT NULL,
    kogus INT DEFAULT NULL,
    kogus_kristiine_keskuses INT DEFAULT NULL,
    kogus_viru_keskuses INT DEFAULT NULL,
    kogus_louna_keskuses INT DEFAULT NULL,
    varuosa_liik_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (varuosa_liik_id) REFERENCES varuosa_liik(id)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1;

-- ------------------------------------------
-- Tabel esindus
-- ------------------------------------------
CREATE TABLE IF NOT EXISTS fonum_andmebaas.esindus (
    id BIGINT NOT NULL AUTO_INCREMENT,
    nimi VARCHAR(255) DEFAULT NULL,
    nimi_lyhend VARCHAR(255) DEFAULT NULL,
    nimi_sisseytlev VARCHAR(255) DEFAULT NULL,
    nimi_seesytlev VARCHAR(255) DEFAULT NULL,
    nimi_seestytlev VARCHAR(255) DEFAULT NULL,
    asukoht VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (id)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1;

-- ------------------------------------------
-- Tabel prioriteetsus
-- ------------------------------------------
CREATE TABLE IF NOT EXISTS fonum_andmebaas.prioriteetsus (
	id BIGINT NOT NULL AUTO_INCREMENT,
    tootja VARCHAR(255) DEFAULT NULL,
    esimene_esindus VARCHAR(255) DEFAULT NULL,
    teine_esindus VARCHAR(255) DEFAULT NULL,
    kolmas_esindus VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY(id)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1;

-- ------------------------------------------
-- Tabel jaotus_reegel
-- ------------------------------------------
CREATE TABLE IF NOT EXISTS fonum_andmebaas.jaotus_reegel (
	id BIGINT NOT NULL AUTO_INCREMENT,
    esimene_jaotus INT DEFAULT NULL,
    teine_jaotus INT DEFAULT NULL,
    kolmas_jaotus INT DEFAULT NULL,
    PRIMARY KEY (id)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1;

-- ------------------------------------------
-- Tabel yksik_vaartused
-- ------------------------------------------

CREATE TABLE IF NOT EXISTS fonum_andmebaas.yksik_vaartused (
	id char(1) NOT NULL DEFAULT 'X',
	piir_leebe INT DEFAULT (6),
    piir_kriitiline INT DEFAULT (3),
    piir_vanus INT DEFAULT (18),
    constraint PK_T1 PRIMARY KEY (id),
    constraint CK_T1_Locked CHECK (id='X')
)
ENGINE = InnoDB
AUTO_INCREMENT = 1;

-- ------------------------------------------
-- Tabel tehtud_too_logi
-- ------------------------------------------
CREATE TABLE IF NOT EXISTS fonum_andmebaas.tehtud_too_logi (
	id BIGINT NOT NULL AUTO_INCREMENT,
    tootja VARCHAR(255) DEFAULT NULL,
    mudel VARCHAR(255) DEFAULT NULL,
    varuosa_liik VARCHAR(255) DEFAULT NULL,
    varuosa_liik_teenus VARCHAR(255) DEFAULT NULL,
    artikli_hind DECIMAL(9, 2) DEFAULT NULL,
    teenuse_hind INT DEFAULT NULL,
    kogus INT DEFAULT NULL,
    tehtud_too_kp_kell VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (id)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- ------------------------------------------
-- Tabeli varuosa_liik täitmine
-- ------------------------------------------
INSERT INTO varuosa_liik (liigi_nimi) VALUES ('aku');
INSERT INTO varuosa_liik (liigi_nimi) VALUES ('akukaas');
INSERT INTO varuosa_liik (liigi_nimi) VALUES ('ekraan');
INSERT INTO varuosa_liik (liigi_nimi) VALUES ('esikaamera');
INSERT INTO varuosa_liik (liigi_nimi) VALUES ('kaamera');
INSERT INTO varuosa_liik (liigi_nimi) VALUES ('kaitseklaas');
INSERT INTO varuosa_liik (liigi_nimi) VALUES ('kuular');
INSERT INTO varuosa_liik (liigi_nimi) VALUES ('laadimispesa');

-- ------------------------------------------
-- Tabeli esindus täitmine
-- ------------------------------------------
INSERT INTO esindus (nimi, nimi_lyhend, nimi_sisseytlev, nimi_seesytlev, nimi_seestytlev, asukoht)
VALUES ('Kristiine keskus', 'KRIS', 'Kristiine keskusesse', 'Kristiine keskuses', 'Kristiine keskusest', 'Tallinn');
INSERT INTO esindus (nimi, nimi_lyhend, nimi_sisseytlev, nimi_seesytlev, nimi_seestytlev, asukoht)
VALUES ('Viru keskus', 'VIRU', 'Viru keskusesse', 'Viru keskuses', 'Viru keskusest', 'Tallinn');
INSERT INTO esindus (nimi, nimi_lyhend, nimi_sisseytlev, nimi_seesytlev, nimi_seestytlev, asukoht)
VALUES ('Lõunakeskus', 'LÕKE', 'Lõunakeskusesse', 'Lõunakeskuses', 'Lõunakeskusest', 'Tartu');

-- ------------------------------------------
-- Tabeli prioriteetsus täitmine
-- ------------------------------------------
INSERT INTO prioriteetsus(tootja, esimene_esindus, teine_esindus, kolmas_esindus)
VALUES ('Apple', 'Kristiine keskus', 'Lõunakeskus', 'Viru keskus');
INSERT INTO prioriteetsus(tootja, esimene_esindus, teine_esindus, kolmas_esindus)
VALUES ('Huawei', 'Viru keskus', 'Kristiine keskus', 'Lõunakeskus');
INSERT INTO prioriteetsus(tootja, esimene_esindus, teine_esindus, kolmas_esindus)
VALUES ('Samsung', 'Lõunakeskus', 'Kristiine keskus', 'Viru keskus');
INSERT INTO prioriteetsus(tootja, esimene_esindus, teine_esindus, kolmas_esindus)
VALUES ('Xiaomi', 'Viru keskus', 'Lõunakeskus', 'Kristiine keskus');

-- ------------------------------------------
-- Tabeli jaotus_reegel täitmine
-- ------------------------------------------
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (0, 0, 0);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (1, 0, 0);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (1, 1, 0);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (1, 1, 1);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (2, 1, 1);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (2, 2, 1);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (2, 2, 2);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (3, 2, 2);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (3, 3, 2);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (3, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (4, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (5, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (6, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (7, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (8, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (9, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (10, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (11, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (12, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (13, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (14, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (15, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (16, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (17, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (18, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (19, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (20, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (21, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (22, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (23, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (24, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (25, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (26, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (27, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (28, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (29, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (30, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (31, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (32, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (33, 3, 3);
INSERT INTO jaotus_reegel(esimene_jaotus, teine_jaotus, kolmas_jaotus) VALUES (34, 3, 3);

-- ------------------------------------------
-- Tabeli yksik_vaartused täitmine
-- ------------------------------------------
INSERT INTO yksik_vaartused (piir_leebe, piir_kriitiline, piir_vanus)
VALUES (6, 3, 18);

-- ------------------------------------------
-- Tabeli varuosa täitmine
-- ------------------------------------------
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 11', '2019-09', 0, 'Laadimispesa', 'Laadimispesa vahetus', 36.11, 89, 3, 3, 0, 0, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 11', '2019-09', 0, 'Tagakaamera', 'Tagakaamera vahetus', 30.67, 69, 6, 2, 0, 4, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 6', '2014-09', 0, 'Aku', 'Aku vahetus', 35.72, 69, 6, 4, 0, 2, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 6S', '2015-09', 0, 'Laadimispesa', 'Laadimispesa vahetus', 42.67, 69, 29, 17, 3, 9, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 6S', '2015-09', 0, 'Ekraan', 'Ekraani vahetus', 63.02, 139, 2, 1, 0, 1, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 6S Plus', '2015-09', 0, 'Ekraan', 'Ekraani vahetus', 105.23, 159, 24, 16, 7, 1, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 7', '2016-09', 0, 'Laadimispesa', 'Laadimispesa vahetus', 31.93, 69, 1, 0, 1, 0, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 7', '2016-09', 0, 'Ekraan', 'Ekraani vahetus', 86.1, 139, 27, 17, 4, 6, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone X', '2017-11', 0, 'Laadimispesa', 'Laadimispesa vahetus', 49.36, 109, 27, 20, 4, 3, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone X', '2017-11', 0, 'Esikaamera', 'Esikaamera vahetus', 39.49, 69, 15, 6, 7, 2, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone XR', '2018-10', 0, 'Laadimispesa', 'Laadimispesa vahetus', 34.0, 79, 27, 20, 6, 1, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'Mate 10 Pro', '2017-11', 0, 'Aku', 'Aku vahetus', 47.44, 79, 3, 2, 1, 0, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'Mate 20 Pro', '2018-11', 0, 'Ekraan', 'Ekraani vahetus', 126.6, 189, 16, 10, 6, 0, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'Mate 30', '2019-09', 0, 'Sõrmejäljelugeja', 'Sõrmejäljelugeja vahetus', 28.55, 49, 4, 2, 1, 1, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P smart 2019', '2018-12', 0, 'Kaitsekorpus', 'Kaitsekorpuse müük', 4.08, 9, 18, 12, 4, 2, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P smart 2019', '2018-12', 0, 'Esikaamera', 'Esikaamera vahetus', 13.05, 19, 13, 8, 2, 3, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P smart 2019', '2018-12', 0, 'Tagakaamera', 'Tagakaamera vahetus', 8.24, 19, 9, 8, 0, 1, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P30', '2019-03', 0, 'Kõlar', 'Kõlari vahetus', 33.58, 49, 13, 8, 2, 3, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P30 Pro', '2019-03', 0, 'Akukaas', 'Akukaane vahetus', 69.5, 109, 15, 10, 4, 1, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P40 Pro', '2020-04', 0, 'Tagakaamera', 'Tagakaamera vahetus', 36.94, 89, 23, 15, 6, 2, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A10', '2019-03', 0, 'Ekraan', 'Ekraani vahetus', 17.33, 29, 6, 3, 2, 1, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A10s', '2019-09', 0, 'Kaitsekorpus', 'Kaitsekorpuse müük', 4.31, 9, 19, 10, 2, 7, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A30', '2019-03', 0, 'Akukaas', 'Akukaane vahetus', 16.5, 29, 26, 21, 2, 3, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A31', '2020-04', 0, 'Ekraan', 'Ekraani vahetus', 26.52, 49, 2, 1, 1, 0, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A40', '2019-04', 0, 'Ekraan', 'Ekraani vahetus', 23.86, 39, 3, 2, 0, 1, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A41', '2020-06', 0, 'Kuular', 'Kuulari vahetus', 12.1, 29, 20, 13, 2, 5, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A6s', '2018-11', 0, 'Ekraan', 'Ekraani vahetus', 47.86, 69, 7, 4, 1, 2, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A7', '2018-10', 0, 'Kuular', 'Kuulari vahetus', 14.34, 29, 19, 15, 1, 3, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A70s', '2019-09', 0, 'Ekraan', 'Ekraani vahetus', 40.39, 79, 15, 11, 2, 2, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A80', '2019-05', 0, 'Kõlar', 'Kõlari vahetus', 15.56, 29, 24, 15, 6, 3, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A90', '2019-09', 0, 'Aku', 'Aku vahetus', 46.93, 69, 24, 15, 5, 4, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A90', '2019-09', 0, 'Kaitseklaas', 'Kaitseklaasi paigaldus', 9.75, 19, 8, 4, 1, 3, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy J3', '2018-06', 0, 'Aku', 'Aku vahetus', 9.4, 19, 10, 6, 0, 4, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy J4+', '2018-10', 0, 'Sõrmejäljelugeja', 'Sõrmejäljelugeja vahetus', 10.59, 19, 29, 16, 6, 7, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy J4+', '2018-10', 0, 'Aku', 'Aku vahetus', 12.44, 29, 9, 6, 2, 1, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S10', '2019-03', 0, 'Kuular', 'Kuulari vahetus', 49.13, 79, 26, 18, 5, 3, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S10 Lite', '2020-02', 0, 'Tagakaamera', 'Tagakaamera vahetus', 30.97, 49, 12, 7, 3, 2, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S10 Lite', '2020-02', 0, 'Kõlar', 'Kõlari vahetus', 20.05, 39, 1, 1, 0, 0, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S20 Ultra', '2020-03', 0, 'Kõlar', 'Kõlari vahetus', 45.37, 89, 18, 9, 5, 4, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S20+', '2020-03', 0, 'Esikaamera', 'Esikaamera vahetus', 45.2, 69, 19, 14, 3, 2, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S20+', '2020-03', 0, 'Akukaas', 'Akukaane vahetus', 86.26, 139, 10, 7, 2, 1, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S8+', '2017-04', 0, 'Kuular', 'Kuulari vahetus', 34.62, 79, 22, 9, 6, 7, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S9+', '2018-03', 0, 'Aku', 'Aku vahetus', 73.13, 109, 17, 8, 4, 5, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy Z Flip', '2020-02', 0, 'Tagakaamera', 'Tagakaamera vahetus', 64.08, 109, 14, 8, 5, 1, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy Z Flip', '2020-02', 0, 'Kuular', 'Kuulari vahetus', 72.69, 109, 26, 14, 7, 5, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi 7', '2019-03', 0, 'Kuular', 'Kuulari vahetus', 11.78, 19, 27, 17, 4, 6, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi 8', '2019-11', 0, 'Akukaas', 'Akukaane vahetus', 11.81, 19, 24, 13, 3, 8, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi Note 8', '2019-09', 0, 'Tagakaamera', 'Tagakaamera vahetus', 7.77, 19, 19, 10, 5, 4, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi Note 9 Pro', '2020-03', 0, 'Kaitsekorpus', 'Kaitsekorpuse müük', 6.14, 9, 29, 21, 5, 3, 1);
INSERT INTO varuosa (tootja, mudel, valjatuleku_aeg, hinna_muutuste_hulk, varuosa_liik, varuosa_liik_teenus, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi Note 9 Pro Max', '2020-04', 0, 'Akukaas', 'Akukaane vahetus', 15.64, 29, 12, 11, 0, 1, 1);