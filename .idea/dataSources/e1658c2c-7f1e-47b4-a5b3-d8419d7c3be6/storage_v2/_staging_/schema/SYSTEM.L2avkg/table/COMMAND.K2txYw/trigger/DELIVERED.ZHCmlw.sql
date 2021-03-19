create or replace trigger DELIVERED
    after update
    on COMMAND
    for each row
BEGIN
    IF :New.PAID = 1 THEN
        INSERT INTO HISTORIQUE (id_cmd, id_client, date_cmd)
        VALUES (:new.COMMANDID,
                :new.CLIENTID,
                :new.COMMANDDATE);
    end if;
END;
/

