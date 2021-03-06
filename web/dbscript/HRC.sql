

Create Table KUNDE
(
KUNDENNR varchar(10) NOT NULL,
VORNAME varchar(255),
NACHNAME varchar(255),
EMAIL varchar(255) REFERENCES USER(EMAIL),
ORGANISATIONSNAME varchar(255),
STRASSE varchar(255),
HAUSNUMMER varchar(10),
PLZ varchar(10) REFERENCES ORTE(PLZ),
TELEFONNR varchar(255),
HANDYNR varchar(255),
PRIMARY KEY (KUNDENNR)
);

CREATE TABLE WARENKORB
(
KUNDENNR varchar(10) NOT NULL REFERENCES KUNDE(KUNDENNR),
WARENKORBPRODUKTNR varchar(10) REFERENCES WARENKORBPRODUKT(WARENKORBPRODUKTNR),
WARENKORBPAKETNR varchar(10) REFERENCES WARENKORBPAKET(WARENKORBPAKETNR),
PRIMARY KEY(KUNDENNR)
);

CREATE TABLE WARENKORBPRODUKT
(
WARENKORBPRODUKTNR varchar(10) NOT NULL,
PRODUKTNR varchar(10) NOT NULL REFERENCES PRODUKT(PRODUKTNR),
PRIMARY KEY(WARENKORBPRODUKTNR, PRODUKTNR)
);

CREATE TABLE WARENKORBPAKET
(
WARENKORBPAKETNR varchar(10) NOT NULL,
PAKETNR varchar(10) NOT NULL REFERENCES PAKET(PAKETNR),
PRIMARY KEY(WARENKORBPAKETNR, PAKETNR)
);

CREATE TABLE ORTE
(
PLZ varchar(10) NOT NULL,
Ort varchar(255),
PRIMARY KEY (PLZ)
);

Create Table MITARBEITER
(
MITARBEITERNR varchar(10) NOT NULL,
VORNAME varchar(255),
NACHNAME varchar(255),
EMAIL varchar(255) REFERENCES USER(EMAIL),
PRIMARY KEY (MITARBEITERNR)
);

Create Table USER
(
EMAIL varchar(255) NOT NULL,
PASSWORT varchar(255) NOT NULL,
ISADMIN varchar(1),
PRIMARY KEY (EMAIL)
);

CREATE TABLE BESTELLUNG
(
BESTELLNR varchar(10) NOT NULL,
VON timestamp DEFAULT CURRENT_TIMESTAMP,
BIS timestamp DEFAULT CURRENT_TIMESTAMP,
KUNDENNR varchar(10) REFERENCES KUNDE(KUNDENNR),
BESTAETIGT varchar(1),
GASTNR varchar(10) REFERENCES GAST(GASTNR),
PRIMARY KEY (BESTELLNR)
);

CREATE TABLE GAST
(
GASTNR varchar(10),
VORNAME varchar(255),
NACHNAME varchar(255),
EMAIL varchar(255),
ORGANISATIONSNAME varchar(255),
STRASSE varchar(255),
HAUSNUMMER varchar(10),
PLZ varchar(10) REFERENCES ORTE(PLZ),
TELEFONNR varchar(255),
HANDYNR varchar(255),
PRIMARY KEY (GASTNR)
);

CREATE TABLE BESTELLPRODUKTPOS
(
BESTELLNR varchar(10) NOT NULL REFERENCES BESTELLUNG(BESTELLNR),
PRODUKTNR varchar(10) NOT NULL REFERENCES PRODUKT(PRODUKTNR),
PRIMARY KEY (BESTELLNR, PRODUKTNR)
);

CREATE TABLE BESTELLPAKETPOS
(
BESTELLNR varchar(10) NOT NULL REFERENCES BESTELLUNG(BESTELLNR),
PAKETNR varchar(10) NOT NULL REFERENCES PAKET(PAKETNR),
PRIMARY KEY (BESTELLNR, PAKETNR)
);

CREATE TABLE FOTO
(
FOTONR varchar(10) NOT NULL,
FOTO varchar(255),
PRIMARY KEY (FOTONR)
);

