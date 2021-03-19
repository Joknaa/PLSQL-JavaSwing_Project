CREATE OR REPLACE PROCEDURE triparPU(c_output in out SYS_REFCURSOR)
AS
BEGIN
    OPEN c_output FOR SELECT * FROM (SELECT * FROM CATALOGUE ORDER BY PU DESC);

END;

    begin
        triparPU();
    end;