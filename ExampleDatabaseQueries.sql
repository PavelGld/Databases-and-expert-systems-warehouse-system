/* ��������� id ������ � ������ ������  � ���������� ����� 
 * � ����������� �� ���������� ��������� ����������*/
SELECT ID_Storage,Storage_address FROM storage 
WHERE Storage_status = 1 AND fkey_firm = 6
ORDER BY  Num_pallet_places - Num_occupied_pallet_places DESC ;


/* ��������� ������ ������ � ������ ����� ��� �����, 
 * ��� � ��� ���� ��������� ����������� � �� ������ */
SELECT Storage_address,fkey_firm FROM storage 
WHERE Storage_status = 1 AND  Num_pallet_places>Num_occupied_pallet_places;

/* ��������� ������ 2 ��������� ������������ � ������ ������
 *  � ����������� ������ �������� � ����������� �� ���� �������� */
SELECT DISTINCT Departure_date,fkey_Transport_firm  FROM Obj_item 
WHERE Past_storage_address = "�.�����, ��. ������ 60"
ORDER BY Departure_date DESC 
LIMIT 2;


/* ������ ����������� �� ������ ������� � ������ �� ���� �������� � �������� */
SELECT Model_name,Departure_date,receiving_date FROM  Model
INNER JOIN Obj_item ON ID_Model = fkey_Model
GROUP BY ID_Model
HAVING Departure_date>'2000-01-03' AND receiving_date< '2040-01-03';



/* ������ ������ ����������� ������ � ��������� ��������� ������� EXCEPT */
SELECT * FROM  Model
INNER JOIN Obj_item ON ID_Model = fkey_Model
EXCEPT 
SELECT * FROM  Model 
INNER JOIN Obj_item ON ID_Model = fkey_Model
WHERE ID_Model = 1;



/* ��������� ������ ������� � ������� 
 * ���������� �������� ��������� ����� ������
 *  � ����� ���������� �� �������� */
SELECT ID_Pallet,Company_name FROM Obj_item 
INNER JOIN Transport_firm ON fkey_Transport_firm = ID_Transport_firm
INNER JOIN Pallet ON ID_Pallet = fkey_Pallet
WHERE Num_of_items>1;


/* ������� �������� ���� ������������ � ��������� � ���������������� */
SELECT Firm_name FROM firm 
LEFT OUTER JOIN Transport_firm
WHERE Firm_name = Company_name;


/* ������� �������� ���� ������������ ����������������
 * , � ����� ���� ����� ������������ ��������� � ����� �� ��������� */
SELECT Firm_name FROM firm 
LEFT OUTER JOIN Transport_firm ON Firm_name = Company_name;




SELECT * FROM table1 CROSS JOIN table2
WHERE sex = "�";



SELECT * FROM table1
WHERE sex = "�"
UNION ALL 
SELECT * FROM table1 
WHERE id > 3;



SELECT * FROM table1
WHERE sex = "�"
INTERSECT
SELECT * FROM table1 
WHERE id > 3;


CREATE VIEW view_from_table1 AS
SELECT * FROM table1
WHERE sex="�";



SELECT id, name, sex, SUM(sal) AS salary FROM table1 
WHERE sex = "�"
GROUP BY name;