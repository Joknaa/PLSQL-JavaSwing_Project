CREATE OR REPLACE TRIGGER delivered
    AFTER UPDATE 
    ON COMMANDE
    FOR EACH ROW
BEGIN
    IF :New.situation = 1 THEN
        INSERT INTO HISTORIQUE (id_cmd, id_client, date_cmd)
        VALUES (:new.id_cmd,
                :new.id_client,
                :new.date_cmd);
    end if;
END;