CREATE TABLE FOTOPOS
(
FOTONR varchar(10) NOT NULL REFERENCES FOTO(FOTONR),
PRODUKTNR varchar(10) NOT NULL REFERENCES PRODUKT(PRODUKTNR),
PRIMARY KEY (FOTONR, PRODUKTNR)
);

CREATE TABLE PRODUKT
(
PRODUKTNR varchar(10) NOT NULL,
BEZEICHNUNG varchar(255),
HERSTELLERNAME varchar(255),
BESCHREIBUNG varchar(255),
DETAILS varchar(255),
MIETZINS varchar(10),
KATEGORIENR varchar(10) REFERENCES KATEGORIE(KATEGORIENR),
ALTERNATIVE varchar(10) REFERENCES PRODUKT(PRODUKTNR),
VERFUEGBAR varchar(1),
GELOESCHT varchar(1),
PRIMARY KEY (PRODUKTNR)
);

CREATE TABLE KATEGORIE
(
KATEGORIENR varchar(10) NOT NULL,
NAME varchar(255),
FOTONR varchar(10) REFERENCES FOTOS(FOTONR),
UNTERKATEGORIE varchar(10) REFERENCES KATEGORIE(KATEGORIENR),
PRIMARY KEY (KATEGORIENR, UNTERKATEGORIE)
);

CREATE TABLE PAKET
(
PAKETNR varchar(10) NOT NULL,
KATEGORIENR varchar(10) REFERENCES KATEGORIE(KATEGORIENR),
BEZEICHNUNG varchar(255) NOT NULL,
BESCHREIBUNG varchar(255),
DETAILS varchar(255),
MIETZINS varchar(10) NOT NULL,
FOTONR varchar(10) REFERENCES FOTO(FOTONR),
GELOESCHT varchar(1),
PRIMARY KEY (PAKETNR)
);

CREATE TABLE PAKETPOS
(
PAKETNR varchar(10) NOT NULL REFERENCES PAKET(PAKETNR),
PRODUKTNR varchar(10) NOT NULL REFERENCES PRODUKT(PRODUKTNR),
PRIMARY KEY (PAKETNR, PRODUKTNR)
);


/* Daten */
/* ORTE */
INSERT INTO ORTE VALUES('24106', 'Kiel');
INSERT INTO ORTE VALUES('24536', 'Neumünster');
INSERT INTO ORTE VALUES('20357', 'Hamburg');
INSERT INTO ORTE VALUES('24937', 'Flensburg');
INSERT INTO ORTE VALUES('18055', 'Rostock');

/* KUNDE */
Insert into KUNDE Values('KNR0000001', 'Peter', 'Panda', 'sunnyboy@knute.de', 'JohnnyCottenIndustries', 'Holzweg', '13a', '24106', '0431 666514', '0171 80666737');
Insert into KUNDE Values('KNR0000002', 'Ulrich', 'Haseldorf', 'ulrich.haseldorf@web.de', 'Hifi-Ulrich', 'Ravensburger Straße', '22', '18055', '0672 49421', '02121 8214537');
Insert into KUNDE Values('KNR0000003', 'Rüdiger', 'Schmidt', 'ruedigerhrc@web.de', 'DJHamburg', 'Stor Allee', '70b', '20357', '0751 25514', '0241 806134');
Insert into KUNDE Values('KNR0000004', 'Susanne', 'Jorgsch', 'susanne.jorsch@web.de', 'OldrichtDJs', 'Ulbrechtstraße', '14', '24937', '0131 6612321', '02315 2016234');
Insert into KUNDE Values('KNR0000005', 'Leon', 'Traner', 'leon.traner@web.de', 'DJ4LIFE', 'Susweg', '52', '24536', '0546 123532', '07523 811347');

/* MITARBEITER */
INSERT INTO MITARBEITER VALUES( 'MNR0000001', 'Manfred','Hagenbeck','manfred.hagenbeck@web.de');
INSERT INTO MITARBEITER VALUES( 'MNR0000002', 'Roland','Fischer','rolandhrc@web.de');
INSERT INTO MITARBEITER VALUES( 'MNR0000003', 'Julia','Rein','Julia@HRC.de');
INSERT INTO MITARBEITER VALUES( 'MNR0000004', 'Kai','Laume','Kai@HRC.de');

