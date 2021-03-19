create or replace FUNCTION f_CalculateTurnover(v_ProductID in varchar) RETURN float
    IS 
    v_ProductTVA          int;
    v_ProductPrice        int;
    v_TotalQuantitySold   int;
    v_Turnover            float;
    BEGIN
        SELECT catalogue.PU  INTO v_ProductPrice FROM catalogue WHERE catalogue.ref = v_ProductID;
        SELECT catalogue.TVA INTO v_ProductTVA FROM catalogue WHERE catalogue.ref = v_ProductID;
        SELECT SUM(command.QTE) INTO v_TotalQuantitySold FROM command WHERE command.productref  = v_ProductID ;

        v_Turnover := v_ProductPrice * v_TotalQuantitySold * (1 + v_ProductTVA/100);
        RETURN v_Turnover;
    END f_CalculateTurnover;