create trigger TRIG2
    after insert
    on COMMAND
    for each row
BEGIN
    INSERT INTO HISTORIQUE VALUES (:NEW.ID_CLIENT, :NEW.ID_CMD, :NEW.DATE_CMD);
END;
/