/* USER */
INSERT INTO USER VALUES('manfred.hagenbeck@web.de','12345','j');
INSERT INTO USER VALUES('rolandhrc@web.de','12345','');
INSERT INTO USER VALUES('Julia@HRC.de','12345','');
INSERT INTO USER VALUES('Kai@HRC.de','12345','');
INSERT INTO USER VALUES('ulrich.haseldorf@web.de','12345','');
INSERT INTO USER VALUES('susanne.jorsch@web.de','12345','');
INSERT INTO USER VALUES('sunnyboy@knute.de','12345','');
INSERT INTO USER VALUES('ruedigerhrc@web.de','12345','');
INSERT INTO USER VALUES('leon.traner@web.de','12345','');

/* FOTO */
INSERT INTO FOTO VALUES('FNR0000001','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Lichttechnik/Allgemein/lichttechnik_mieten.jpg');
INSERT INTO FOTO VALUES('FNR0000002','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Lichttechnik/Beamer/Beamer Acer X321 Overdrive/acerbeamer.jpg');
INSERT INTO FOTO VALUES('FNR0000003','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Lichttechnik/Beamer/Beamer GeoLo 600/beamer1.bmp');
INSERT INTO FOTO VALUES('FNR0000004','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Lichttechnik/Beamer/Beamer GeoLo 600/beamer1.bmp');
INSERT INTO FOTO VALUES('FNR0000005','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Lichttechnik/Beleuchtung/LiteTech LED BAR 252/ledleiste1.jpg');
INSERT INTO FOTO VALUES('FNR0000006','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Lichttechnik/Beleuchtung/LiteTech LED BAR 252/ledlsite.jpg');
INSERT INTO FOTO VALUES('FNR0000007','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Lichttechnik/Beleuchtung/SAR-78 Scheinwerfer/scheinwerfer1.jpg');
INSERT INTO FOTO VALUES('FNR0000008','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Lichttechnik/Beleuchtung/SAR-78 Scheinwerfer/scheinwerfer2.jpg');
INSERT INTO FOTO VALUES('FNR0000009','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Lichttechnik/Beleuchtung/SAR-79 Floorspot/floorspot.jpg');
INSERT INTO FOTO VALUES('FNR0000010','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Lichttechnik/Beleuchtung/SAR-79 Floorspot/floorspot1.jpg');
INSERT INTO FOTO VALUES('FNR0000011','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Lichttechnik/Beleuchtung/SAR-85 System COB/scheinwerfer3.jpg');
INSERT INTO FOTO VALUES('FNR0000012','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Lichttechnik/Nebel/Dunst-Nebelmschine Soflar 500/nebelmaschine3.jpg');
INSERT INTO FOTO VALUES('FNR0000013','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Lichttechnik/Nebel/Smoke Factory Hazer/nebelmaschine1.jpg');
INSERT INTO FOTO VALUES('FNR0000014','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Lichttechnik/Nebel/SAR-24 Nebelmaschine/nebelmaschine2.jpg');
INSERT INTO FOTO VALUES('FNR0000015','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Allgemein/lautsprecherviele.jpg');
INSERT INTO FOTO VALUES('FNR0000016','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/CD-Player/GeoLo 1245 Plattenspieler/cdplayer.jpg');
INSERT INTO FOTO VALUES('FNR0000017','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/CD-Player/Syntech 700 CD-Player/cdplayer1.jpg');
INSERT INTO FOTO VALUES('FNR0000018','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/CD-Player/Syntech 700 CD-Player/cdplayer4.jpg');
INSERT INTO FOTO VALUES('FNR0000019','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Lautsprecher/Nova 7000 Lautsprecher/lautsprecherfett.jpg');
INSERT INTO FOTO VALUES('FNR0000020','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Lautsprecher/Nova 7000 Lautsprecher/lautsprecherfett1.jpg');
INSERT INTO FOTO VALUES('FNR0000021','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Lautsprecher/Nova 8000 Lautsprecher/lautsprecher5.jpg');
INSERT INTO FOTO VALUES('FNR0000022','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Lautsprecher/Nova 8000 Lautsprecher/lautsprecher7.jpg');
INSERT INTO FOTO VALUES('FNR0000023','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Lautsprecher/SAR-240 Lautsprecher/lautsprecher.jpg');
INSERT INTO FOTO VALUES('FNR0000024','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Lautsprecher/Syntech 500i Lautsprecher/lautsprecher1.jpg');
INSERT INTO FOTO VALUES('FNR0000025','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Mikrofone/LiteTech Mikro 400/mikrofon2.jpg');
INSERT INTO FOTO VALUES('FNR0000026','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Mikrofone/LiteTech Mikro 400/Mikrofon4.JPG');
INSERT INTO FOTO VALUES('FNR0000027','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Mikrofone/LiteTech Mikro 500/mikrofon3.jpg');
INSERT INTO FOTO VALUES('FNR0000028','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Mikrofone/LiteTech Mikro 500/mikrofon1.jpg');
INSERT INTO FOTO VALUES('FNR0000029','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Mischpulte/Alien W100 Mischpult/mischpultklein1.jpg');
INSERT INTO FOTO VALUES('FNR0000030','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Mischpulte/Alien W900 Mischpult/mischpultalt.jpg');
INSERT INTO FOTO VALUES('FNR0000031','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Mischpulte/SAR-165 Mischpult/mischpultcool.jpg');
INSERT INTO FOTO VALUES('FNR0000032','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Verstärker/GeoLo 1100 Verstärker/verstärker3.jpg');
INSERT INTO FOTO VALUES('FNR0000033','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Verstärker/SAR-170 Verstärker/verstärkerklein.jpg');
INSERT INTO FOTO VALUES('FNR0000034','http://localhost:8084/HipsterRentalCorp/FileZillaImageRessource/Tontechnik/Verstärker/Syntech 900 Verstärker/verstärker.jpg');


