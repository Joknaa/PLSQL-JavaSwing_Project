create or replace FUNCTION f_CountOrders(v_ClientID in int) RETURN NUMBER IS
    v_OrdersCount NUMBER;
BEGIN
    SELECT COUNT(command.CommandID) INTO v_OrdersCount FROM command WHERE command.ClientID = v_ClientID;
    RETURN v_OrdersCount;
END f_CountOrders;
/

