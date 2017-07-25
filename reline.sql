--��ϰ��
--����ͳ�Ʊ�����
CREATE TABLE sale_info(
       YEAR INT,
       MONTH INT,
       amount NUMBER(6,1)
);
INSERT INTO sale_info VALUES(2014,1,123.2);
INSERT INTO sale_info VALUES(2014,2,235);
INSERT INTO sale_info VALUES(2014,3,312.5);
INSERT INTO sale_info VALUES(2014,4,400.2);
INSERT INTO sale_info VALUES(2014,5,213.8);
INSERT INTO sale_info VALUES(2014,6,233.5);
INSERT INTO sale_info VALUES(2014,7,198.6);
INSERT INTO sale_info VALUES(2014,8,323.2);
INSERT INTO sale_info VALUES(2014,9,333.6);
INSERT INTO sale_info VALUES(2014,10,400);
INSERT INTO sale_info VALUES(2014,11,402.8);
INSERT INTO sale_info VALUES(2014,12,368.5);
INSERT INTO sale_info VALUES(2015,1,324.2);
INSERT INTO sale_info VALUES(2015,2,202.4);
INSERT INTO sale_info VALUES(2015,3,285.3);
INSERT INTO sale_info VALUES(2015,4,401.2);
INSERT INTO sale_info VALUES(2015,5,199.6);
INSERT INTO sale_info VALUES(2015,6,203.7);
INSERT INTO sale_info VALUES(2015,7,188.5);
INSERT INTO sale_info VALUES(2015,8,301.2);
INSERT INTO sale_info VALUES(2015,9,277);
INSERT INTO sale_info VALUES(2015,10,234.6);
INSERT INTO sale_info VALUES(2015,11,224.1);
INSERT INTO sale_info VALUES(2015,12,299.7);


SELECT *
FROM sale_info;

/*Ҫ�󣬼�������ĸ�ʽ��
YEAR  1��      2��     3��     4��       5��       6��       7��      8��    9��    10��      11��      12��
2014  123.2    235     312.5   400.2     213.8     233.5     198.6    323.2  333.6  400       402.8     368.5
2015  324.2    202.4   285.3   401.2     199.6     203.7     188.5    301.2  277    234.6     224.1     299.7
*/
SELECT YEAR,MAX(CASE MONTH WHEN 1 THEN amount ELSE 0 END) "1��",
          SUM(CASE MONTH WHEN 2 THEN amount ELSE 0 END) "2��",
          SUM(CASE MONTH WHEN 3 THEN amount ELSE 0 END) "3��",
          SUM(CASE MONTH WHEN 4 THEN amount ELSE 0 END) "4��"
FROM sale_info
GROUP BY YEAR;
