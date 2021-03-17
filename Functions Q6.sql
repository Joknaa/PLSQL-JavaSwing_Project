DECLARE
    v_ProductID           int :=: v_ProductID;
    v_ProductPrice        int;
    v_TotalQuantitySold   int;
    v_ProductTurnover     int;

    FUNCTION f_CalculateTurnover(v_ProductID int) RETURN NUMBER IS v_Turnover NUMBER;
    BEGIN
        SELECT catalogue.PU * catalogue.TVA INTO v_ProductPrice FROM catalogue WHERE catalogue.ref = v_ProductID;
        SELECT SUM(product.quantity) INTO v_TotalQuantitySold
        FROM product WHERE product.commandID IN (
            SELECT command.ID FROM command WHERE command.ProductID = v_ProductID
            );

        RETURN v_ProductPrice * v_TotalQuantitySold;
    END f_CalculateTurnover;
BEGIN
    v_ProductTurnover := f_CalculateTurnover(v_ProductID);

    DBMS_OUTPUT.PUT_LINE('The turnover for this product ' || v_ProductID ||
                         'is: ' || v_ProductTurnover);
end;