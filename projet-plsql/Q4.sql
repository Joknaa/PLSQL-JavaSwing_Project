---------fonct4
SET SERVEROUTPUT ON;
DECLARE
    v_CategoryID int :=: v_CategoryID;
    v_ArticleCount int;

    FUNCTION f_CountArticles RETURN NUMBER IS v_TotalArticles NUMBER;
    BEGIN
        SELECT COUNT(catalogue.Ref) INTO v_TotalArticles
        FROM catalogue WHERE catalogue.Category = v_CategoryID;

        RETURN v_TotalArticles;
    END f_CountArticles;
BEGIN
    v_ArticleCount := f_CountArticles();

    DBMS_OUTPUT.PUT_LINE('Lotal Articles of the category ' || v_CategoryID ||
                         'is: ' || v_ArticleCount);
end;
