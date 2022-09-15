DECLARE
  @a FLOAT = 9007199254740991;

SELECT
    STR(@a,18,0) AS [@a]
    ,STR(@a+1,18,0) AS [@a+1]
    ,STR(@a+2,18,0) AS [@a+2]
    ,STR(@a+3,18,0)AS [@a+3]
