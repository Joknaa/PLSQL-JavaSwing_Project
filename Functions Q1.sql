DECLARE
    v_ClientID      int :=: v_ClientID;
    v_OrdersCount int;

    CURSOR c_Commands IS
        SELECT CommandID FROM commands WHERE ClientID = v_ClientID;

    FUNCTION f_CountOrders RETURN NUMBER IS v_OrdersCount NUMBER;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('The Orders done by the client ' || v_ClientID || ' are: ');

        OPEN  c_Commands;
        LOOP
            FETCH c_Commands INTO v_OrdersCount;
            EXIT WHEN v_OrdersCount%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(v_OrdersCount);
        end loop;

        RETURN v_OrdersCount;
    END f_CountOrders;
BEGIN

    v_OrdersCount := f_CountOrders();
end;