DECLARE 
  @a FLOAT = 0.1,
  @b FLOAT = 0.2,
  @c FLOAT = 0.3;

SELECT
  CASE
    WHEN @a+@b+@c = @c+@b+@a THEN 'equals'
	ELSE 'different'
  END;