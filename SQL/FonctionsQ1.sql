DECLARE
    v_ClientID      int :=: v_ClientID;
    v_OrdersCount int;

    CURSOR c_Commands IS
        SELECT CommandID FROM commands WHERE ClientID = v_ClientID;

    FUNCTION f_CountOrders RETURN NUMBER IS v_OrdersCount NUMBER;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('The Orders done by the client ' || v_ClientID || ' are: ');

        OPEN  c_Commands;
        FOR v_command IN c_Commands LOOP
            DBMS_OUTPUT.PUT_LINE(v_command);
        END LOOP;
        CLOSE c_Commands;

        RETURN v_OrdersCount;
    END f_CountOrders;
BEGIN

    v_OrdersCount := f_CountOrders();
end;