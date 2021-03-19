create trigger CONTROLER
    before insert or update
    on COMMAND
    for each row
BEGIN
    IF :new.COMMANDDATE > :new.DeliveryDate THEN
      RAISE_APPLICATION_ERROR( -20000, 'La date de livraison inférieure à la date de commande');
    END IF;
END;
/