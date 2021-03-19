CREATE OR REPLACE TRIGGER controler
    BEFORE INSERT OR UPDATE
    ON COMMAND
    FOR EACH ROW
BEGIN
    IF :new.COMMANDDATE > :new.DeliveryDate THEN
      RAISE_APPLICATION_ERROR( -20000, 'La date de livraison inférieure à la date de
                                               commande');

    END IF;
END;

insert into COMMAND values (1, TO_DATE('2019-01-01', 'YYYY-MM-DD'), 2, 'B15', 222, 0, 222*2349, TO_DATE('2018-01-01', 'YYYY-MM-DD'));
