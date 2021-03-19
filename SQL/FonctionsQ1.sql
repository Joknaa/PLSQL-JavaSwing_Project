    CREATE or replace FUNCTION f_GetOrdersList(v_ClientID in int) RETURN SYS_REFCURSOR IS
        v_commandList SYS_REFCURSOR;
    BEGIN
        OPEN v_commandList FOR SELECT COMMANDID FROM COMMAND WHERE ClientID = v_ClientID;

        RETURN v_commandList;
    END f_GetOrdersList;
