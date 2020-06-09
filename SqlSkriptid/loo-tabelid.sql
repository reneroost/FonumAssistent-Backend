DROP SCHEMA IF EXISTS fonum_andmebaas;

CREATE SCHEMA fonum_andmebaas;
USE fonum_andmebaas;

-- ------------------------------------------
-- Tabel `varuosa_liik`
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
    varuosa_liik VARCHAR(255) DEFAULT NULL,
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
-- Tabel `esindus`
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
-- Tabel `prioriteetsus`
-- ------------------------------------------
CREATE TABLE IF NOT EXISTS fonum_andmebaas.prioriteetsus (
    tootja VARCHAR(255) DEFAULT NULL,
    esimene INT DEFAULT NULL,
    teine INT DEFAULT NULL,
    kolmas INT DEFAULT NULL
)
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS fonum_andmebaas.yksik_vaartused (
	id char(1) NOT NULL DEFAULT 'X',
	piir_pehme INT DEFAULT (5),
    piir_kriitiline INT DEFAULT (2),
    constraint PK_T1 PRIMARY KEY (id),
    constraint CK_T1_Locked CHECK (id='X')
)
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- ------------------------------------------
-- Tabeli `varuosa_liik` täitmine
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
-- Tabeli `esindus` täitmine
-- ------------------------------------------
INSERT INTO esindus (nimi, nimi_lyhend, nimi_sisseytlev, nimi_seesytlev, nimi_seestytlev, asukoht)
VALUES ('Kristiine keskus', 'KRIS', 'Kristiine keskusesse', 'Kristiine keskuses', 'Kristiine keskusest', 'Tallinn');
INSERT INTO esindus (nimi, nimi_lyhend, nimi_sisseytlev, nimi_seesytlev, nimi_seestytlev, asukoht)
VALUES ('Viru keskus', 'VIRU', 'Viru keskusesse', 'Viru keskuses', 'Viru keskusest', 'Tallinn');
INSERT INTO esindus (nimi, nimi_lyhend, nimi_sisseytlev, nimi_seesytlev, nimi_seestytlev, asukoht)
VALUES ('Lõunakeskus', 'LÕKE', 'Lõunakeskusesse', 'Lõunakeskuses', 'Lõunakeskusest', 'Tartu');

INSERT INTO yksik_vaartused (piir_pehme, piir_kriitiline)
VALUES (5, 2);

