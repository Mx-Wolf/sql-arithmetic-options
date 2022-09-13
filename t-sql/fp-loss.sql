DECLARE
  @a FLOAT = 9007199254740992;

SELECT
  CASE WHEN @a = @a+1 THEN 'equals'
    ELSE 'differ'
  END;
