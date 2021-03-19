DECLARE
    v_ProductRef    NUMBER :=: v_ProductRef;
    v_Category      VARCHAR2(64);
    v_Family        VARCHAR2(64);
    r_Product       CATALOGUE%ROWTYPE;
    CURSOR c_ProductInfo IS
        SELECT * FROM CATALOGUE WHERE REF = v_ProductRef;
    CURSOR c_Category IS
        SELECT Label INTO v_Category FROM CATEGORIES WHERE Code = r_Product.Category;
    CURSOR c_Family IS
        SELECT Label INTO v_Family FROM FAMILIES WHERE Code = r_Product.Family;

BEGIN
    OPEN c_ProductInfo;
    FETCH c_ProductInfo INTO r_Product;
    EXIT WHEN c_ProductInfo%NOTFOUND;
    OPEN  c_Category;
    FETCH c_Category INTO v_Category;
    OPEN  c_Family;
    FETCH c_Family INTO v_Family;
    DBMS_OUTPUT.PUT_LINE(
        'Ref: ' || r_Product.Ref ||
        '- Label: ' || r_Product.Label ||
        '- Category: ' || v_Category ||
        '- Family: ' || v_Family ||
        '- Unite Price: ' || r_Product.PU ||
        '- TVA: ' || r_Product.TVA
        );
    CLOSE c_ProductInfo;
    CLOSE c_Category;
    CLOSE c_Family;
end;