/* KATEGORIE */
INSERT INTO KATEGORIE VALUES('KATNR00001','Lichttechnik','FNR0000001', 'KATNR00002');
INSERT INTO KATEGORIE VALUES('KATNR00001','Lichttechnik','FNR0000001', 'KATNR00003');
INSERT INTO KATEGORIE VALUES('KATNR00001','Lichttechnik','FNR0000001', 'KATNR00004');
INSERT INTO KATEGORIE VALUES('KATNR00002','Beleuchtung','FNR0000002', '');
INSERT INTO KATEGORIE VALUES('KATNR00003','Nebel','FNR0000002', '');
INSERT INTO KATEGORIE VALUES('KATNR00004','Beamer','FNR0000001', '');
INSERT INTO KATEGORIE VALUES('KATNR00005','Tontechnik','FNR0000001', 'KATNR00006');
INSERT INTO KATEGORIE VALUES('KATNR00005','Tontechnik','FNR0000001', 'KATNR00007');
INSERT INTO KATEGORIE VALUES('KATNR00005','Tontechnik','FNR0000001', 'KATNR00008');
INSERT INTO KATEGORIE VALUES('KATNR00005','Tontechnik','FNR0000001', 'KATNR00009');
INSERT INTO KATEGORIE VALUES('KATNR00005','Tontechnik','FNR0000001', 'KATNR00010');
INSERT INTO KATEGORIE VALUES('KATNR00006','CD-Player','FNR0000001', '');
INSERT INTO KATEGORIE VALUES('KATNR00007','Mischpulte','FNR0000001', '');
INSERT INTO KATEGORIE VALUES('KATNR00008','Verstärker','FNR0000001', '');
INSERT INTO KATEGORIE VALUES('KATNR00009','Mikrofone','FNR0000001', '');
INSERT INTO KATEGORIE VALUES('KATNR00010','Lautsprecher','FNR0000001', '');
INSERT INTO KATEGORIE VALUES('KATNR00011','Subwoofer','FNR0000001', '');
INSERT INTO KATEGORIE VALUES('KATNR00012','Funk','FNR0000002', 'KATNR00013');
INSERT INTO KATEGORIE VALUES('KATNR00013','Funkgeräte','FNR0000002', '');

