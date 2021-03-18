DECLARE
    v_ClientID      int :=: v_ClientID;
    v_OrdersCount int;

    FUNCTION f_CountOrders RETURN NUMBER IS v_OrdersCount NUMBER;
    BEGIN
        SELECT COUNT(commands.CommandID) INTO v_OrdersCount
        FROM commands WHERE commands.ClientID = v_ClientID;
        RETURN v_OrdersCount;
    END f_CountOrders;
BEGIN
    v_OrdersCount := f_CountOrders();

    DBMS_OUTPUT.PUT_LINE('Number of commands for the client : ' || v_ClientID ||
                         ' is: ' || v_OrdersCount);
end;