BEGIN
     dbms_output.put_line('hello pl/sql');

END;

------------------
DECLARE

       v_1 VARCHAR2(50);
       v_2 BINARY_INTEGER NOT NULL:=34;
       c_3 CONSTANT INT DEFAULT 88;
BEGIN
     dbms_output.put_line('v_1='||v_1||',v_2='||v_2||',c_3='||c_3);

END;

----------
DECLARE
       v_1 INT;
       v_2 INT DEFAULT 6;
       --v_1 VARCHAR2(50);
BEGIN
     DECLARE
            v_1 VARCHAR2(30);
     BEGIN
          v_1:='abc';
          dbms_output.put_line('v_1='||v_1);
     END;
     v_1:=4;
     v_1:=v_1**v_2;
     dbms_output.put_line('v_1='||v_1);
END;

SELECT power(4,6) FROM dual;


------------
DECLARE
       v_price products.price%TYPE;
       
       v_price1 v_price%TYPE;
       
       v_1 NUMBER(6,1) NOT NULL :=59.6;
       
       v_2 v_1%TYPE :=23.5;
       
       v_name products.NAME%TYPE:='x';
BEGIN
     v_price:=90.5;
     v_price1:=45.8;
     dbms_output.put_line('v_price='||v_price||',v_price1='||v_price1);
     dbms_output.put_line('v_name='||v_name);
     
     IF v_name IS NULL THEN
        dbms_output.put_line('v_name is null....');
     ELSE
        dbms_output.put_line('v_name not is null....');
     END IF;
     
     IF v_price>200 THEN
        dbms_output.put_line('非常昂贵！');
      
     ELSIF v_price>100 THEN
        dbms_output.put_line('有点贵！');
     ELSIF v_price>50 THEN
        dbms_output.put_line('中等价格！');
     ELSE
        dbms_output.put_line('便宜！');
     END IF;
     
     CASE
     WHEN v_price>100 THEN dbms_output.put_line('有点贵！');
     WHEN v_price>50 THEN dbms_output.put_line('中等价格！');
     ELSE dbms_output.put_line('便宜！');
     END CASE;
END;

--循环
DECLARE
       v_count BINARY_INTEGER DEFAULT 1;
       v_sum BINARY_INTEGER :=0;

BEGIN
    LOOP
        v_sum:=v_sum+v_count;
        v_count:=v_count+1;
        IF v_count>100 THEN
           EXIT;
        END IF;
    END LOOP; 
    dbms_output.put_line('v_sum='||v_sum);
END;
--
DECLARE
       v_count BINARY_INTEGER DEFAULT 1;
       v_sum BINARY_INTEGER :=0;

BEGIN
    LOOP
        v_sum:=v_sum+v_count;
        v_count:=v_count+1;
        EXIT WHEN v_count>100;
    END LOOP; 
    dbms_output.put_line('v_sum='||v_sum);
END;
-------------
DECLARE
       v_count BINARY_INTEGER DEFAULT 1;
       v_sum BINARY_INTEGER :=0;

BEGIN
    WHILE v_count<=100 LOOP
        v_sum:=v_sum+v_count;
        v_count:=v_count+1;        
    END LOOP; 
    dbms_output.put_line('v_sum='||v_sum);
END;
--
DECLARE
       v_count BINARY_INTEGER DEFAULT 1;
       v_sum BINARY_INTEGER :=0;

BEGIN
    FOR v_count IN 1..100 LOOP
        v_sum:=v_sum+v_count;      
    END LOOP; 
    dbms_output.put_line('v_sum='||v_sum);
END;