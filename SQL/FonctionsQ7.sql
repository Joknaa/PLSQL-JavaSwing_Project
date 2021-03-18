------------fonct7
SET SERVEROUTPUT ON;
DECLARE
    v_Year              int :=: v_Year;
    v_ProductPrice      int;
    v_TotalAnnualTurnover float;
    v_ProductTurnover   int;

    FUNCTION f_CalculateTurnover(v_Year int) RETURN float IS v_TotalAnnualTurnover float;
    BEGIN
        SELECT SUM(command.TotalTTC) INTO v_TotalAnnualTurnover FROM command
        WHERE command.commandDate
            BETWEEN  TO_DATE(CONCAT('01/01/',TO_CHAR(v_Year)) ,'DD/MM/YYYY') AND TO_DATE(CONCAT('31/12/',TO_CHAR(v_Year)) ,'DD/MM/YYYY');
        RETURN v_TotalAnnualTurnover;
    END f_CalculateTurnover;
BEGIN
    v_TotalAnnualTurnover := f_CalculateTurnover(v_Year);

    DBMS_OUTPUT.PUT_LINE('The turnover for the year ' || v_Year ||
                         ' is: ' || v_ProductTurnover);
end;