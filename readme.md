# On Stored Procedures Error Handling

While reviewing some code I found an interesting piece. The code abstracted to easy follow as this.

```sql
CREATE PROCEDURE DoesItWork
    @Denominator FLOAT
AS
BEGIN
    DECLARE @Factor FLOAT = 1 / @Denominator;

    SELECT
        @Factor AS [@Factor]
END;

```

Will this code work? Always?

Take a brief moment to evaluate where the following is true or not

* The procedure will always return a record-set with a single column.
* For argument value of `NULL` there will be an error message
* For argument value of `0` there will be an error message

My intention is to refresh your understanding of T-SQL error handling options. By the end of today meeting you should be able to answer these questions.

## Speaking of numbers

A few words on IEEE754 standard. The impossible task to represent the continuum of real numbers was solved with a compromise.

* Numbers have gaps
* Addition is not commutative
* There are numeric values that are not numbers

The following code shows max_safe_integer value

```ts
DECLARE
  @a FLOAT = 9007199254740991;

SELECT
    STR(@a,18,0) AS [@a]
    ,STR(@a+1,18,0) AS [@a+1]
    ,STR(@a+2,18,0) AS [@a+2]
    ,STR(@a+3,18,0)AS [@a+3]
```

The code produces

|@a|@a+1|@a+2|@a+3|
|---|---|---|---|
|  9007199254740991|   9007199254740992|  9007199254740992|  9007199254740994|

this result is not unique to T-SQL and is observed everywhere. JavaScript, C# to name a few. This is the property of `double`.

The following code demonstrates danger of equality comparison in doubles.

```sql
DECLARE 
  @a FLOAT = 0.1,
  @b FLOAT = 0.2,
  @c FLOAT = 0.3;

SELECT
  CASE
    WHEN @a+@b+@c = @c+@b+@a THEN 'equals'
    ELSE 'different'
  END;
```

## Not Fully IEEE 754

The most clear wording on data type `float` comes (surprise) from the article on xpath data types.

> The number data type is always an IEEE 754 double-precision floating-point. The SQL Server float(53) data type is the closest to XPath number. However, float(53) is not exactly IEEE 754. For example, neither NaN (Not-a-Number) nor infinity is used.

This information important for refactoring legacy stored procedures while extracting computation logic.

## Stored procedures magic

Many seasoned sql server developers with stored procedures experience will tell you a story of magic SSMS being able to execute their t-sql code faster compare to their backend applications. Their experience tell all sort of tricks like this one

```sql
CREATE PROCEDURE get_orders_variable
  @bop DATETIME
AS
BEGIN
  DECLARE @bop_copy DATETIME;
  set @bop_copy = @bop;

  SELECT o.OrderID 
  FROM Orders o 
  WHERE o.OrderDate > @bop_copy;
END
```

## Tools and Technologies

We submit requests to SQL server using different tools

* sqlcmd
* ssms

we also connect to it from our applications


