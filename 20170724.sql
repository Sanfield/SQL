-- 检索customers表中出生日期大于1969-01-01的用户信息
SELECT *
FROM customers
WHERE dob>DATE'1969-1-1';

--(1) 检索customers表中顾客first_name第二个字符是’o’的顾客信息
SELECT *
FROM customers
WHERE first_name LIKE '_o%';

--(2) 检索customers表中顾客first_name中包含’e’的顾客信息
SELECT *
FROM customers
WHERE first_name LIKE '%e%';
--------------
SELECT *
FROM promotions
WHERE NAME LIKE '%\%%' ESCAPE '\';

-------------------
SELECT *
FROM customers
WHERE phone NOT LIKE '800-555-%';

-----------------------
--检索employees表中，编号为2和4的员工信息
SELECT *
FROM employees
WHERE employee_id IN (2,4);

--检索products表中，类型编号不为1和2的产品的编号、名称、类型编号
SELECT  product_id,NAME,product_type_id
FROM products
WHERE product_type_id NOT IN (1,2);
------------
SELECT  product_id,NAME,product_type_id
FROM products
WHERE product_type_id NOT IN (1,2,NULL);

--检索产品表中，产品编号介于8和10之间的产品的编号、名称。
SELECT product_id,NAME
FROM products
WHERE product_id BETWEEN 8 AND 10;

SELECT product_id,NAME
FROM products
WHERE product_id NOT BETWEEN 8 AND 10;

--检索用户表中，电话号码不为空的用户的信息。
SELECT *
FROM customers
WHERE phone IS NOT NULL;

SELECT *
FROM customers
WHERE phone IS  NULL;

----------------------------------
--从customers表中检索出生日期于1960-1-1并且first_name以’C’开头的顾客信息
SELECT *
FROM customers
WHERE dob>DATE'1960-1-1' AND first_name LIKE 'C%';

--从customers表中检索编号介于3和4之间的人员信息
SELECT *
FROM customers
WHERE customer_id BETWEEN 3 AND 4;

SELECT *
FROM customers
WHERE customer_id IN (3,4);

SELECT *
FROM customers
WHERE customer_id>=3 AND customer_id<=4;

--检索编号小于3的人员信息
SELECT *
FROM employees 
WHERE employee_id<3;

SELECT *
FROM employees 
WHERE NOT employee_id>=3;

--order by
SELECT *
FROM products
ORDER BY price ASC;

SELECT *
FROM products
ORDER BY price DESC,product_id ASC;

SELECT *
FROM products
ORDER BY 5 DESC,1 ASC;


SELECT *
FROM products
ORDER BY price DESC NULLS LAST;
---------------------------------
SELECT *
FROM products
ORDER BY price NULLS FIRST;

--查询编号为3的产品的名称、类型编号、类型名称
SELECT p.product_id,p.NAME prd_name,p.product_type_id,t.NAME type_name
FROM products p,product_types t
WHERE p.product_type_id=t.product_type_id
AND p.product_id=3;

--
SELECT *
FROM products,product_types;

--检索如下信息：已购买过产品的顾客ID、顾客姓名、购买的产品ID，产品名称、产品的类型。
SELECT pu.customer_id,cst.first_name||' '||cst.last_name cst_name,pu.product_id,prd.NAME prd_name,
       prd.product_type_id,t.NAME type_name
FROM purchases pu,customers cst,products prd,product_types t
WHERE pu.customer_id=cst.customer_id AND pu.product_id=prd.product_id
     AND prd.product_type_id=t.product_type_id;

----------
--查询产品信息及类型名称，某些产品暂时还没有类型，也要求输出产品信息
SELECT *
FROM products p,product_types t
WHERE p.product_type_id=t.product_type_id(+);--Oracle

SELECT *
FROM products p,product_types t
WHERE t.product_type_id(+)=p.product_type_id;

--查询产品信息及类型名称， 某些类型暂时还没有对应的产品，也要求输出类型信息
SELECT p.product_id,t.product_type_id,p.NAME prd_name,t.NAME type_name
FROM products p,product_types t
WHERE p.product_type_id(+)=t.product_type_id;

--检索员工的姓名和他的上司的姓名。
SELECT emp.employee_id,emp.first_name||emp.last_name emp_name,
       emp.manager_id,mgr.first_name||mgr.last_name mgr_name
FROM employees emp,employees mgr
WHERE emp.manager_id=mgr.employee_id(+);

--