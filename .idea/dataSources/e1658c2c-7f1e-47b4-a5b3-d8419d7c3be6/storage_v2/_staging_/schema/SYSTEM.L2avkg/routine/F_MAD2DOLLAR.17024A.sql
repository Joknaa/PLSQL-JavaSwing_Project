create or replace FUNCTION f_MAD2DOLLAR(v_CommandID in int) RETURN float IS
    v_MadValue  float;
    v_DollarValue float;
BEGIN
    SELECT command.TotalTTC INTO v_MadValue FROM command WHERE command.CommandID = v_CommandID;
    v_DollarValue := v_MadValue * 9;
    RETURN v_DollarValue;
end f_MAD2DOLLAR;
/

