create FUNCTION f_CalculateAnnualTurnover(
    v_startDate in varchar2,
    v_endDate in varchar2
) RETURN float IS
    v_TotalAnnualTurnover float;
BEGIN
    SELECT SUM(command.TotalTTC) INTO v_TotalAnnualTurnover FROM command WHERE command.commandDate
        BETWEEN  TO_DATE(v_startDate ,'DD/MM/YYYY') AND TO_DATE(v_endDate ,'DD/MM/YYYY');
    RETURN v_TotalAnnualTurnover;
END f_CalculateAnnualTurnover;
/