-- ------------------------------------------
-- Tabel `varuosa` täitmine
-- ------------------------------------------
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 11', 'Akukaas', 47.34, 99, 14, 7, 4, 3, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 11 Pro', 'Sõrmejäljelugeja', 43.16, 69, 25, 11, 6, 8, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 11 Pro', 'Kõlar', 32.42, 69, 7, 4, 2, 1, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 11 Pro', 'Tagakaamera', 51.83, 129, 12, 9, 1, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 11 Pro', 'Kuular', 45.46, 89, 25, 14, 4, 7, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 5', 'Kaitsekorpus', 17.28, 29, 3, 2, 1, 0, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 5S', 'Aku', 52.38, 99, 10, 8, 0, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 5S', 'Kuular', 26.05, 59, 14, 10, 1, 3, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 6', 'Ekraan', 83.96, 139, 28, 18, 5, 5, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 6', 'Akukaas', 35.11, 79, 3, 2, 1, 0, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 6', 'Laadimispesa', 30.96, 69, 7, 4, 1, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 6S Plus', 'Kaitsekorpus', 23.18, 39, 2, 2, 0, 0, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 6S Plus', 'Sõrmejäljelugeja', 28.73, 49, 13, 8, 4, 1, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 7 Plus', 'Tagakaamera', 62.47, 99, 1, 0, 0, 1, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone 8', 'Kõlar', 26.83, 49, 0, 0, 0, 0, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone X', 'Kõlar', 46.54, 69, 7, 5, 1, 1, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone X', 'Kaitsekorpus', 21.3, 49, 22, 11, 7, 4, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone XR', 'Kõlar', 24.85, 49, 5, 2, 1, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone XS', 'Kaitsekorpus', 29.94, 49, 7, 5, 0, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Apple', 'iPhone XS Max', 'Kuular', 38.02, 89, 9, 7, 1, 1, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'Mate 10 lite', 'Tagakaamera', 27.3, 39, 16, 8, 4, 4, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'Mate 20', 'Kuular', 19.88, 49, 23, 16, 2, 5, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'Mate 20', 'Tagakaamera', 44.7, 79, 19, 12, 4, 3, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'Mate 20', 'Aku', 57.51, 89, 20, 14, 1, 5, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'Mate 20 Pro', 'Sõrmejäljelugeja', 32.35, 59, 25, 16, 4, 5, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'Mate 20 X', 'Aku', 62.87, 139, 20, 12, 2, 6, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'Mate 20 lite', 'Akukaas', 19.46, 39, 22, 18, 1, 3, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'Mate 30', 'Akukaas', 55.66, 89, 15, 11, 2, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'Mate 30 Pro', 'Kõlar', 32.83, 69, 21, 11, 6, 4, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P smart Z', 'Kõlar', 8.96, 19, 17, 10, 3, 4, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P smart Z', 'Kaitseklaas', 5.01, 9, 19, 14, 2, 3, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P10', 'Ekraan', 69.49, 129, 13, 10, 1, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P10 lite', 'Kaitsekorpus', 7.65, 19, 4, 2, 0, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P10 lite', 'Tagakaamera', 21.22, 39, 4, 2, 2, 0, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P10 lite', 'Ekraan', 28.83, 59, 16, 10, 3, 3, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P20 lite', 'Kõlar', 11.51, 19, 14, 7, 2, 5, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P20 lite', 'Sõrmejäljelugeja', 9.73, 19, 20, 16, 2, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P30', 'Aku', 52.99, 99, 10, 2, 4, 4, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P30 Pro', 'Sõrmejäljelugeja', 27.1, 59, 13, 10, 2, 1, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P30 Pro', 'Aku', 65.78, 129, 13, 9, 2, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P40', 'Sõrmejäljelugeja', 19.76, 49, 29, 16, 3, 10, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Huawei', 'P40', 'Kuular', 34.01, 69, 12, 9, 1, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A01', 'Laadimispesa', 11.57, 19, 27, 16, 6, 5, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A01', 'Kõlar', 4.15, 9, 0, 0, 0, 0, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A11', 'Kaitsekorpus', 4.48, 9, 12, 9, 1, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A20s', 'Esikaamera', 9.27, 19, 16, 7, 4, 5, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A30', 'Tagakaamera', 20.11, 29, 14, 7, 5, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A30s', 'Laadimispesa', 12.34, 29, 16, 12, 3, 1, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A30s', 'Kuular', 10.57, 19, 10, 7, 0, 3, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A31', 'Kuular', 9.59, 19, 28, 19, 2, 7, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A40', 'Akukaas', 14.71, 29, 25, 17, 3, 5, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A41', 'Tagakaamera', 16.41, 39, 3, 1, 1, 1, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A50', 'Kuular', 15.29, 29, 12, 6, 2, 4, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A51', 'Ekraan', 34.51, 69, 21, 15, 3, 3, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A60', 'Aku', 26.97, 39, 23, 13, 5, 5, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A7', 'Aku', 20.07, 49, 23, 11, 8, 4, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A7', 'Ekraan', 29.81, 59, 16, 9, 2, 5, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A7', 'Kaitseklaas', 4.15, 9, 22, 14, 4, 4, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A70s', 'Akukaas', 26.78, 49, 27, 23, 2, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A8s', 'Aku', 27.27, 59, 16, 9, 4, 3, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A9', 'Kõlar', 14.56, 29, 3, 1, 0, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A9', 'Tagakaamera', 28.87, 49, 13, 7, 3, 3, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A9', 'Esikaamera', 19.24, 29, 24, 14, 6, 4, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A9', 'Aku', 28.8, 49, 27, 20, 3, 4, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A90', 'Kuular', 23.85, 49, 24, 14, 4, 6, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A90', 'Kaitsekorpus', 20.09, 29, 18, 8, 3, 7, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy A90', 'Ekraan', 77.82, 129, 17, 10, 3, 4, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy Fold', 'Kaitseklaas', 16.09, 29, 10, 6, 2, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy J4+', 'Kaitsekorpus', 4.5, 9, 9, 5, 2, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy J6+', 'Sõrmejäljelugeja', 10.06, 19, 18, 10, 4, 4, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy J6+', 'Aku', 23.1, 39, 17, 12, 3, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S10 5G', 'Esikaamera', 54.84, 99, 8, 7, 1, 0, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S10 5G', 'Sõrmejäljelugeja', 35.18, 79, 27, 19, 6, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S10 5G', 'Kaitsekorpus', 20.47, 49, 23, 16, 5, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S10+', 'Ekraan', 122.46, 219, 22, 8, 8, 6, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S10+', 'Sõrmejäljelugeja', 37.6, 69, 10, 6, 2, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S10e', 'Esikaamera', 26.4, 59, 9, 6, 3, 0, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S10e', 'Aku', 55.52, 99, 22, 13, 8, 1, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S20', 'Tagakaamera', 52.27, 109, 3, 1, 2, 0, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S20', 'Kaitsekorpus', 21.58, 39, 19, 15, 1, 3, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S8 Active', 'Kaitsekorpus', 17.68, 29, 5, 4, 1, 0, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S8+', 'Kaitsekorpus', 22.68, 39, 3, 2, 1, 0, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S9', 'Kaitseklaas', 11.05, 19, 4, 2, 0, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy S9+', 'Kaitsekorpus', 20.04, 49, 17, 13, 1, 3, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy Z Flip', 'Kõlar', 46.36, 79, 11, 9, 0, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Samsung', 'Galaxy Z Flip', 'Kuular', 74.75, 109, 0, 0, 0, 0, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi 7', 'Tagakaamera', 9.59, 19, 7, 4, 1, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi 8', 'Kõlar', 8.42, 19, 7, 3, 3, 1, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi 8', 'Sõrmejäljelugeja', 9.49, 19, 29, 16, 6, 7, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi 8', 'Kaitsekorpus', 6.17, 9, 22, 13, 4, 5, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi Note 6 Pro', 'Kuular', 12.26, 19, 5, 3, 2, 0, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi Note 6 Pro', 'Kaitsekorpus', 6.25, 9, 16, 9, 3, 4, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi Note 7', 'Kaitsekorpus', 4.93, 9, 20, 15, 2, 3, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi Note 7S', 'Kuular', 8.91, 19, 9, 8, 0, 1, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi Note 7S', 'Laadimispesa', 10.34, 19, 17, 9, 7, 1, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi Note 7S', 'Kaitseklaas', 3.88, 9, 3, 1, 1, 1, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi Note 8', 'Esikaamera', 11.29, 19, 10, 5, 2, 3, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi Note 8', 'Tagakaamera', 17.73, 29, 4, 2, 0, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi Note 8T', 'Kaitsekorpus', 4.13, 9, 21, 15, 4, 2, 1);
INSERT INTO varuosa (tootja, mudel, varuosa_liik, artikli_hind, teenuse_hind,
kogus, kogus_kristiine_keskuses, kogus_viru_keskuses, kogus_louna_keskuses, varuosa_liik_id)
VALUES ('Xiaomi', 'Redmi Note 9 Pro', 'Esikaamera', 9.5, 19, 17, 7, 6, 4, 1);
