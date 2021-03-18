DECLARE
    v_Year              int :=: v_Year;
    v_ProductPrice      int;
    v_TotalAnnualTurnover int;
    v_ProductTurnover   int;

    FUNCTION f_CalculateTurnover(v_Year int) RETURN NUMBER IS v_TotalAnnualTurnover NUMBER;
    BEGIN
        SELECT SUM(command.TotalTTC) INTO v_TotalAnnualTurnover FROM command
        WHERE command.commandDate
            BETWEEN  TO_DATE(CONCAT(v_Year,'0000') ,'YYYYMMDD) AND TO_DATE(CONCAT(v_Year,'1231') ,'YYYYMMDD) ;
        RETURN v_TotalAnnualTurnover;
    END f_CalculateTurnover;
BEGIN
    v_TotalAnnualTurnover := f_CalculateTurnover(v_Year);

    DBMS_OUTPUT.PUT_LINE('The turnover for the year ' || v_Year ||
                         ' is: ' || v_ProductTurnover);
end;


