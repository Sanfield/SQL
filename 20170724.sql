-- ����customers���г������ڴ���1969-01-01���û���Ϣ
SELECT *
FROM customers
WHERE dob>DATE'1969-1-1';

--(1) ����customers���й˿�first_name�ڶ����ַ��ǡ�o���Ĺ˿���Ϣ
SELECT *
FROM customers
WHERE first_name LIKE '_o%';

--(2) ����customers���й˿�first_name�а�����e���Ĺ˿���Ϣ
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
--����employees���У����Ϊ2��4��Ա����Ϣ
SELECT *
FROM employees
WHERE employee_id IN (2,4);

--����products���У����ͱ�Ų�Ϊ1��2�Ĳ�Ʒ�ı�š����ơ����ͱ��
SELECT  product_id,NAME,product_type_id
FROM products
WHERE product_type_id NOT IN (1,2);
------------
SELECT  product_id,NAME,product_type_id
FROM products
WHERE product_type_id NOT IN (1,2,NULL);

--������Ʒ���У���Ʒ��Ž���8��10֮��Ĳ�Ʒ�ı�š����ơ�
SELECT product_id,NAME
FROM products
WHERE product_id BETWEEN 8 AND 10;

SELECT product_id,NAME
FROM products
WHERE product_id NOT BETWEEN 8 AND 10;

--�����û����У��绰���벻Ϊ�յ��û�����Ϣ��
SELECT *
FROM customers
WHERE phone IS NOT NULL;

SELECT *
FROM customers
WHERE phone IS  NULL;

----------------------------------
--��customers���м�������������1960-1-1����first_name�ԡ�C����ͷ�Ĺ˿���Ϣ
SELECT *
FROM customers
WHERE dob>DATE'1960-1-1' AND first_name LIKE 'C%';

--��customers���м�����Ž���3��4֮�����Ա��Ϣ
SELECT *
FROM customers
WHERE customer_id BETWEEN 3 AND 4;

SELECT *
FROM customers
WHERE customer_id IN (3,4);

SELECT *
FROM customers
WHERE customer_id>=3 AND customer_id<=4;

--�������С��3����Ա��Ϣ
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

--��ѯ���Ϊ3�Ĳ�Ʒ�����ơ����ͱ�š���������
SELECT p.product_id,p.NAME prd_name,p.product_type_id,t.NAME type_name
FROM products p,product_types t
WHERE p.product_type_id=t.product_type_id
AND p.product_id=3;

--
SELECT *
FROM products,product_types;

--����������Ϣ���ѹ������Ʒ�Ĺ˿�ID���˿�����������Ĳ�ƷID����Ʒ���ơ���Ʒ�����͡�
SELECT pu.customer_id,cst.first_name||' '||cst.last_name cst_name,pu.product_id,prd.NAME prd_name,
       prd.product_type_id,t.NAME type_name
FROM purchases pu,customers cst,products prd,product_types t
WHERE pu.customer_id=cst.customer_id AND pu.product_id=prd.product_id
     AND prd.product_type_id=t.product_type_id;

----------
--��ѯ��Ʒ��Ϣ���������ƣ�ĳЩ��Ʒ��ʱ��û�����ͣ�ҲҪ�������Ʒ��Ϣ
SELECT *
FROM products p,product_types t
WHERE p.product_type_id=t.product_type_id(+);--Oracle

SELECT *
FROM products p,product_types t
WHERE t.product_type_id(+)=p.product_type_id;

--��ѯ��Ʒ��Ϣ���������ƣ� ĳЩ������ʱ��û�ж�Ӧ�Ĳ�Ʒ��ҲҪ�����������Ϣ
SELECT p.product_id,t.product_type_id,p.NAME prd_name,t.NAME type_name
FROM products p,product_types t
WHERE p.product_type_id(+)=t.product_type_id;

--����Ա����������������˾��������
SELECT emp.employee_id,emp.first_name||emp.last_name emp_name,
       emp.manager_id,mgr.first_name||mgr.last_name mgr_name
FROM employees emp,employees mgr
WHERE emp.manager_id=mgr.employee_id(+);

--