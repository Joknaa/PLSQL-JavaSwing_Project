create or replace trigger TRIG2
    after insert
    on COMMAND
    for each row
BEGIN
    INSERT INTO HISTORIQUE VALUES (:NEW.CLIENTID, :NEW.COMMANDID, :NEW.COMMANDDATE);
END;
/

