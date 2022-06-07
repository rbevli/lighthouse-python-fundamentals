/* SQL Exercise
====================================================================
We will be working with database northwind.db we have set up and connected to in the activity Connect to Remote PostgreSQL Database earlier.


-- MAKE YOURSELF FAIMLIAR WITH THE DATABASE AND TABLES HERE





--==================================================================
/* TASK I
-- Q1. Write a query to get Product name and quantity/unit.
*/

SELECT productname,quantity FROM order_details
JOIN products ON order_details.productid=products.productid;

/* TASK II
Q2. Write a query to get the most expensive and the least expensive Product (name and unit price) (2 separate queries)
*/
SELECT productname, max(unitprice) FROM products GROUP BY productname LIMIT 1;
SELECT productname, min(unitprice) FROM products GROUP BY productname LIMIT 1;

/* TASK III
Q3. Write a query to count current and discontinued products.
*/
select count(discontinued)-sum(discontinued) as current ,sum(discontinued) as discontinued from products;
select discontinued from products;

/* TASK IV
Q4. Select all product names and their category names (77 rows)
*/

select productname, categoryname from products
JOIN categories ON products.categoryid=categories.categoryid;

/* TASK V
Q5. Select all product names, unit price and the supplier region that don't have suppliers from the country USA. (65 rows)
*/
select productname, unitprice, region FROM products
JOIN suppliers ON products.supplierid= suppliers.supplierid
WHERE region != 'USA';

/* TASK VI
Q6. Get the total quantity of orders sold.( 51317)
*/
select sum(quantity) from order_details;


/* TASK VII
Q7. Get the total quantity of orders sold for each order.(830 rows)
*/
select sum(quantity) from order_details GROUP BY orderid;


/* TASK VIII
Q8. Get the number of employees who have been working more than 5 year in the company. (9 rows)
*/
select count(employeeid)
from employees
WHERE (DATE_PART('year', CURRENT_DATE) - DATE_PART('year', hiredate))  > 5;