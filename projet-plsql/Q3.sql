-------fonct3
SET SERVEROUTPUT ON;

DECLARE
    v_CommandID         int :=: v_CommandID;
    v_CommandTotalPrice float;
    v_ConvertToEuro     boolean :=: v_ConvertToEuro;
    v_ConvertToDollar   boolean :=: v_ConvertToDollar;
    v_CmdEuroValue      float;
    v_CmdDollarValue    float;

    CURSOR c_CommandTotalPrice IS SELECT command.TotalTTC FROM command WHERE command.CommandID = v_CommandID;

    FUNCTION f_MAD2EURO(v_MadValue float) RETURN float IS v_EuroValue float;
        BEGIN
            v_EuroValue := v_MadValue * 10;
        RETURN v_EuroValue;
    end f_MAD2EURO;
    FUNCTION f_MAD2DOLLAR(v_MadValue float) RETURN float IS v_DollarValue float;
        BEGIN
            v_DollarValue := v_MadValue * 10;
        RETURN v_DollarValue;
    end f_MAD2DOLLAR;

BEGIN
    OPEN  c_CommandTotalPrice;
    FETCH c_CommandTotalPrice INTO v_CommandTotalPrice;
    CLOSE c_CommandTotalPrice;

    IF v_ConvertToEuro THEN
        v_CmdEuroValue := f_MAD2EURO(v_CommandTotalPrice);
        DBMS_OUTPUT.PUT_LINE('Converted value to Euro is: ' || v_CmdEuroValue);
    end if;
    IF v_ConvertToDollar THEN
        v_CmdDollarValue := f_MAD2DOLLAR(v_CommandTotalPrice);
        DBMS_OUTPUT.PUT_LINE('Converted value to Dollar is: ' || v_CmdDollarValue);
    end if;

end;
show error;