/* PRODUKT */
INSERT INTO PRODUKT VALUES('PNR0000001','SAR-24 Nebelmaschine','SAR technologies','Diese Nebelmaschine der Spitzenklasse lässt ihre Party zu einem echten Hit werden. Ohne Witz.','Eine Nebelmaschine','15,00','KATNR00003', 'PNR0000003','j','');
INSERT INTO PRODUKT VALUES('PNR0000002','Dunst-Nebelmschine Soflar 500','Soflar','Ein transparenter Dunst erzeugt eine tolle Atmosphäre ohne den Raum zu vernebeln.','Eine Nebelmaschine', '15,00','KATNR00003', 'PNR0000003','j','');
INSERT INTO PRODUKT VALUES('PNR0000003','Smoke Factory Hazer','Smoke Factory','Professionelles Gerät für die perfekte Atmosphäre auf ihrer Party.','Eine Nebelmaschine', '24,00','KATNR00003', '','j','');
INSERT INTO PRODUKT VALUES('PNR0000004','SAR-78 Scheinwerfer','Sar technologies','Ein absoluter Klassiker und den modernen Beleuchtungsanlagen.','Ein Scheinwerfer', '7,00','KATNR00002', 'PNR0000005','j','');
INSERT INTO PRODUKT VALUES('PNR0000005','SAR-79 Floorspot','Sar technologies','Auf jeder Party ein Hingucker.','Ein Scheinwerfer', '6,00','KATNR00002', 'PNR0000004','j','');
INSERT INTO PRODUKT VALUES('PNR0000006','LiteTech LED BAR 252','LiteTech','Helle und schÃƒÂ¶ne LED BAR mit einstellbarer Helligkeit.','Ein Scheinwerfer', '12,00','KATNR00002', 'PNR0000004','j','');
INSERT INTO PRODUKT VALUES('PNR0000007','SAR-85 System COB','Sar technologies','Eine ultrakompakte und leistungsstarke Lichtanlage.','Ein Scheinwerfer', '24,00','KATNR00002', 'PNR0000004','j','');
INSERT INTO PRODUKT VALUES('PNR0000008','LiteTech Mikro 400','LiteTech','Ein Mikrofon mit herausragender Qualität.','Ein Mikrofon', '9,00','KATNR00009', 'PNR0000009','j','');
INSERT INTO PRODUKT VALUES('PNR0000009','LiteTech Mikro 500','LiteTech','Das LiteTech Mikro 500 ist besser als das LiteTech Mikro 400.','Ein Mikrofon', '11,00','KATNR00009', 'PNR0000008','j','');
INSERT INTO PRODUKT VALUES('PNR0000010','Beamer Acer X321 Overdrive','Acer','Der X321 Overdrive von Acer ist für Projektionen aller Art geeignet.','Ein Beamer', '36,00','KATNR00004', 'PNR0000011','j','');
INSERT INTO PRODUKT VALUES('PNR0000011','Beamer GeoLo 600','GeoLo','GeoLo setzt mit seiner 600er Serie neue MaÃƒÅ¸stÃƒÂ¤be in Sachen Qualität.','Ein Beamer', '49,00','KATNR00004', 'PNR0000010','j','');
INSERT INTO PRODUKT VALUES('PNR0000012','GeoLo 1245 Plattenspieler','GeoLo','Seit Jahren erfreut sich der GeoLo 1245 groÃƒÅ¸er beliebtheit.','Ein CD-Player', '20,00','KATNR00006', 'PNR0000013','j','');
INSERT INTO PRODUKT VALUES('PNR0000013','Syntech 700 CD-Player','Syntech','Ein CD-Spieler der höchsten Qualität.','Ein CD-Player', '32,00','KATNR00006', 'PNR0000012','j','');
INSERT INTO PRODUKT VALUES('PNR0000014','Alien W900 Mischpult','Alien','Ein Mischpult mit einer äußerst gut gestalteten Bedienoberfläche.','Ein Mischpult', '17,00','KATNR00007', 'PNR0000015','j','');
INSERT INTO PRODUKT VALUES('PNR0000015','Alien W100 Mischpult','Alien','Ein Mischpult das auf kleinstem Raum eine hohe LeistungsfÃƒÂ¤higkeit besitzt.','Ein Mischpult', '8,00','KATNR00007', 'PNR00000016','j','');
INSERT INTO PRODUKT VALUES('PNR0000016','SAR-165 Mischpult','SAR technologies','Die hohe Qualität von SAR technologies zeigen sie besonders bei ihren Mischpulten.','Ein Mischpult', '47,00','KATNR00007', 'PNR0000014','j','');
INSERT INTO PRODUKT VALUES('PNR0000017','Nova 7000 Lautsprecher','Nova','Ein Lautsprecher mit besonders hoher Leistung.','Ein Lautsprecher', '21,00','KATNR00010', 'PNR00000018','j','');
INSERT INTO PRODUKT VALUES('PNR0000018','Syntech 500i Lautsprecher','Syntech','Qualität auf engstem Raum machen den 500i zu einem echten >BEAST<','Ein Lautsprecher', '18,00','KATNR00010', 'PNR0000019','j','');
INSERT INTO PRODUKT VALUES('PNR0000019','SAR-240 Lautsprecher','SAR technologies','Der Lamborghini unter den Lautsprechern begeistert nach wie vor seine Zuhörer.','Ein Lautsprecher', '39,00','KATNR00010', 'PNR0000020','j','');
INSERT INTO PRODUKT VALUES('PNR0000020','Nova 8000 Lautsprecher','Nova','Ein Lautsprecher der mit extra Bass auftrumpft.','Ein Lautsprecher', '23,00','KATNR00010', 'PNR0000017','j','');
INSERT INTO PRODUKT VALUES('PNR0000021','Syntech 900 Verstärker','Syntech','Profis sind sich einig: Einer der besten Verstärker auf dem Markt.','Ein Verstärker', '32,00','KATNR00008', 'PNR0000022','j','');
INSERT INTO PRODUKT VALUES('PNR0000022','SAR-170 Verstärker','SAR technologies','Der SAR-170 ist eine günstige Alternative mit viel Leistung.','Ein Verstärker', '26,00','KATNR00008', 'PNR0000023','j','');
INSERT INTO PRODUKT VALUES('PNR0000023','GeoLo 1100 Verstärker','GeoLo','GeoLo bringt mit der 1100er Serie eine Qualitativ hochwertigen Verstärker auf den Markt','Ein Verstärker', '38,00','KATNR00008', 'PNR0000021','j','');
INSERT INTO PRODUKT VALUES('PNR0000024','SubwuufeR','Intel','Ey, das geht ab...','400V Starkstrom mit eingegebautem Backofen','12,45','KATNR00011', 'PNR0000002','j', '');
INSERT INTO PRODUKT VALUES('PNR0000025','Radio','Macintosh','Hammerfettbombekrass','9,5 V Batterie benötigt', '3,25','KATNR00012', '','j','');
INSERT INTO PRODUKT VALUES('PNR0000026','Trucker FunkgerÃ¤t','Hama','Dem Trucker sein Schätzeke.','Kurz-, Mittel- und Langwelle', '14,89','KATNR00013', '','j','');
INSERT INTO PRODUKT VALUES('PNR0000027','Amateur Funkgerät','Hama','Für den frischen Funker','Kurz- und Mittelwelle', '9,99','KATNR00013', 'PNR0000026','j','');

