declare @a int = 1,
@b int = 0;

begin TRY

  select
    @a / @b [ratio];

  select
    'Completed' [message];

end TRY begin CATCH
  select 
    ERROR_LINE() [ERROR_LINE],
    ERROR_NUMBER() [ERROR_NUMBER],
    ERROR_MESSAGE() [ERROR_MESSAGE]
end CATCH