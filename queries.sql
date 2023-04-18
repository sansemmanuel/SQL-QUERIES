/* How many transactions took place between 2011-2012 */

SELECT
	sum (*)
FROM
	Invoice
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'







/* get a list of customers who made purchs between 2011-2012 */

SELECT 
	c.FirstName,
	c.LastName,
	i.total
FROM
	Invoice i
INNER JOIN
	Customer c
ON i.CustomerId = c.CustomerId
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
ORDER BY
	i.total DESC







/* SUM TOTAL */
SELECT
	InvoiceDate,
	sum(total)
FROM
	Invoice
WHERE InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'










/* Get a list of customers,sales rep, total transactions for each cust 2011-2012  */

SELECT 
	c.FirstName AS [Customer FN],
	c.LastName AS [Customer LN],
	e.FirstName AS [Employee EFN],
	e.LastName AS [Employee ELN],
	i.total
FROM
	Invoice i
INNER JOIN
	Customer c
ON i.CustomerId = c.CustomerId
INNER JOIN
	Employee e 
ON e.EmployeeId = c.SupportRepId
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
ORDER BY
	i.total DESC



/* how many transactions are above the avg amount during the same time? */

SELECT
	round(avg(total),2) AS [Avg Transaction Total]
FROM
	Invoice
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'

/* above average */

SELECT 
	count(Total) AS [Num of Transactions above avg]
FROM
	Invoice
WHERE
	Total >
( SELECT 
	round(avg(total),2) AS [AVG TRANSACTION TOTAL]
FROM
	Invoice
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
)
