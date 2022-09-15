CREATE PROCEDURE DoesItWork
    @Denominator FLOAT
AS
BEGIN
    DECLARE @Factor FLOAT = 1 / @Denominator;

    SELECT
        @Factor AS [@Factor]
END;