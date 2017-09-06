ALTER TABLE products ADD del_flag NUMBER(2)
SELECT top 3
SELECT temp.*
FROM(SELECT p.product_id,product_type_id,p.name,p.description,p.price,t.NAME type_name,ROWNUM rn
FROM products p
LEFT JOIN product_types t USING(product_type_id)
WHERE (p.del_flag IS NULL OR p.del_flag=0) AND  ROWNUM<= 10) temp
WHERE temp.rn> 0
CREATE OR REPLACE PROCEDURE pr_save_prd(p_prd_id OUT products.product_id%TYPE,
                                        p_prd_name products.name%TYPE,
                                        p_type_id products.product_type_id%TYPE,
                                        p_desc products.description%TYPE,
                                        p_price products.price%TYPE)
AS

BEGIN
     INSERT INTO products(product_id,name,product_type_id,description,price,del_flag)
     VALUES(prdId.NEXTVAL,p_prd_name,p_type_id,p_desc,p_price,0);

     SELECT prdId.CURRVAL
     INTO p_prd_id
     FROM dual;
     COMMIT;
END pr_save_prd;
SELECT *
FROM products
---
CREATE SEQUENCE prdId 
INCREMENT BY 1
MINVALUE 20
NOCYCLE
CACHE 50
---
SELECT p.product_id,product_type_id,p.NAME,p.DESCRIPTION,p.del_flag,t.NAME
FROM products p LEFT JOIN product_types t USING(product_type_id)
WHERE p.del_flag IS NULL OR p.del_flag=0
AND p.NAME LIKE '%a%'
AND product_type_id=2
AND p.price>20
AND p.price<80ss
---
SELECT p.product_id,p.NAME prd_name,product_type_id,t.NAME type_name,p.description,p.price FROM products p 
LEFT OUTER JOIN product_types t USING(product_type_id) 
WHERE (p.del_flag IS NULL OR p.del_flag=0) 
and product_type_id=4
--
CREATE TABLE userinfo(
      username  VARCHAR2,
      pwss      Varchar2
      
)