--基于products表，查询其价格是同类产品中价格最高或者是最低的产品的编号、产品名称。 
SELECT p.product_id,p.name
FROM products p
WHERE p.price IN (SELECT MIN(p1.price)
               FROM products p1
               GROUP BY p1.product_type_id ) OR p.price IN(SELECT MAX(p1.price)
               FROM products p1
               GROUP BY p1.product_type_id)

--基于employees表，查询手下没有下级的员工编号、姓名。
SELECT e1.employee_id,e1.first_name||e1.last_name e1_name
FROM employees e1
WHERE NOT  EXISTS (SELECT *                          
               FROM employees e2
               WHERE e1.employee_id=e2.manager_id)              
        
--基于employees表，查询手下员工超过两名的管理人员的编号和姓名
SELECT e1.employee_id,e1.first_name||e1.last_name e1_name
FROM employees e1
WHERE e1.employee_id IN (SELECT e2.manager_id                        
                      FROM employees e2
                      GROUP BY e2.manager_id
                      HAVING COUNT(e2.manager_id)>=2) 
--更新products表，将编号为2的产品的价格修改为3号产品价格的1.5倍
SELECT *
FROM products

UPDATE products SET price=(SELECT price FROM products WHERE product_id=3)*1.5 
WHERE product_id=2

--5、更新products表，将购买次数超过2次或购买数量超过6的产品价格提升30%    
UPDATE products SET price=price*1.3
 WHERE product_id IN(SELECT pu.product_id 
                           FROM purchases pu 
                           GROUP BY pu.product_id   
                           HAVING SUM(pu.quantity)>=6 OR COUNT(pu.customer_id)>2)  
 SELECT *
 FROM purchases   
 --集合操作
SELECT *
FROM product_changes
UNION ALL --求并集
SELECT *
FROM products
ORDER BY 1;

SELECT *
FROM product_changes
UNION 
SELECT *
FROM products
ORDER BY 1;
