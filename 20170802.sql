		SELECT p.product_id,p.NAME,p.product_type_id,p.DESCRIPTION,p.price
		FROM products p
		WHERE p.del_flag IS NULL OR p.del_flag=0
    
  SELECT username uname,pwss pwd
	FROM userinfo
	WHERE username='lisi'
  	SELECT username uname,pwss pwd
		FROM userinfo
		WHERE username='zhangsan'
    
		SELECT p.product_id prdId,p.NAME prdName,p.product_type_id prdType,p.DESCRIPTION ,p.price
		FROM products p
		WHERE p.del_flag IS NULL OR p.del_flag=0
    
    select prdid.nextval from dual
    
SELECT p.product_id prdId,p.NAME prdName,p.product_type_id prdType,p.DESCRIPTION de,p.price
FROM products p	

SELECT *
FROM product