/* FOTOPOS */
INSERT INTO FOTOPOS VALUES('FNR0000002', 'PNR0000010');
INSERT INTO FOTOPOS VALUES('FNR0000003', 'PNR0000011');
INSERT INTO FOTOPOS VALUES('FNR0000004', 'PNR0000011');
INSERT INTO FOTOPOS VALUES('FNR0000005', 'PNR0000006');
INSERT INTO FOTOPOS VALUES('FNR0000006', 'PNR0000006');
INSERT INTO FOTOPOS VALUES('FNR0000007', 'PNR0000004');
INSERT INTO FOTOPOS VALUES('FNR0000008', 'PNR0000004');
INSERT INTO FOTOPOS VALUES('FNR0000009', 'PNR0000005');
INSERT INTO FOTOPOS VALUES('FNR0000010', 'PNR0000005');
INSERT INTO FOTOPOS VALUES('FNR0000011', 'PNR0000007');
INSERT INTO FOTOPOS VALUES('FNR0000012', 'PNR0000002');
INSERT INTO FOTOPOS VALUES('FNR0000013', 'PNR0000003');
INSERT INTO FOTOPOS VALUES('FNR0000014', 'PNR0000001');
INSERT INTO FOTOPOS VALUES('FNR0000016', 'PNR0000012');
INSERT INTO FOTOPOS VALUES('FNR0000017', 'PNR0000013');
INSERT INTO FOTOPOS VALUES('FNR0000018', 'PNR0000013');
INSERT INTO FOTOPOS VALUES('FNR0000019', 'PNR0000017');
INSERT INTO FOTOPOS VALUES('FNR0000020', 'PNR0000017');
INSERT INTO FOTOPOS VALUES('FNR0000021', 'PNR0000020');
INSERT INTO FOTOPOS VALUES('FNR0000022', 'PNR0000020');
INSERT INTO FOTOPOS VALUES('FNR0000023', 'PNR0000019');
INSERT INTO FOTOPOS VALUES('FNR0000024', 'PNR0000018');
INSERT INTO FOTOPOS VALUES('FNR0000025', 'PNR0000008');
INSERT INTO FOTOPOS VALUES('FNR0000026', 'PNR0000008');
INSERT INTO FOTOPOS VALUES('FNR0000027', 'PNR0000009');
INSERT INTO FOTOPOS VALUES('FNR0000028', 'PNR0000009');
INSERT INTO FOTOPOS VALUES('FNR0000029', 'PNR0000015');
INSERT INTO FOTOPOS VALUES('FNR0000030', 'PNR0000014');
INSERT INTO FOTOPOS VALUES('FNR0000031', 'PNR0000016');
INSERT INTO FOTOPOS VALUES('FNR0000032', 'PNR0000023');
INSERT INTO FOTOPOS VALUES('FNR0000033', 'PNR0000022');
INSERT INTO FOTOPOS VALUES('FNR0000034', 'PNR0000021');

