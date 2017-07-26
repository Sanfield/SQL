--����products����ѯ��۸���ͬ���Ʒ�м۸���߻�������͵Ĳ�Ʒ�ı�š���Ʒ���ơ� 
SELECT p.product_id,p.name
FROM products p
WHERE p.price IN (SELECT MIN(p1.price)
               FROM products p1
               GROUP BY p1.product_type_id ) OR p.price IN(SELECT MAX(p1.price)
               FROM products p1
               GROUP BY p1.product_type_id)

--����employees����ѯ����û���¼���Ա����š�������
SELECT e1.employee_id,e1.first_name||e1.last_name e1_name
FROM employees e1
WHERE NOT  EXISTS (SELECT *                          
               FROM employees e2
               WHERE e1.employee_id=e2.manager_id)              
        
--����employees����ѯ����Ա�����������Ĺ�����Ա�ı�ź�����
SELECT e1.employee_id,e1.first_name||e1.last_name e1_name
FROM employees e1
WHERE e1.employee_id IN (SELECT e2.manager_id                        
                      FROM employees e2
                      GROUP BY e2.manager_id
                      HAVING COUNT(e2.manager_id)>=2) 
--����products�������Ϊ2�Ĳ�Ʒ�ļ۸��޸�Ϊ3�Ų�Ʒ�۸��1.5��
SELECT *
FROM products

UPDATE products SET price=(SELECT price FROM products WHERE product_id=3)*1.5 
WHERE product_id=2

--5������products���������������2�λ�����������6�Ĳ�Ʒ�۸�����30%    
UPDATE products SET price=price*1.3
 WHERE product_id IN(SELECT pu.product_id 
                           FROM purchases pu 
                           GROUP BY pu.product_id   
                           HAVING SUM(pu.quantity)>=6 OR COUNT(pu.customer_id)>2)  
 SELECT *
 FROM purchases   
 --���ϲ���
SELECT *
FROM product_changes
UNION ALL --�󲢼�
SELECT *
FROM products
ORDER BY 1;

SELECT *
FROM product_changes
UNION 
SELECT *
FROM products
ORDER BY 1;
