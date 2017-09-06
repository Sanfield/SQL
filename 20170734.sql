SELECT p.product_id,p.NAME,product_type_id,p.DESCRIPTION,p.price,t.name type_name 
	FROM products p LEFT JOIN product_types t USING(product_type_id)
----
		SELECT product_type_id,t.name type_name,p.name,p.product_id,p.description,p.price
		FROM product_types t  RIGHT OUTER  JOIN products p USING(product_type_id)
		WHERE (p.del_flag IS NULL OR p.del_flag=0) 
    AND product_type_id=1
    
    SELECT *
    FROM product_types
    
      SELECT *
    FROM products