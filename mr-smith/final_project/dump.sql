PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE materials (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT NOT NULL,
    base_price INTEGER NOT NULL
);
INSERT INTO materials VALUES(1,'Pine',2);
INSERT INTO materials VALUES(2,'Stone',1);
INSERT INTO materials VALUES(3,'Wrought Iron',3);
INSERT INTO materials VALUES(4,'Tin',5);
INSERT INTO materials VALUES(5,'Cast Iron',4);
INSERT INTO materials VALUES(6,'Birch',3);
INSERT INTO materials VALUES(7,'Leather Scraps',1);
INSERT INTO materials VALUES(8,'Twine',1);
INSERT INTO materials VALUES(9,'Yew',5);
INSERT INTO materials VALUES(10,'Maple',7);
INSERT INTO materials VALUES(11,'Hide',3);
INSERT INTO materials VALUES(12,'Leather',5);
INSERT INTO materials VALUES(13,'Bronze',7);
INSERT INTO materials VALUES(14,'Catgut',7);
INSERT INTO materials VALUES(15,'Horse Hoof',8);
INSERT INTO materials VALUES(16,'Rosewood',9);
INSERT INTO materials VALUES(17,'Steel',9);
INSERT INTO materials VALUES(18,'Aluminum',2);
INSERT INTO materials VALUES(19,'Copper',6);
INSERT INTO materials VALUES(20,'Brass',8);
INSERT INTO materials VALUES(21,'Silver',10);
INSERT INTO materials VALUES(22,'Hound''s Tooth',10);
INSERT INTO materials VALUES(23,'Gold',12);
INSERT INTO materials VALUES(24,'Oak',12);
INSERT INTO materials VALUES(25,'Platinum',15);
INSERT INTO materials VALUES(26,'Tiger''s Claw',15);
INSERT INTO materials VALUES(27,'Burl',15);
INSERT INTO materials VALUES(28,'Mithril',18);
INSERT INTO materials VALUES(29,'Ebony',20);
INSERT INTO materials VALUES(30,'Ivory',20);
INSERT INTO materials VALUES(31,'Adamantium',20);
INSERT INTO materials VALUES(32,'Hemp Rope',5);
INSERT INTO materials VALUES(33,'Silk Rope',10);
CREATE TABLE creations (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT NOT NULL,
    base_price INTEGER NOT NULL
);
INSERT INTO creations VALUES(1,'Stone Axe',12);
INSERT INTO creations VALUES(2,'Shoddy Leather Vest',13);
INSERT INTO creations VALUES(3,'Simple Shortbow',12);
INSERT INTO creations VALUES(4,'Wooden Sword',8);
INSERT INTO creations VALUES(5,'Wooden Flute',10);
INSERT INTO creations VALUES(6,'Training Sword',15);
INSERT INTO creations VALUES(7,'Simple Shield',15);
CREATE TABLE IF NOT EXISTS 'merchants' (
    id INTEGER PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    inv_1 INTEGER,
    inv_2 INTEGER,
    inv_3 INTEGER,
    inv_4 INTEGER,
    inv_5 INTEGER, 'inv_1_amt' INTEGER NOT NULL DEFAULT 0, 'inv_2_amt' INTEGER NOT NULL DEFAULT 0, 'inv_3_amt' INTEGER NOT NULL DEFAULT 0, 'inv_4_amt' INTEGER NOT NULL DEFAULT 0, 'inv_5_amt' INTEGER NOT NULL DEFAULT 0,'gold' INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY(inv_1) REFERENCES materials(id),
    FOREIGN KEY(inv_2) REFERENCES materials(id),
    FOREIGN KEY(inv_3) REFERENCES materials(id),
    FOREIGN KEY(inv_4) REFERENCES materials(id),
    FOREIGN KEY(inv_5) REFERENCES materials(id)
);
INSERT INTO merchants VALUES(1,'Frank Pemberton',1,6,9,10,16,12,7,4,3,3,3238);
INSERT INTO merchants VALUES(2,'Crankle Jarnby',7,11,12,14,22,10,5,4,5,1,3258);
INSERT INTO merchants VALUES(3,'Gronkle Thornhammer',2,18,3,4,13,7,5,7,4,2,3220);
INSERT INTO merchants VALUES(4,'Kimblewitz Bandersnatch',8,32,10,15,20,10,6,6,2,1,3020);
CREATE TABLE IF NOT EXISTS 'food' ('id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'name' TEXT NOT NULL, 'price' INTEGER NOT NULL DEFAULT 0 , 'energy' INTEGER NOT NULL DEFAULT 0 );
INSERT INTO food VALUES(1,'Bread',2,1);
INSERT INTO food VALUES(2,'Beet Porridge',4,2);
INSERT INTO food VALUES(3,'Lambchop',7,4);
INSERT INTO food VALUES(4,'Milksteak',12,8);
CREATE TABLE IF NOT EXISTS 'lodging' ('id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'name' TEXT NOT NULL, 'price' INTEGER NOT NULL DEFAULT 0 ,'recovery' REAL NOT NULL DEFAULT 0 );
INSERT INTO lodging VALUES(1,'On the Floor In the Back',10,20.0);
INSERT INTO lodging VALUES(2,'Business Class Floor in the Back',15,40.0);
INSERT INTO lodging VALUES(3,'An Actual Room',30,80.0);
INSERT INTO lodging VALUES(4,'The Executive Hovel',40,100.0);
CREATE TABLE IF NOT EXISTS 'levels' ('level' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'experience' INTEGER NOT NULL DEFAULT 100 , 'max_energy' INTEGER NOT NULL DEFAULT 10 );
INSERT INTO levels VALUES(1,100,10);
INSERT INTO levels VALUES(2,200,15);
INSERT INTO levels VALUES(3,300,20);
INSERT INTO levels VALUES(4,400,25);
INSERT INTO levels VALUES(5,500,30);
CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, username TEXT NOT NULL, hash TEXT NOT NULL);
INSERT INTO users VALUES(1,'Test','scrypt:32768:8:1$kKtGvvwlUXaqzXa2$b6a2998c03c9716747288d139494fd1702d152b55eac9b0d04cb96d5841c9a389e2e50de1b6fceb3b989c21e59376a3204cc75f9a82fb4f1c8cdb4369b748f01');
INSERT INTO users VALUES(2,'Test2','scrypt:32768:8:1$fZuXTQOJCrT8CVc8$875a3d66d431eef99bf84ccc66c3b7e0a30eacfbe7db74e3a41273a191b7c88133f8269e13ba2be43d6d27e4de96a934542b2d2332de2b75db86b8e5dae5da0a');
INSERT INTO users VALUES(3,'James','scrypt:32768:8:1$83JEVqHSOk82BPgU$ad854b3e7a6cdf1b48d0fa91e247762de252963cfb7d61bb339f29672de9359a939ad6f0c73e78340da9969959b1964a31c6929b3908901dd2bdba7eaed65d04');
INSERT INTO users VALUES(4,'Test3','scrypt:32768:8:1$F7nQSbS85nJbj7C5$67f6205382c4d3f1a386b125ec447e73d87c94606453afe45f9b56cfacaefb9f749fcfec21cfcf4a7086a9cdf14fb80e0266db0b433174aa53c8db7f318b10cd');
INSERT INTO users VALUES(5,'Sparklemotion','scrypt:32768:8:1$bHqHrbYlawWVzqYr$edbd81016e7f4146eeffa8fa159054429d80cde4c86a020829e72af11546c5a844db271963bfe5e5a1dfebf2b5d3bf806d74266eb551e924d3cbcd89ba573641');
INSERT INTO users VALUES(6,'"DataBreach" Test','scrypt:32768:8:1$lVJEgX5HBSX4ANN8$8ce68ec0d93f3aab12653a01b9e1f332873dcd0b861c590d352a904fb5a59da2408fcb30e3841c4b0f7f74c84831d5f6824735f520d86d31d95e229d145d7fa5');
CREATE TABLE IF NOT EXISTS "materials_inventory" (
    mat_id INTEGER NOT NULL, amount INTEGER DEFAULT 0, player_id INTEGER NOT NULL DEFAULT 1,
    FOREIGN KEY(mat_id) REFERENCES materials(id),
    FOREIGN KEY(player_id) REFERENCES stats(player_id)
);
INSERT INTO materials_inventory VALUES(1,11,1);
INSERT INTO materials_inventory VALUES(2,3,1);
INSERT INTO materials_inventory VALUES(3,10,1);
INSERT INTO materials_inventory VALUES(5,12,1);
INSERT INTO materials_inventory VALUES(6,1,1);
INSERT INTO materials_inventory VALUES(7,9,1);
INSERT INTO materials_inventory VALUES(8,0,1);
INSERT INTO materials_inventory VALUES(9,3,1);
INSERT INTO materials_inventory VALUES(10,15,1);
INSERT INTO materials_inventory VALUES(32,20,1);
INSERT INTO materials_inventory VALUES(11,9,1);
INSERT INTO materials_inventory VALUES(12,20,1);
INSERT INTO materials_inventory VALUES(14,7,1);
INSERT INTO materials_inventory VALUES(18,0,1);
INSERT INTO materials_inventory VALUES(4,11,1);
INSERT INTO materials_inventory VALUES(16,2,1);
INSERT INTO materials_inventory VALUES(15,3,1);
INSERT INTO materials_inventory VALUES(22,1,1);
INSERT INTO materials_inventory VALUES(9,2,5);
INSERT INTO materials_inventory VALUES(1,5,5);
INSERT INTO materials_inventory VALUES(6,0,5);
INSERT INTO materials_inventory VALUES(7,12,5);
INSERT INTO materials_inventory VALUES(11,0,5);
INSERT INTO materials_inventory VALUES(2,8,5);
INSERT INTO materials_inventory VALUES(8,1,5);
INSERT INTO materials_inventory VALUES(1,7,2);
INSERT INTO materials_inventory VALUES(6,2,2);
INSERT INTO materials_inventory VALUES(7,0,2);
INSERT INTO materials_inventory VALUES(8,0,2);
INSERT INTO materials_inventory VALUES(9,15,2);
INSERT INTO materials_inventory VALUES(11,0,2);
INSERT INTO materials_inventory VALUES(2,0,2);
INSERT INTO materials_inventory VALUES(18,4,2);
INSERT INTO materials_inventory VALUES(3,2,2);
CREATE TABLE IF NOT EXISTS "creations_inventory" (
    creation_id INTEGER NOT NULL, 'amount' INTEGER NOT NULL DEFAULT 0,
    player_id INTEGER NOT NULL DEFAULT 1,
    FOREIGN KEY(creation_id) REFERENCES creations(id),
    FOREIGN KEY(player_id) REFERENCES stats(player_id)
);
INSERT INTO creations_inventory VALUES(1,17,1);
INSERT INTO creations_inventory VALUES(2,26,1);
INSERT INTO creations_inventory VALUES(3,13,1);
INSERT INTO creations_inventory VALUES(4,39,1);
INSERT INTO creations_inventory VALUES(5,15,1);
INSERT INTO creations_inventory VALUES(6,11,1);
INSERT INTO creations_inventory VALUES(7,12,1);
INSERT INTO creations_inventory VALUES(5,10,5);
INSERT INTO creations_inventory VALUES(2,27,5);
INSERT INTO creations_inventory VALUES(3,14,5);
INSERT INTO creations_inventory VALUES(4,35,5);
INSERT INTO creations_inventory VALUES(1,16,5);
INSERT INTO creations_inventory VALUES(2,0,2);
INSERT INTO creations_inventory VALUES(5,1,2);
INSERT INTO creations_inventory VALUES(3,0,2);
INSERT INTO creations_inventory VALUES(4,1,2);
INSERT INTO creations_inventory VALUES(1,0,2);
INSERT INTO creations_inventory VALUES(7,2,2);
INSERT INTO creations_inventory VALUES(6,0,2);
CREATE TABLE IF NOT EXISTS "stats" ('player_id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL DEFAULT 1 , 'gold' INTEGER NOT NULL DEFAULT 200 , 'level' INTEGER NOT NULL DEFAULT 1, 'exp' INTEGER NOT NULL DEFAULT 0, 'next_level' INTEGER DEFAULT 100,'energy' INTEGER NOT NULL DEFAULT 10,'max_energy' INTEGER NOT NULL DEFAULT 10);
INSERT INTO stats VALUES(1,458,4,14,400,4,25);
INSERT INTO stats VALUES(2,331,3,0,300,15,20);
INSERT INTO stats VALUES(3,280,1,0,100,10,10);
INSERT INTO stats VALUES(4,280,1,0,100,10,10);
INSERT INTO stats VALUES(5,10,1,63,100,17,10);
INSERT INTO stats VALUES(6,200,1,0,100,10,10);
CREATE TABLE IF NOT EXISTS "recipes" (
    creation_id INTEGER NOT NULL
,
    m1_id INTEGER NOT NULL,
    m1_amt INTEGER NOT NULL,
    m2_id INTEGER, m2_amt INTEGER,
    m3_id INTEGER, m3_amt INTEGER, 'level' INTEGER NOT NULL DEFAULT 1, 'exp' INTEGER NOT NULL DEFAULT 0, 'energy' INTEGER NOT NULL DEFAULT 0);
INSERT INTO recipes VALUES(1,1,2,2,3,NULL,NULL,1,3,1);
INSERT INTO recipes VALUES(2,7,2,8,1,NULL,NULL,1,4,2);
INSERT INTO recipes VALUES(3,8,2,9,1,NULL,NULL,1,3,1);
INSERT INTO recipes VALUES(4,1,1,11,1,NULL,NULL,1,2,1);
INSERT INTO recipes VALUES(5,6,2,'','',NULL,NULL,1,2,1);
INSERT INTO recipes VALUES(6,18,2,11,1,6,1,2,5,2);
INSERT INTO recipes VALUES(7,6,2,3,1,7,1,2,5,2);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('materials',33);
INSERT INTO sqlite_sequence VALUES('creations',7);
INSERT INTO sqlite_sequence VALUES('food',4);
INSERT INTO sqlite_sequence VALUES('lodging',4);
INSERT INTO sqlite_sequence VALUES('levels',5);
INSERT INTO sqlite_sequence VALUES('users',6);
INSERT INTO sqlite_sequence VALUES('stats',6);
COMMIT;
