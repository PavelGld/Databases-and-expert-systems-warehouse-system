/* выделение id склада и адреса склада  у конкретной фирмы 
 * с сортировкой по количеству свободных палетомест*/
SELECT ID_Storage,Storage_address FROM storage 
WHERE Storage_status = 1 AND fkey_firm = 6
ORDER BY  Num_pallet_places - Num_occupied_pallet_places DESC ;


/* выделение адреса склада и номера фирмы при учете, 
 * что в нем есть свободные палетоместа и он открыт */
SELECT Storage_address,fkey_firm FROM storage 
WHERE Storage_status = 1 AND  Num_pallet_places>Num_occupied_pallet_places;

/* Выделение первых 2 предметов отправленных с одного адреса
 *  с уникальными датами отправки с сортировкой по дате отправки */
SELECT DISTINCT Departure_date,fkey_Transport_firm  FROM Obj_item 
WHERE Past_storage_address = "Г.Пермь, ул. Ленина 60"
ORDER BY Departure_date DESC 
LIMIT 2;


/* Пример группировки по модели объекта и отбора по дате отправки и прибытия */
SELECT Model_name,Departure_date,receiving_date FROM  Model
INNER JOIN Obj_item ON ID_Model = fkey_Model
GROUP BY ID_Model
HAVING Departure_date>'2000-01-03' AND receiving_date< '2040-01-03';



/* Пример вывода пересечения таблиц с удалением елементов методом EXCEPT */
SELECT * FROM  Model
INNER JOIN Obj_item ON ID_Model = fkey_Model
EXCEPT 
SELECT * FROM  Model 
INNER JOIN Obj_item ON ID_Model = fkey_Model
WHERE ID_Model = 1;



/* Получение списка палетов у которых 
 * количество хранимых предметов более одного
 *  к фирме отвечавшей за отправку */
SELECT ID_Pallet,Company_name FROM Obj_item 
INNER JOIN Transport_firm ON fkey_Transport_firm = ID_Transport_firm
INNER JOIN Pallet ON ID_Pallet = fkey_Pallet
WHERE Num_of_items>1;


/* Вывести название фирм занимающихся и хранением и транспортировкой */
SELECT Firm_name FROM firm 
LEFT OUTER JOIN Transport_firm
WHERE Firm_name = Company_name;


/* Вывести название фирм занимающихся транспортировкой
 * , а также есть фирма занимающаяся хранением с таким же названием */
SELECT Firm_name FROM firm 
LEFT OUTER JOIN Transport_firm ON Firm_name = Company_name;




SELECT * FROM table1 CROSS JOIN table2
WHERE sex = "ж";



SELECT * FROM table1
WHERE sex = "ж"
UNION ALL 
SELECT * FROM table1 
WHERE id > 3;



SELECT * FROM table1
WHERE sex = "ж"
INTERSECT
SELECT * FROM table1 
WHERE id > 3;


CREATE VIEW view_from_table1 AS
SELECT * FROM table1
WHERE sex="м";



SELECT id, name, sex, SUM(sal) AS salary FROM table1 
WHERE sex = "ж"
GROUP BY name;