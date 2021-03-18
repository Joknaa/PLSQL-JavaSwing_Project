

INSERT INTO clientlist VALUES(1, 'BENTAJER','Mhannech II, Tetouan', 1,TO_DATE('20191202','YYYYMMDD'), 
'ahmed@mail.com', 'A passé une grosse commande en janvier 2018 , depuis, plus rien. Penser à reprendre contact');
INSERT INTO clientlist VALUES(2, 'ESSEGHIRI','Res Naoufal app 8, Maarif, Casablanca', 2,TO_DATE('20181027','YYYYMMDD'), 
'youssef@mail.com','Client contactée grâce à M. Houty de Casablanca. Remise de 10% sur ladernière commande suite à un retard d’envoi');
INSERT INTO clientlist VALUES(3, 'Belmir', 'Tetouan', 2, TO_DATE('20181120','YYYYMMDD'), 
'karim@mail.com',  'Client fidèle qui passe des commandes régulièrement (environ une par mois)');

INSERT INTO regions VALUES(1, 'Tanger-Tétouan-Al Hoceïma');
INSERT INTO regions VALUES(2, 'Région de l Oriental');
INSERT INTO regions VALUES(3, 'Région de Fès-Meknès');
INSERT INTO regions VALUES(4, 'Région de Rabat-Salé-Kénitra');
INSERT INTO regions VALUES(5, 'Région de Béni Mellal-Khénifra');
INSERT INTO regions VALUES(6, 'Région de Casablanca-Settat');
INSERT INTO regions VALUES(7, 'Région de Marrakech-Safi');

INSERT INTO categories VALUES(1, 'MEMOIRE');
INSERT INTO categories VALUES(2, 'CARTE');
INSERT INTO categories VALUES(3, 'DISQUE');

INSERT INTO catalogue VALUES('A01', 'Barrette Memoire 2Go', 1, 1, 150, '12%');
INSERT INTO catalogue VALUES('A02', 'Barrette Memoire 4Go', 1, 1, 240, '12%');
INSERT INTO catalogue VALUES('B15', 'Carte Graphique AMD Radeon RX 570 Pulse, 4Go', 5, 2, 2349, '20%');
INSERT INTO catalogue VALUES('A11', 'Carte son Asus Xonar DG', 4, 2, 750, '12%');
INSERT INTO catalogue VALUES('C80', 'Disque Externe Toshiba usb 3.0 1000Go', 2, 3, 546, '33%');

INSERT INTO command VALUES(886, TO_DATE('20190201','YYYYMMDD'), 2, 'A01', 10, 0);
INSERT INTO command VALUES(887, TO_DATE('20190201','YYYYMMDD'), 2, 'A02', 2, 0);
INSERT INTO command VALUES(888, TO_DATE('20190201','YYYYMMDD'), 2, 'B15', 1, 0);