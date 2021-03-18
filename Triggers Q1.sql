CREATE TABLE HISTORIQUE (
id_client int not null primarykey, 
id_cmd int not null primarykey, 
date_cmd date
);


CREATE OR REPLACE TRIGGER controler
    BEFORE INSERT OR UPDATE
    ON COMMANDE
    FOR EACH ROW
BEGIN
    IF :new.date_cmd > :new.date_livraison THEN
      RAISE_APPLICATION_ERROR( -11111, 'La date de livraison inférieure à la date de 
                                               commande');
                              
    END IF;
END;

**** TIP: When using SQLPlus, you need to enter slash on a new line after the 
trigger. Otherwise, the script won't execute.