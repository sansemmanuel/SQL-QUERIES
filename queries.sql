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


