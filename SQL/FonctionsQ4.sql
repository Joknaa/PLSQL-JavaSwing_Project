create or replace FUNCTION f_CountArticles(v_CategoryID in int) RETURN NUMBER IS
    v_TotalArticles NUMBER;
BEGIN
    SELECT COUNT(catalogue.Ref) INTO v_TotalArticles FROM catalogue WHERE catalogue.Category = v_CategoryID;

    RETURN v_TotalArticles;
END f_CountArticles;