/* BESTELLUNG */
INSERT INTO BESTELLUNG VALUES('BNR0000001', '2015-10-12 16:30:00','2015-10-16 12:45:00','KNR0000001', '', '');

/* BESTELLPRODUKTPOS */
INSERT INTO BESTELLPRODUKTPOS VALUES('BNR0000001','PNR0000001');
INSERT INTO BESTELLPRODUKTPOS VALUES('BNR0000001','PNR0000002');

/* BESTELLPAKETPOS */
INSERT INTO BESTELLPAKETPOS VALUES('BNR0000001','PAKNR00001');

/* PAKET */
INSERT INTO PAKET VALUES('PAKNR00001', 'KATNR00001', 'Leuchtspektakel', 'Beleuchtung aller Art', 'Ein Paket', '84,99', 'FNR0000001','');
INSERT INTO PAKET VALUES('PAKNR00002', 'KATNR00005', 'Bass-Boost', 'Guter Sound für gute Kunden', 'Ein Paket', '104,99', 'FNR0000015','');

/* PAKETPOS */
INSERT INTO PAKETPOS VALUES('PAKNR00001', 'PNR0000004');
INSERT INTO PAKETPOS VALUES('PAKNR00001', 'PNR0000005');
INSERT INTO PAKETPOS VALUES('PAKNR00001', 'PNR0000006');
INSERT INTO PAKETPOS VALUES('PAKNR00001', 'PNR0000007');
INSERT INTO PAKETPOS VALUES('PAKNR00002', 'PNR0000018');
INSERT INTO PAKETPOS VALUES('PAKNR00002', 'PNR0000019');
INSERT INTO PAKETPOS VALUES('PAKNR00002', 'PNR0000020');


