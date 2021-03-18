CREATE OR REPLACE TRIGGER controler
    BEFORE INSERT OR UPDATE
    ON COMMAND
    FOR EACH ROW
BEGIN
    IF :new.date_cmd > :new.date_livraison THEN
      RAISE_APPLICATION_ERROR( -11111, 'La date de livraison inférieure à la date de 
                                               commande');
                              
    END IF;
END;