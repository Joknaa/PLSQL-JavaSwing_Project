CREATE OR REPLACE TRIGGER insert
    AFTER INSERT
    ON COMMANDE
    FOR EACH ROW
BEGIN
    INSERT INTO HISTORIQUE (id_cmd, id_client, date_cmd)
    VALUES (:NEW.id_cmd,
            :NEW.id_client,
            :NEW.date_cmd);
END;
