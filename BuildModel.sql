CREATE TABLE IF NOT EXISTS firm
(
ID_Firm integer PRIMARY KEY NOT NULL,
Firm_name varchar UNIQUE
);

CREATE TABLE IF NOT EXISTS storage
(
ID_Storage INTEGER PRIMARY KEY NOT NULL,
Storage_address varchar UNIQUE,
Kind_storage INTEGER,
Storage_status INTEGER,
Num_pallet_places INTEGER,
Num_occupied_pallet_places INTEGER,

fkey_firm INTEGER NOT NULL,
FOREIGN KEY (fkey_firm) REFERENCES firm(ID_Firm) 
			ON DELETE SET NULL
			ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS Manual_selection_zone
(
Num_pallet_places INTEGER ,
Num_occupied_pallet_places INTEGER ,
ID_Manual_zone INTEGER PRIMARY KEY NOT NULL,

fkey_storage INTEGER NOT NULL,
FOREIGN KEY (fkey_storage) REFERENCES storage(ID_Storage) 
			ON DELETE SET NULL
			ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Pallet
(
ID_Pallet INTEGER PRIMARY KEY NOT NULL,
Num_of_items INTEGER,
fkey_storage INTEGER,
fkey_Manual_zone INTEGER,
FOREIGN KEY (fkey_storage) REFERENCES storage(ID_Storage) 
			ON DELETE SET NULL
			ON UPDATE CASCADE,
			
FOREIGN KEY (fkey_Manual_zone) REFERENCES Manual_selection_zone(ID_Manual_zone) 
			ON DELETE SET NULL
			ON UPDATE CASCADE


);

CREATE TABLE IF NOT EXISTS Model
(
ID_Model INTEGER PRIMARY KEY NOT NULL,
Model_name varchar,
Category varchar

);

CREATE TABLE IF NOT EXISTS Transport_firm
(
ID_Transport_firm INTEGER PRIMARY KEY NOT NULL,
Company_name varchar,
Num_contract INTEGER,
Date_conclusion_contr DATE,
Date_start_coop DATE,
Date_end_coop DATE
);



CREATE TABLE IF NOT EXISTS Obj_item
(
ID_obj INTEGER PRIMARY KEY NOT NULL,
Past_storage_address varchar,
Departure_date DATE,
receiving_date DATE,

fkey_Pallet INTEGER,
fkey_Model INTEGER,
fkey_Transport_firm INTEGER,

FOREIGN KEY (fkey_Pallet) REFERENCES Pallet(ID_Pallet) 
			ON DELETE SET NULL
			ON UPDATE CASCADE,
			
FOREIGN KEY (fkey_Model) REFERENCES Model(ID_Model) 
			ON DELETE SET NULL
			ON UPDATE CASCADE,
			
FOREIGN KEY (fkey_Transport_firm) REFERENCES Transport_firm(ID_Transport_firm) 
			ON DELETE SET NULL
			ON UPDATE CASCADE


);








