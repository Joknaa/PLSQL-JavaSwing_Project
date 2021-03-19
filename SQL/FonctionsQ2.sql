create or replace FUNCTION f_GetMinClient RETURN NUMBER IS
    v_MinClientID NUMBER;
BEGIN
    SELECT ClientID INTO v_MinClientID FROM (
        SELECT ClientID, SUM(command.totalTTC) AS TotalAmount FROM command GROUP BY ClientID ORDER BY TotalAmount
        ) WHERE ROWNUM <= 1;
    RETURN v_MinClientID;
END f_GetMinClient;
    
create or replace FUNCTION f_GetMaxClient RETURN NUMBER IS
    v_MaxClientID NUMBER;
BEGIN
    SELECT ClientID INTO v_MaxClientID FROM (
        SELECT ClientID, SUM(command.totalTTC) AS TotalAmount FROM command GROUP BY ClientID ORDER BY TotalAmount DESC
        ) WHERE ROWNUM <= 1;
    RETURN v_MaxClientID;
END f_GetMaxClient;