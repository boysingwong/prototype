DROP TABLE scin_db.pub_cell_line;
CREATE TABLE scin_db.pub_cell_line
(
  id          int(11)  NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name   varchar(100)
);


DROP TABLE scin_db.pub_cell_line_alternative;
CREATE TABLE scin_db.pub_cell_line_alternative
(
  id          int(11)  NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cellline_id int(11),
  name        varchar(100)
);


use scin_db;
truncate table scin_db.pub_cell_line_alternative;
truncate table scin_db.pub_cell_line;
insert into pub_cell_line_alternative (cellline_id, name) values (1, '13C4');					
insert into pub_cell_line_alternative (cellline_id, name) values (2, '143-B');	insert into pub_cell_line_alternative (cellline_id, name) values (2, '143B');	insert into pub_cell_line_alternative (cellline_id, name) values (2, '143');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (4, 'BD4');	insert into pub_cell_line_alternative (cellline_id, name) values (4, 'BD-4');	insert into pub_cell_line_alternative (cellline_id, name) values (4, 'K99');	insert into pub_cell_line_alternative (cellline_id, name) values (4, 'K-99');		
insert into pub_cell_line_alternative (cellline_id, name) values (5, 'CB1');	insert into pub_cell_line_alternative (cellline_id, name) values (5, 'CB-1');				
insert into pub_cell_line_alternative (cellline_id, name) values (6, '293');					
insert into pub_cell_line_alternative (cellline_id, name) values (7, '2E10');	insert into pub_cell_line_alternative (cellline_id, name) values (7, '2E10-H2');	insert into pub_cell_line_alternative (cellline_id, name) values (7, '2E10H2');			
insert into pub_cell_line_alternative (cellline_id, name) values (8, '2HX-2');	insert into pub_cell_line_alternative (cellline_id, name) values (8, '2HX2');	insert into pub_cell_line_alternative (cellline_id, name) values (8, '2HX');			
insert into pub_cell_line_alternative (cellline_id, name) values (9, 'D11-H11');	insert into pub_cell_line_alternative (cellline_id, name) values (9, 'D11H11');	insert into pub_cell_line_alternative (cellline_id, name) values (9, 'D11');	insert into pub_cell_line_alternative (cellline_id, name) values (9, 'H11');	insert into pub_cell_line_alternative (cellline_id, name) values (9, '3C9');	insert into pub_cell_line_alternative (cellline_id, name) values (9, '3-C9');
insert into pub_cell_line_alternative (cellline_id, name) values (10, '3E1');	insert into pub_cell_line_alternative (cellline_id, name) values (10, '3-E-1');				
insert into pub_cell_line_alternative (cellline_id, name) values (11, '3458S');	insert into pub_cell_line_alternative (cellline_id, name) values (11, '3458-S');	insert into pub_cell_line_alternative (cellline_id, name) values (11, '34-5-8-S');	insert into pub_cell_line_alternative (cellline_id, name) values (11, '34-5-8');	insert into pub_cell_line_alternative (cellline_id, name) values (11, '3458');	
insert into pub_cell_line_alternative (cellline_id, name) values (12, '3AsubE');	insert into pub_cell_line_alternative (cellline_id, name) values (12, '3A-subE');	insert into pub_cell_line_alternative (cellline_id, name) values (12, '3A-sub-E');			
insert into pub_cell_line_alternative (cellline_id, name) values (13, '3T3');					
					
					
					
					
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (21, '3T6');					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (24, 'RM-4');	insert into pub_cell_line_alternative (cellline_id, name) values (24, 'RM4');				
insert into pub_cell_line_alternative (cellline_id, name) values (25, 'TG1');	insert into pub_cell_line_alternative (cellline_id, name) values (25, 'TG-1');				
insert into pub_cell_line_alternative (cellline_id, name) values (26, '4H1A7');	insert into pub_cell_line_alternative (cellline_id, name) values (26, '4H1-A7');	insert into pub_cell_line_alternative (cellline_id, name) values (26, '4H1');			
insert into pub_cell_line_alternative (cellline_id, name) values (27, '5C9');	insert into pub_cell_line_alternative (cellline_id, name) values (27, '5-C-9');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (29, '623');	insert into pub_cell_line_alternative (cellline_id, name) values (29, '6-23');				
insert into pub_cell_line_alternative (cellline_id, name) values (30, '7D4');	insert into pub_cell_line_alternative (cellline_id, name) values (30, '7-D4');				
insert into pub_cell_line_alternative (cellline_id, name) values (31, '7TD1');	insert into pub_cell_line_alternative (cellline_id, name) values (31, '7-TD-1');	insert into pub_cell_line_alternative (cellline_id, name) values (31, 'TD-1');	insert into pub_cell_line_alternative (cellline_id, name) values (31, 'TD1');		
insert into pub_cell_line_alternative (cellline_id, name) values (32, '7OZ');	insert into pub_cell_line_alternative (cellline_id, name) values (32, '7OZ3');	insert into pub_cell_line_alternative (cellline_id, name) values (32, '7OZ-3');	insert into pub_cell_line_alternative (cellline_id, name) values (32, '7-OZ-3');		
insert into pub_cell_line_alternative (cellline_id, name) values (33, '72A1');	insert into pub_cell_line_alternative (cellline_id, name) values (33, '72-A1');	insert into pub_cell_line_alternative (cellline_id, name) values (33, '72-A-1');			
					
					
					
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (40, '7C2');	insert into pub_cell_line_alternative (cellline_id, name) values (40, '7C2C5');	insert into pub_cell_line_alternative (cellline_id, name) values (40, '7C2C5C12');	insert into pub_cell_line_alternative (cellline_id, name) values (40, '7C2-C5-C12');		
insert into pub_cell_line_alternative (cellline_id, name) values (41, '9BG5');	insert into pub_cell_line_alternative (cellline_id, name) values (41, '9-BG5');	insert into pub_cell_line_alternative (cellline_id, name) values (41, '9-BG-5');	insert into pub_cell_line_alternative (cellline_id, name) values (41, '9BG');		
insert into pub_cell_line_alternative (cellline_id, name) values (42, '9-4-3');	insert into pub_cell_line_alternative (cellline_id, name) values (42, '943');				
insert into pub_cell_line_alternative (cellline_id, name) values (43, 'A-172');	insert into pub_cell_line_alternative (cellline_id, name) values (43, 'A172');				
insert into pub_cell_line_alternative (cellline_id, name) values (44, 'A-375');	insert into pub_cell_line_alternative (cellline_id, name) values (44, 'A375');				
insert into pub_cell_line_alternative (cellline_id, name) values (45, 'A-72');	insert into pub_cell_line_alternative (cellline_id, name) values (45, 'A72');				
insert into pub_cell_line_alternative (cellline_id, name) values (46, 'A10');	insert into pub_cell_line_alternative (cellline_id, name) values (46, 'A-10');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (48, 'A-204');	insert into pub_cell_line_alternative (cellline_id, name) values (48, 'A204');				
insert into pub_cell_line_alternative (cellline_id, name) values (49, 'A-427');	insert into pub_cell_line_alternative (cellline_id, name) values (49, 'A427');				
insert into pub_cell_line_alternative (cellline_id, name) values (50, 'A-431');	insert into pub_cell_line_alternative (cellline_id, name) values (50, 'A431');				
insert into pub_cell_line_alternative (cellline_id, name) values (51, 'A-498');	insert into pub_cell_line_alternative (cellline_id, name) values (51, 'A498');				
insert into pub_cell_line_alternative (cellline_id, name) values (52, 'A-549');	insert into pub_cell_line_alternative (cellline_id, name) values (52, 'A549');				
insert into pub_cell_line_alternative (cellline_id, name) values (53, 'A-704');	insert into pub_cell_line_alternative (cellline_id, name) values (53, 'A704');				
					
					
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (59, 'A6');	insert into pub_cell_line_alternative (cellline_id, name) values (59, 'A-6');				
insert into pub_cell_line_alternative (cellline_id, name) values (60, 'A673');	insert into pub_cell_line_alternative (cellline_id, name) values (60, 'A-673');				
insert into pub_cell_line_alternative (cellline_id, name) values (61, 'A7r5');	insert into pub_cell_line_alternative (cellline_id, name) values (61, 'A-7r5');				
insert into pub_cell_line_alternative (cellline_id, name) values (62, 'A9');	insert into pub_cell_line_alternative (cellline_id, name) values (62, 'A-9');				
insert into pub_cell_line_alternative (cellline_id, name) values (63, 'ACHN');					
insert into pub_cell_line_alternative (cellline_id, name) values (64, 'AE1');	insert into pub_cell_line_alternative (cellline_id, name) values (64, 'AE-1');	insert into pub_cell_line_alternative (cellline_id, name) values (64, 'AE');			
insert into pub_cell_line_alternative (cellline_id, name) values (65, 'AE2');	insert into pub_cell_line_alternative (cellline_id, name) values (65, 'AE-2');	insert into pub_cell_line_alternative (cellline_id, name) values (65, 'AE');			
insert into pub_cell_line_alternative (cellline_id, name) values (66, 'Aedes');	insert into pub_cell_line_alternative (cellline_id, name) values (66, 'aegypti');				
insert into pub_cell_line_alternative (cellline_id, name) values (67, 'Aedes');	insert into pub_cell_line_alternative (cellline_id, name) values (67, 'albopictus');				
insert into pub_cell_line_alternative (cellline_id, name) values (68, 'AGS');					
insert into pub_cell_line_alternative (cellline_id, name) values (69, 'AHL-1');	insert into pub_cell_line_alternative (cellline_id, name) values (69, 'AHL1');	insert into pub_cell_line_alternative (cellline_id, name) values (69, 'AHL');			
insert into pub_cell_line_alternative (cellline_id, name) values (70, 'AKD');	insert into pub_cell_line_alternative (cellline_id, name) values (70, 'AK-D');				
insert into pub_cell_line_alternative (cellline_id, name) values (71, 'Amdur');	insert into pub_cell_line_alternative (cellline_id, name) values (71, 'amdur');				
insert into pub_cell_line_alternative (cellline_id, name) values (72, 'Antheraea');	insert into pub_cell_line_alternative (cellline_id, name) values (72, 'antheraea');				
insert into pub_cell_line_alternative (cellline_id, name) values (73, 'AR42J');	insert into pub_cell_line_alternative (cellline_id, name) values (73, 'AR-42J');	insert into pub_cell_line_alternative (cellline_id, name) values (73, 'AR-42-J');			
insert into pub_cell_line_alternative (cellline_id, name) values (74, 'ARH77');	insert into pub_cell_line_alternative (cellline_id, name) values (74, 'ARH-77');				
insert into pub_cell_line_alternative (cellline_id, name) values (75, 'AsPC-1');	insert into pub_cell_line_alternative (cellline_id, name) values (75, 'AsPC1');				
insert into pub_cell_line_alternative (cellline_id, name) values (76, 'AtT-20');	insert into pub_cell_line_alternative (cellline_id, name) values (76, 'AtT20');	insert into pub_cell_line_alternative (cellline_id, name) values (76, 'D16vF2');	insert into pub_cell_line_alternative (cellline_id, name) values (76, 'D16v-F2');		
					
insert into pub_cell_line_alternative (cellline_id, name) values (78, 'AV3');	insert into pub_cell_line_alternative (cellline_id, name) values (78, 'AV-3');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (80, 'B95.8');	insert into pub_cell_line_alternative (cellline_id, name) values (80, 'B958');	insert into pub_cell_line_alternative (cellline_id, name) values (80, 'B-958');	insert into pub_cell_line_alternative (cellline_id, name) values (80, 'B-95.8');	insert into pub_cell_line_alternative (cellline_id, name) values (80, 'B-95-8');	
insert into pub_cell_line_alternative (cellline_id, name) values (81, 'BSk');	insert into pub_cell_line_alternative (cellline_id, name) values (81, 'CSk');	insert into pub_cell_line_alternative (cellline_id, name) values (81, 'B.Sk');	insert into pub_cell_line_alternative (cellline_id, name) values (81, 'C.Sk');	insert into pub_cell_line_alternative (cellline_id, name) values (81, 'B-Sk');	insert into pub_cell_line_alternative (cellline_id, name) values (81, 'C-Sk');
insert into pub_cell_line_alternative (cellline_id, name) values (82, 'B14');	insert into pub_cell_line_alternative (cellline_id, name) values (82, 'B14-150');	insert into pub_cell_line_alternative (cellline_id, name) values (82, 'B14150');	insert into pub_cell_line_alternative (cellline_id, name) values (82, 'B-14-150');		
insert into pub_cell_line_alternative (cellline_id, name) values (83, 'B14FAF28G3');	insert into pub_cell_line_alternative (cellline_id, name) values (83, 'B14FAF28-G3');				
insert into pub_cell_line_alternative (cellline_id, name) values (84, 'B16F0');	insert into pub_cell_line_alternative (cellline_id, name) values (84, 'B16-F0');				
insert into pub_cell_line_alternative (cellline_id, name) values (85, 'B16F1');	insert into pub_cell_line_alternative (cellline_id, name) values (85, 'B16-F1');				
insert into pub_cell_line_alternative (cellline_id, name) values (86, 'B2-1');	insert into pub_cell_line_alternative (cellline_id, name) values (86, 'B21');	insert into pub_cell_line_alternative (cellline_id, name) values (86, 'B2');			
insert into pub_cell_line_alternative (cellline_id, name) values (87, 'B2.Sp');	insert into pub_cell_line_alternative (cellline_id, name) values (87, 'B2Sp');	insert into pub_cell_line_alternative (cellline_id, name) values (87, 'B2-Sp');	insert into pub_cell_line_alternative (cellline_id, name) values (87, 'B2');		
insert into pub_cell_line_alternative (cellline_id, name) values (88, 'B69');	insert into pub_cell_line_alternative (cellline_id, name) values (88, 'B-69');				
insert into pub_cell_line_alternative (cellline_id, name) values (89, 'B95-8');	insert into pub_cell_line_alternative (cellline_id, name) values (89, 'B958');	insert into pub_cell_line_alternative (cellline_id, name) values (89, 'B-95-8');	insert into pub_cell_line_alternative (cellline_id, name) values (89, 'B95');		
insert into pub_cell_line_alternative (cellline_id, name) values (90, 'B95.8');	insert into pub_cell_line_alternative (cellline_id, name) values (90, 'B95');				
insert into pub_cell_line_alternative (cellline_id, name) values (91, 'BALB');					
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (95, 'BB');					
insert into pub_cell_line_alternative (cellline_id, name) values (96, 'BC3H1');	insert into pub_cell_line_alternative (cellline_id, name) values (96, 'B-C3-H1');	insert into pub_cell_line_alternative (cellline_id, name) values (96, 'BC3-H1');	insert into pub_cell_line_alternative (cellline_id, name) values (96, 'BC3');		
insert into pub_cell_line_alternative (cellline_id, name) values (97, 'BCE');					
insert into pub_cell_line_alternative (cellline_id, name) values (98, 'BCL1');					
insert into pub_cell_line_alternative (cellline_id, name) values (99, 'BeWo');	insert into pub_cell_line_alternative (cellline_id, name) values (99, 'Be-Wo');				
insert into pub_cell_line_alternative (cellline_id, name) values (100, 'BF2');	insert into pub_cell_line_alternative (cellline_id, name) values (100, 'BF-2');	insert into pub_cell_line_alternative (cellline_id, name) values (100, 'BF');			
insert into pub_cell_line_alternative (cellline_id, name) values (101, 'BHK');					
					
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (106, 'BL3');	insert into pub_cell_line_alternative (cellline_id, name) values (106, 'BL-3');	insert into pub_cell_line_alternative (cellline_id, name) values (106, 'BL');			
insert into pub_cell_line_alternative (cellline_id, name) values (107, 'BLO11');	insert into pub_cell_line_alternative (cellline_id, name) values (107, 'BLO-11');				
insert into pub_cell_line_alternative (cellline_id, name) values (108, 'BNL');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (110, 'BRL');	insert into pub_cell_line_alternative (cellline_id, name) values (110, 'BRL3A');	insert into pub_cell_line_alternative (cellline_id, name) values (110, 'BRL-3A');			
insert into pub_cell_line_alternative (cellline_id, name) values (111, 'BSC1');	insert into pub_cell_line_alternative (cellline_id, name) values (111, 'B-SC1');	insert into pub_cell_line_alternative (cellline_id, name) values (111, 'B-SC-1');	insert into pub_cell_line_alternative (cellline_id, name) values (111, 'BSC-1');	insert into pub_cell_line_alternative (cellline_id, name) values (111, 'BSC');	insert into pub_cell_line_alternative (cellline_id, name) values (111, 'BS');
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (114, 'BT');					
insert into pub_cell_line_alternative (cellline_id, name) values (115, 'BT-20');	insert into pub_cell_line_alternative (cellline_id, name) values (115, 'BT20');	insert into pub_cell_line_alternative (cellline_id, name) values (115, 'BT');			
insert into pub_cell_line_alternative (cellline_id, name) values (116, 'BT-474');	insert into pub_cell_line_alternative (cellline_id, name) values (116, 'BT474');	insert into pub_cell_line_alternative (cellline_id, name) values (116, 'BT');			
insert into pub_cell_line_alternative (cellline_id, name) values (117, 'Bu');					
insert into pub_cell_line_alternative (cellline_id, name) values (118, 'BUD-8');	insert into pub_cell_line_alternative (cellline_id, name) values (118, 'BUD8');	insert into pub_cell_line_alternative (cellline_id, name) values (118, 'BUD');			
insert into pub_cell_line_alternative (cellline_id, name) values (119, 'BW5147');	insert into pub_cell_line_alternative (cellline_id, name) values (119, 'BW-5147');	insert into pub_cell_line_alternative (cellline_id, name) values (119, 'BW');			
insert into pub_cell_line_alternative (cellline_id, name) values (120, 'BXPC');	insert into pub_cell_line_alternative (cellline_id, name) values (120, 'BXPC3');	insert into pub_cell_line_alternative (cellline_id, name) values (120, 'BXPC-3');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (122, 'C1271');	insert into pub_cell_line_alternative (cellline_id, name) values (122, '1271');	insert into pub_cell_line_alternative (cellline_id, name) values (122, 'C-1271');	insert into pub_cell_line_alternative (cellline_id, name) values (122, 'C-127-1');	insert into pub_cell_line_alternative (cellline_id, name) values (122, '127-1');	
insert into pub_cell_line_alternative (cellline_id, name) values (123, 'C4II');	insert into pub_cell_line_alternative (cellline_id, name) values (123, 'C-4-II');	insert into pub_cell_line_alternative (cellline_id, name) values (123, 'C4');			
insert into pub_cell_line_alternative (cellline_id, name) values (124, 'C4I');	insert into pub_cell_line_alternative (cellline_id, name) values (124, 'C-4-I');	insert into pub_cell_line_alternative (cellline_id, name) values (124, 'C4');			
insert into pub_cell_line_alternative (cellline_id, name) values (125, 'C127I');	insert into pub_cell_line_alternative (cellline_id, name) values (125, 'C-127I');	insert into pub_cell_line_alternative (cellline_id, name) values (125, 'C127-1');	insert into pub_cell_line_alternative (cellline_id, name) values (125, 'C-127-1');	insert into pub_cell_line_alternative (cellline_id, name) values (125, '127I');	
insert into pub_cell_line_alternative (cellline_id, name) values (126, 'C211');	insert into pub_cell_line_alternative (cellline_id, name) values (126, 'C-211');				
insert into pub_cell_line_alternative (cellline_id, name) values (127, 'C2C12');	insert into pub_cell_line_alternative (cellline_id, name) values (127, 'C2-C12');	insert into pub_cell_line_alternative (cellline_id, name) values (127, 'C-12');	insert into pub_cell_line_alternative (cellline_id, name) values (127, 'C12');		
insert into pub_cell_line_alternative (cellline_id, name) values (128, 'C32');	insert into pub_cell_line_alternative (cellline_id, name) values (128, 'C-32');				
insert into pub_cell_line_alternative (cellline_id, name) values (129, 'C3H');	insert into pub_cell_line_alternative (cellline_id, name) values (129, '10T1');	insert into pub_cell_line_alternative (cellline_id, name) values (129, '10T2');			
insert into pub_cell_line_alternative (cellline_id, name) values (130, 'C3H');	insert into pub_cell_line_alternative (cellline_id, name) values (130, 'MCA');				
insert into pub_cell_line_alternative (cellline_id, name) values (131, 'C6');					
insert into pub_cell_line_alternative (cellline_id, name) values (132, 'Ca');	insert into pub_cell_line_alternative (cellline_id, name) values (132, 'Ca-Ski');	insert into pub_cell_line_alternative (cellline_id, name) values (132, 'CaSki');	insert into pub_cell_line_alternative (cellline_id, name) values (132, 'Ski');		
insert into pub_cell_line_alternative (cellline_id, name) values (133, 'CA-46');	insert into pub_cell_line_alternative (cellline_id, name) values (133, 'CA46');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (135, 'Caco2');	insert into pub_cell_line_alternative (cellline_id, name) values (135, 'Caco-2');				
					
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (140, 'CAKI2');	insert into pub_cell_line_alternative (cellline_id, name) values (140, 'CAKI');	insert into pub_cell_line_alternative (cellline_id, name) values (140, 'CAKI-2');			
insert into pub_cell_line_alternative (cellline_id, name) values (141, 'CAKI1');	insert into pub_cell_line_alternative (cellline_id, name) values (141, 'CAKI');	insert into pub_cell_line_alternative (cellline_id, name) values (141, 'CAKI-1');			
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (145, 'CALU1');	insert into pub_cell_line_alternative (cellline_id, name) values (145, 'CALU');	insert into pub_cell_line_alternative (cellline_id, name) values (145, 'CALU-1');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (147, 'CALU3');	insert into pub_cell_line_alternative (cellline_id, name) values (147, 'CALU');	insert into pub_cell_line_alternative (cellline_id, name) values (147, 'CALU-3');			
insert into pub_cell_line_alternative (cellline_id, name) values (148, 'CALU6');	insert into pub_cell_line_alternative (cellline_id, name) values (148, 'CALU');	insert into pub_cell_line_alternative (cellline_id, name) values (148, 'CALU-6');			
insert into pub_cell_line_alternative (cellline_id, name) values (149, 'CAPAN1');	insert into pub_cell_line_alternative (cellline_id, name) values (149, 'CAPAN');	insert into pub_cell_line_alternative (cellline_id, name) values (149, 'CAPAN-1');			
insert into pub_cell_line_alternative (cellline_id, name) values (150, 'CAPAN2');	insert into pub_cell_line_alternative (cellline_id, name) values (150, 'CAPAN');	insert into pub_cell_line_alternative (cellline_id, name) values (150, 'CAPAN-2');			
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (154, 'CAR');					
insert into pub_cell_line_alternative (cellline_id, name) values (155, 'CCD');	insert into pub_cell_line_alternative (cellline_id, name) values (155, '13Lu');	insert into pub_cell_line_alternative (cellline_id, name) values (155, 'CCD-13Lu');			
insert into pub_cell_line_alternative (cellline_id, name) values (156, 'CCD');	insert into pub_cell_line_alternative (cellline_id, name) values (156, '16Lu');	insert into pub_cell_line_alternative (cellline_id, name) values (156, 'CCD-16Lu');			
insert into pub_cell_line_alternative (cellline_id, name) values (157, 'CCD');	insert into pub_cell_line_alternative (cellline_id, name) values (157, '18Lu');	insert into pub_cell_line_alternative (cellline_id, name) values (157, 'CCD-18Lu');			
insert into pub_cell_line_alternative (cellline_id, name) values (158, 'CCD');	insert into pub_cell_line_alternative (cellline_id, name) values (158, '19Lu');	insert into pub_cell_line_alternative (cellline_id, name) values (158, 'CCD-19Lu');			
insert into pub_cell_line_alternative (cellline_id, name) values (159, 'CCD');	insert into pub_cell_line_alternative (cellline_id, name) values (159, '25Lu');	insert into pub_cell_line_alternative (cellline_id, name) values (159, 'CCD-25Lu');			
insert into pub_cell_line_alternative (cellline_id, name) values (160, 'CCD');	insert into pub_cell_line_alternative (cellline_id, name) values (160, '8Lu');	insert into pub_cell_line_alternative (cellline_id, name) values (160, 'CCD-8Lu');			
insert into pub_cell_line_alternative (cellline_id, name) values (161, 'CCD');	insert into pub_cell_line_alternative (cellline_id, name) values (161, '11Lu');	insert into pub_cell_line_alternative (cellline_id, name) values (161, 'CCD-11Lu');			
insert into pub_cell_line_alternative (cellline_id, name) values (162, 'CCD');	insert into pub_cell_line_alternative (cellline_id, name) values (162, '29Lu');	insert into pub_cell_line_alternative (cellline_id, name) values (162, 'CCD-29Lu');			
insert into pub_cell_line_alternative (cellline_id, name) values (163, 'CCD');	insert into pub_cell_line_alternative (cellline_id, name) values (163, '32Lu');	insert into pub_cell_line_alternative (cellline_id, name) values (163, 'CCD-32Lu');			
insert into pub_cell_line_alternative (cellline_id, name) values (164, 'CCD');	insert into pub_cell_line_alternative (cellline_id, name) values (164, '33Lu');	insert into pub_cell_line_alternative (cellline_id, name) values (164, 'CCD-33Lu');			
insert into pub_cell_line_alternative (cellline_id, name) values (165, 'CCD');	insert into pub_cell_line_alternative (cellline_id, name) values (165, '34Lu');	insert into pub_cell_line_alternative (cellline_id, name) values (165, 'CCD-34Lu');			
insert into pub_cell_line_alternative (cellline_id, name) values (166, 'CCD');	insert into pub_cell_line_alternative (cellline_id, name) values (166, '37Lu');	insert into pub_cell_line_alternative (cellline_id, name) values (166, 'CCD-37Lu');			
insert into pub_cell_line_alternative (cellline_id, name) values (167, 'CCD');	insert into pub_cell_line_alternative (cellline_id, name) values (167, '39Lu');	insert into pub_cell_line_alternative (cellline_id, name) values (167, 'CCD-39Lu');			
insert into pub_cell_line_alternative (cellline_id, name) values (168, 'CCF');	insert into pub_cell_line_alternative (cellline_id, name) values (168, 'CCF-STTG1');	insert into pub_cell_line_alternative (cellline_id, name) values (168, 'STTG1');	insert into pub_cell_line_alternative (cellline_id, name) values (168, 'CCFSTTG1');		
insert into pub_cell_line_alternative (cellline_id, name) values (169, 'CCRF');	insert into pub_cell_line_alternative (cellline_id, name) values (169, 'CCRF-180');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (171, 'CCRF');	insert into pub_cell_line_alternative (cellline_id, name) values (171, 'CCRF-CEM');	insert into pub_cell_line_alternative (cellline_id, name) values (171, 'CEM');			
insert into pub_cell_line_alternative (cellline_id, name) values (172, 'CCRF');	insert into pub_cell_line_alternative (cellline_id, name) values (172, 'CCRF-HSB');	insert into pub_cell_line_alternative (cellline_id, name) values (172, 'HSB-2');	insert into pub_cell_line_alternative (cellline_id, name) values (172, 'HSB');		
insert into pub_cell_line_alternative (cellline_id, name) values (173, 'CCRF');	insert into pub_cell_line_alternative (cellline_id, name) values (173, 'CCRF-SB');	insert into pub_cell_line_alternative (cellline_id, name) values (173, 'SB');			
insert into pub_cell_line_alternative (cellline_id, name) values (174, 'CEM');	insert into pub_cell_line_alternative (cellline_id, name) values (174, 'CEM-CM3');	insert into pub_cell_line_alternative (cellline_id, name) values (174, 'CM3');			
insert into pub_cell_line_alternative (cellline_id, name) values (175, 'CESS');					
insert into pub_cell_line_alternative (cellline_id, name) values (176, 'CF2Th');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (178, 'CFPAC');					
insert into pub_cell_line_alternative (cellline_id, name) values (179, 'Chang');					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (182, 'CHH');	insert into pub_cell_line_alternative (cellline_id, name) values (182, 'CHH-1');	insert into pub_cell_line_alternative (cellline_id, name) values (182, 'CHH1');			
insert into pub_cell_line_alternative (cellline_id, name) values (183, 'CHO');	insert into pub_cell_line_alternative (cellline_id, name) values (183, 'CHO-K1');	insert into pub_cell_line_alternative (cellline_id, name) values (183, 'CHOK1');			
insert into pub_cell_line_alternative (cellline_id, name) values (184, 'CHO');	insert into pub_cell_line_alternative (cellline_id, name) values (184, 'DHFR');				
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (187, 'CHP');					
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (191, 'CHSE');	insert into pub_cell_line_alternative (cellline_id, name) values (191, 'CHSE-214');	insert into pub_cell_line_alternative (cellline_id, name) values (191, '214');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (193, 'Citrullinemia');					
insert into pub_cell_line_alternative (cellline_id, name) values (194, 'CLS1');	insert into pub_cell_line_alternative (cellline_id, name) values (194, 'CL-S1');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (196, 'Chang');	insert into pub_cell_line_alternative (cellline_id, name) values (196, 'WKD');				
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (200, 'CMT93');	insert into pub_cell_line_alternative (cellline_id, name) values (200, 'CMT');	insert into pub_cell_line_alternative (cellline_id, name) values (200, 'CMT-93');			
insert into pub_cell_line_alternative (cellline_id, name) values (201, 'CNC');	insert into pub_cell_line_alternative (cellline_id, name) values (201, 'CNC1271');	insert into pub_cell_line_alternative (cellline_id, name) values (201, '1271');			
insert into pub_cell_line_alternative (cellline_id, name) values (202, 'COLO');	insert into pub_cell_line_alternative (cellline_id, name) values (202, '201');				
insert into pub_cell_line_alternative (cellline_id, name) values (203, 'COLO');	insert into pub_cell_line_alternative (cellline_id, name) values (203, '205');				
insert into pub_cell_line_alternative (cellline_id, name) values (204, 'COLO');	insert into pub_cell_line_alternative (cellline_id, name) values (204, '320DM');	insert into pub_cell_line_alternative (cellline_id, name) values (204, '320');			
insert into pub_cell_line_alternative (cellline_id, name) values (205, 'COLO');	insert into pub_cell_line_alternative (cellline_id, name) values (205, '320HSR');	insert into pub_cell_line_alternative (cellline_id, name) values (205, '320');			
insert into pub_cell_line_alternative (cellline_id, name) values (206, 'COLO');	insert into pub_cell_line_alternative (cellline_id, name) values (206, '829');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (208, 'COLO');	insert into pub_cell_line_alternative (cellline_id, name) values (208, '818');				
insert into pub_cell_line_alternative (cellline_id, name) values (209, 'CorPer');	insert into pub_cell_line_alternative (cellline_id, name) values (209, 'Cor');	insert into pub_cell_line_alternative (cellline_id, name) values (209, 'Per');			
insert into pub_cell_line_alternative (cellline_id, name) values (210, 'COS');	insert into pub_cell_line_alternative (cellline_id, name) values (210, 'COS1');	insert into pub_cell_line_alternative (cellline_id, name) values (210, 'COS-1');			
insert into pub_cell_line_alternative (cellline_id, name) values (211, 'COS');	insert into pub_cell_line_alternative (cellline_id, name) values (211, 'COS7');	insert into pub_cell_line_alternative (cellline_id, name) values (211, 'COS-7');			
insert into pub_cell_line_alternative (cellline_id, name) values (212, 'CP132');	insert into pub_cell_line_alternative (cellline_id, name) values (212, 'CP-132');	insert into pub_cell_line_alternative (cellline_id, name) values (212, '132');			
insert into pub_cell_line_alternative (cellline_id, name) values (213, 'CPA');					
insert into pub_cell_line_alternative (cellline_id, name) values (214, 'CPA -47');	insert into pub_cell_line_alternative (cellline_id, name) values (214, 'CPA47');	insert into pub_cell_line_alternative (cellline_id, name) values (214, 'CPA');			
insert into pub_cell_line_alternative (cellline_id, name) values (215, 'CPAE');					
insert into pub_cell_line_alternative (cellline_id, name) values (216, 'CRE');	insert into pub_cell_line_alternative (cellline_id, name) values (216, 'CRE BAG2');	insert into pub_cell_line_alternative (cellline_id, name) values (216, 'BAG2');			
insert into pub_cell_line_alternative (cellline_id, name) values (217, 'CRFK');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (219, 'Cri');	insert into pub_cell_line_alternative (cellline_id, name) values (219, 'Chat');				
insert into pub_cell_line_alternative (cellline_id, name) values (220, 'CTLL2');	insert into pub_cell_line_alternative (cellline_id, name) values (220, 'CTLL-2');	insert into pub_cell_line_alternative (cellline_id, name) values (220, 'CTLL');			
insert into pub_cell_line_alternative (cellline_id, name) values (221, 'CV1');	insert into pub_cell_line_alternative (cellline_id, name) values (221, 'CV-1');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (223, 'CVC7');	insert into pub_cell_line_alternative (cellline_id, name) values (223, 'CVC');	insert into pub_cell_line_alternative (cellline_id, name) values (223, 'CVC-7');			
insert into pub_cell_line_alternative (cellline_id, name) values (224, 'D17');					
insert into pub_cell_line_alternative (cellline_id, name) values (225, 'D10');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (227, 'Da');	insert into pub_cell_line_alternative (cellline_id, name) values (227, 'Mo');	insert into pub_cell_line_alternative (cellline_id, name) values (227, 'DaMo');			
insert into pub_cell_line_alternative (cellline_id, name) values (228, 'Daudi');					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (231, 'DB9');	insert into pub_cell_line_alternative (cellline_id, name) values (231, 'G8');				
insert into pub_cell_line_alternative (cellline_id, name) values (232, 'DB1');	insert into pub_cell_line_alternative (cellline_id, name) values (232, 'Tes');				
insert into pub_cell_line_alternative (cellline_id, name) values (233, 'DBS');	insert into pub_cell_line_alternative (cellline_id, name) values (233, 'FCL');	insert into pub_cell_line_alternative (cellline_id, name) values (233, 'FCL2');	insert into pub_cell_line_alternative (cellline_id, name) values (233, 'DBS-FCL');	insert into pub_cell_line_alternative (cellline_id, name) values (233, 'DBS-FCL2');	insert into pub_cell_line_alternative (cellline_id, name) values (233, 'DBS-FCL-2');
insert into pub_cell_line_alternative (cellline_id, name) values (234, 'DBS');	insert into pub_cell_line_alternative (cellline_id, name) values (234, 'FRHL');	insert into pub_cell_line_alternative (cellline_id, name) values (234, 'FRHL2');	insert into pub_cell_line_alternative (cellline_id, name) values (234, 'DBS-FRHL');	insert into pub_cell_line_alternative (cellline_id, name) values (234, 'DBS-FRHL2');	insert into pub_cell_line_alternative (cellline_id, name) values (234, 'DBS-FRHL-2');
insert into pub_cell_line_alternative (cellline_id, name) values (235, 'DBTRG');					
insert into pub_cell_line_alternative (cellline_id, name) values (236, 'DDT1');	insert into pub_cell_line_alternative (cellline_id, name) values (236, 'MF2');	insert into pub_cell_line_alternative (cellline_id, name) values (236, 'DDT1-MF2');			
insert into pub_cell_line_alternative (cellline_id, name) values (237, 'DeDe');	insert into pub_cell_line_alternative (cellline_id, name) values (237, 'De-De');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (239, 'Detroit');					
insert into pub_cell_line_alternative (cellline_id, name) values (240, 'Detroit');					
insert into pub_cell_line_alternative (cellline_id, name) values (241, 'Detroit');					
insert into pub_cell_line_alternative (cellline_id, name) values (242, 'Detroit');					
insert into pub_cell_line_alternative (cellline_id, name) values (243, 'Detroit');					
insert into pub_cell_line_alternative (cellline_id, name) values (244, 'Detroit');					
insert into pub_cell_line_alternative (cellline_id, name) values (245, 'Detroit');					
insert into pub_cell_line_alternative (cellline_id, name) values (246, 'Detroit');					
insert into pub_cell_line_alternative (cellline_id, name) values (247, 'Detroit');					
insert into pub_cell_line_alternative (cellline_id, name) values (248, 'DH82');	insert into pub_cell_line_alternative (cellline_id, name) values (248, 'DH-82');				
insert into pub_cell_line_alternative (cellline_id, name) values (249, 'DK');					
insert into pub_cell_line_alternative (cellline_id, name) values (250, 'DLD1');	insert into pub_cell_line_alternative (cellline_id, name) values (250, 'DLD-1');				
insert into pub_cell_line_alternative (cellline_id, name) values (251, 'DMS');	insert into pub_cell_line_alternative (cellline_id, name) values (251, 'DMS153');	insert into pub_cell_line_alternative (cellline_id, name) values (251, 'DMS-153');			
insert into pub_cell_line_alternative (cellline_id, name) values (252, 'DMS');	insert into pub_cell_line_alternative (cellline_id, name) values (252, 'DMS53');	insert into pub_cell_line_alternative (cellline_id, name) values (252, 'DMS-53');			
insert into pub_cell_line_alternative (cellline_id, name) values (253, 'DMS');	insert into pub_cell_line_alternative (cellline_id, name) values (253, 'DMS79');	insert into pub_cell_line_alternative (cellline_id, name) values (253, 'DMS-79');			
insert into pub_cell_line_alternative (cellline_id, name) values (254, 'DoCl1');	insert into pub_cell_line_alternative (cellline_id, name) values (254, 'Do-Cl1');	insert into pub_cell_line_alternative (cellline_id, name) values (254, 'Cl1');			
insert into pub_cell_line_alternative (cellline_id, name) values (255, 'DON');					
insert into pub_cell_line_alternative (cellline_id, name) values (256, 'DU145');	insert into pub_cell_line_alternative (cellline_id, name) values (256, 'DU-145');				
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (260, 'E-Derm');	insert into pub_cell_line_alternative (cellline_id, name) values (260, 'Derm');	insert into pub_cell_line_alternative (cellline_id, name) values (260, 'Ederm');			
insert into pub_cell_line_alternative (cellline_id, name) values (261, 'EHIV');	insert into pub_cell_line_alternative (cellline_id, name) values (261, 'E-H-IV');				
insert into pub_cell_line_alternative (cellline_id, name) values (262, 'EB1');	insert into pub_cell_line_alternative (cellline_id, name) values (262, 'EB-1');				
insert into pub_cell_line_alternative (cellline_id, name) values (263, 'EBTr');					
insert into pub_cell_line_alternative (cellline_id, name) values (264, 'ECV-304');	insert into pub_cell_line_alternative (cellline_id, name) values (264, 'ECV304');				
insert into pub_cell_line_alternative (cellline_id, name) values (265, 'Ehrlich');	insert into pub_cell_line_alternative (cellline_id, name) values (265, 'Lettre');	insert into pub_cell_line_alternative (cellline_id, name) values (265, 'Ascites');			
insert into pub_cell_line_alternative (cellline_id, name) values (266, 'EIAV');					
insert into pub_cell_line_alternative (cellline_id, name) values (267, 'EJG');					
insert into pub_cell_line_alternative (cellline_id, name) values (268, 'EL4');					
insert into pub_cell_line_alternative (cellline_id, name) values (269, 'EP16');	insert into pub_cell_line_alternative (cellline_id, name) values (269, 'EP-16');				
insert into pub_cell_line_alternative (cellline_id, name) values (270, 'ESK4');	insert into pub_cell_line_alternative (cellline_id, name) values (270, 'ESK-4');				
insert into pub_cell_line_alternative (cellline_id, name) values (271, 'F9');					
insert into pub_cell_line_alternative (cellline_id, name) values (272, 'FB2');	insert into pub_cell_line_alternative (cellline_id, name) values (272, 'FB2-SP');				
insert into pub_cell_line_alternative (cellline_id, name) values (273, 'FBHE');					
insert into pub_cell_line_alternative (cellline_id, name) values (274, 'FC2LU');	insert into pub_cell_line_alternative (cellline_id, name) values (274, 'FC-2-LU');	insert into pub_cell_line_alternative (cellline_id, name) values (274, 'FC');	insert into pub_cell_line_alternative (cellline_id, name) values (274, 'Lu');		
insert into pub_cell_line_alternative (cellline_id, name) values (275, 'FC3TG');	insert into pub_cell_line_alternative (cellline_id, name) values (275, 'FC-3-TG');	insert into pub_cell_line_alternative (cellline_id, name) values (275, 'FC');	insert into pub_cell_line_alternative (cellline_id, name) values (275, 'TG');		
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (278, 'FELV');	insert into pub_cell_line_alternative (cellline_id, name) values (278, '3281');				
insert into pub_cell_line_alternative (cellline_id, name) values (279, 'fer');	insert into pub_cell_line_alternative (cellline_id, name) values (279, 'ray');	insert into pub_cell_line_alternative (cellline_id, name) values (279, 'fer-ray');			
insert into pub_cell_line_alternative (cellline_id, name) values (280, 'FHM');					
insert into pub_cell_line_alternative (cellline_id, name) values (281, 'FL');					
insert into pub_cell_line_alternative (cellline_id, name) values (282, 'folu');					
insert into pub_cell_line_alternative (cellline_id, name) values (283, 'FR');					
insert into pub_cell_line_alternative (cellline_id, name) values (284, 'FRHK');	insert into pub_cell_line_alternative (cellline_id, name) values (284, 'FRHK-4');	insert into pub_cell_line_alternative (cellline_id, name) values (284, 'FRHK4');			
insert into pub_cell_line_alternative (cellline_id, name) values (285, 'FRTL');	insert into pub_cell_line_alternative (cellline_id, name) values (285, 'FRTL5');	insert into pub_cell_line_alternative (cellline_id, name) values (285, 'FRTL-5');			
insert into pub_cell_line_alternative (cellline_id, name) values (286, 'FT');					
insert into pub_cell_line_alternative (cellline_id, name) values (287, 'G292');	insert into pub_cell_line_alternative (cellline_id, name) values (287, 'G-292');	insert into pub_cell_line_alternative (cellline_id, name) values (287, '292');			
insert into pub_cell_line_alternative (cellline_id, name) values (288, 'G361');	insert into pub_cell_line_alternative (cellline_id, name) values (288, 'G-361');	insert into pub_cell_line_alternative (cellline_id, name) values (288, '361');			
insert into pub_cell_line_alternative (cellline_id, name) values (289, 'G401');	insert into pub_cell_line_alternative (cellline_id, name) values (289, 'G-401');	insert into pub_cell_line_alternative (cellline_id, name) values (289, '401');			
insert into pub_cell_line_alternative (cellline_id, name) values (290, 'G402');	insert into pub_cell_line_alternative (cellline_id, name) values (290, 'G-402');	insert into pub_cell_line_alternative (cellline_id, name) values (290, '402');			
insert into pub_cell_line_alternative (cellline_id, name) values (291, 'G-7');	insert into pub_cell_line_alternative (cellline_id, name) values (291, 'G7');				
insert into pub_cell_line_alternative (cellline_id, name) values (292, 'G-8');	insert into pub_cell_line_alternative (cellline_id, name) values (292, 'G8');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (294, 'GCT');					
insert into pub_cell_line_alternative (cellline_id, name) values (295, 'GeLu');					
insert into pub_cell_line_alternative (cellline_id, name) values (296, 'GH1');	insert into pub_cell_line_alternative (cellline_id, name) values (296, 'GH');				
insert into pub_cell_line_alternative (cellline_id, name) values (297, 'GH3');	insert into pub_cell_line_alternative (cellline_id, name) values (297, 'GH');				
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (300, 'GIRARDI');					
insert into pub_cell_line_alternative (cellline_id, name) values (301, 'GK1-5');	insert into pub_cell_line_alternative (cellline_id, name) values (301, 'GK15');	insert into pub_cell_line_alternative (cellline_id, name) values (301, 'GK-15');			
insert into pub_cell_line_alternative (cellline_id, name) values (302, 'GL1');	insert into pub_cell_line_alternative (cellline_id, name) values (302, 'GL-1');	insert into pub_cell_line_alternative (cellline_id, name) values (302, 'GL');			
insert into pub_cell_line_alternative (cellline_id, name) values (303, 'Grunt');	insert into pub_cell_line_alternative (cellline_id, name) values (303, 'Fin');				
insert into pub_cell_line_alternative (cellline_id, name) values (304, 'GS109');	insert into pub_cell_line_alternative (cellline_id, name) values (304, 'GS');	insert into pub_cell_line_alternative (cellline_id, name) values (304, '109');			
insert into pub_cell_line_alternative (cellline_id, name) values (305, 'GS109');	insert into pub_cell_line_alternative (cellline_id, name) values (305, 'GS');	insert into pub_cell_line_alternative (cellline_id, name) values (305, '109');			
insert into pub_cell_line_alternative (cellline_id, name) values (306, 'GS109');	insert into pub_cell_line_alternative (cellline_id, name) values (306, 'GS');	insert into pub_cell_line_alternative (cellline_id, name) values (306, '109');			
insert into pub_cell_line_alternative (cellline_id, name) values (307, 'H16');	insert into pub_cell_line_alternative (cellline_id, name) values (307, 'L10');	insert into pub_cell_line_alternative (cellline_id, name) values (307, '4R5');			
insert into pub_cell_line_alternative (cellline_id, name) values (308, 'H9');					
insert into pub_cell_line_alternative (cellline_id, name) values (309, 'H4IIE');	insert into pub_cell_line_alternative (cellline_id, name) values (309, 'H4');	insert into pub_cell_line_alternative (cellline_id, name) values (309, 'IIE');	insert into pub_cell_line_alternative (cellline_id, name) values (309, 'H4-IIE');		
insert into pub_cell_line_alternative (cellline_id, name) values (310, 'H2-35');	insert into pub_cell_line_alternative (cellline_id, name) values (310, 'H235');				
insert into pub_cell_line_alternative (cellline_id, name) values (311, 'H33HJ');	insert into pub_cell_line_alternative (cellline_id, name) values (311, 'JA1');				
insert into pub_cell_line_alternative (cellline_id, name) values (312, 'H4');					
insert into pub_cell_line_alternative (cellline_id, name) values (313, 'H4');	insert into pub_cell_line_alternative (cellline_id, name) values (313, 'C3');				
insert into pub_cell_line_alternative (cellline_id, name) values (314, 'H460');	insert into pub_cell_line_alternative (cellline_id, name) values (314, '460');				
insert into pub_cell_line_alternative (cellline_id, name) values (315, 'H4S');					
insert into pub_cell_line_alternative (cellline_id, name) values (316, 'H4TG');					
insert into pub_cell_line_alternative (cellline_id, name) values (317, 'H69');					
insert into pub_cell_line_alternative (cellline_id, name) values (318, 'H9');					
insert into pub_cell_line_alternative (cellline_id, name) values (319, 'H9C2');	insert into pub_cell_line_alternative (cellline_id, name) values (319, 'H9-C2');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (321, 'HAK');					
insert into pub_cell_line_alternative (cellline_id, name) values (322, 'HBL');	insert into pub_cell_line_alternative (cellline_id, name) values (322, 'HBL-100');				
insert into pub_cell_line_alternative (cellline_id, name) values (323, 'HCT116');	insert into pub_cell_line_alternative (cellline_id, name) values (323, 'HCT');	insert into pub_cell_line_alternative (cellline_id, name) values (323, 'HCT-116');			
insert into pub_cell_line_alternative (cellline_id, name) values (324, 'HCT');	insert into pub_cell_line_alternative (cellline_id, name) values (324, 'HCT15');	insert into pub_cell_line_alternative (cellline_id, name) values (324, 'HCT-15');			
insert into pub_cell_line_alternative (cellline_id, name) values (325, 'HCT');	insert into pub_cell_line_alternative (cellline_id, name) values (325, 'HCT8');	insert into pub_cell_line_alternative (cellline_id, name) values (325, 'HCT-8');			
insert into pub_cell_line_alternative (cellline_id, name) values (326, 'HEC');	insert into pub_cell_line_alternative (cellline_id, name) values (326, 'HEC-1B');				
insert into pub_cell_line_alternative (cellline_id, name) values (327, 'HEL299');	insert into pub_cell_line_alternative (cellline_id, name) values (327, 'HEL');	insert into pub_cell_line_alternative (cellline_id, name) values (327, '299');	insert into pub_cell_line_alternative (cellline_id, name) values (327, 'HEL-299');		
insert into pub_cell_line_alternative (cellline_id, name) values (328, 'HeLa');					
insert into pub_cell_line_alternative (cellline_id, name) values (329, 'HeLa');					
insert into pub_cell_line_alternative (cellline_id, name) values (330, 'HeLa');					
insert into pub_cell_line_alternative (cellline_id, name) values (331, 'HeLa');					
insert into pub_cell_line_alternative (cellline_id, name) values (332, 'HeLa');					
insert into pub_cell_line_alternative (cellline_id, name) values (333, 'HeLa');					
insert into pub_cell_line_alternative (cellline_id, name) values (334, 'HeLa');					
insert into pub_cell_line_alternative (cellline_id, name) values (335, 'HeLa');					
insert into pub_cell_line_alternative (cellline_id, name) values (336, 'HeLa');					
insert into pub_cell_line_alternative (cellline_id, name) values (337, 'Hep-2');	insert into pub_cell_line_alternative (cellline_id, name) values (337, 'HEP');	insert into pub_cell_line_alternative (cellline_id, name) values (337, 'HEP2');			
insert into pub_cell_line_alternative (cellline_id, name) values (338, 'Hep-3B');	insert into pub_cell_line_alternative (cellline_id, name) values (338, 'HEP');	insert into pub_cell_line_alternative (cellline_id, name) values (338, 'HEB3B');			
insert into pub_cell_line_alternative (cellline_id, name) values (339, 'HEPG2');	insert into pub_cell_line_alternative (cellline_id, name) values (339, 'HEP-G2');	insert into pub_cell_line_alternative (cellline_id, name) values (339, 'HEP2');			
					
					
					
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (346, 'HEPA');	insert into pub_cell_line_alternative (cellline_id, name) values (346, 'HEPA-1-6');				
insert into pub_cell_line_alternative (cellline_id, name) values (347, 'HEPA');					
insert into pub_cell_line_alternative (cellline_id, name) values (348, 'HEPA');					
insert into pub_cell_line_alternative (cellline_id, name) values (349, 'HEPA');					
insert into pub_cell_line_alternative (cellline_id, name) values (350, 'HEPM');					
insert into pub_cell_line_alternative (cellline_id, name) values (351, 'HFL1');	insert into pub_cell_line_alternative (cellline_id, name) values (351, 'HFL-1');				
insert into pub_cell_line_alternative (cellline_id, name) values (352, 'HG261');	insert into pub_cell_line_alternative (cellline_id, name) values (352, 'HG-261');	insert into pub_cell_line_alternative (cellline_id, name) values (352, 'HG');	insert into pub_cell_line_alternative (cellline_id, name) values (352, '261');		
					
insert into pub_cell_line_alternative (cellline_id, name) values (354, 'HL60');	insert into pub_cell_line_alternative (cellline_id, name) values (354, 'HL');				
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (357, 'HLF');	insert into pub_cell_line_alternative (cellline_id, name) values (357, 'HLF-a');	insert into pub_cell_line_alternative (cellline_id, name) values (357, 'HFLA');			
insert into pub_cell_line_alternative (cellline_id, name) values (358, 'HOS');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (360, 'HS27');	insert into pub_cell_line_alternative (cellline_id, name) values (360, 'HS-27');	insert into pub_cell_line_alternative (cellline_id, name) values (360, 'HS');			
insert into pub_cell_line_alternative (cellline_id, name) values (361, 'HS431');	insert into pub_cell_line_alternative (cellline_id, name) values (361, 'HS');	insert into pub_cell_line_alternative (cellline_id, name) values (361, '431');			
insert into pub_cell_line_alternative (cellline_id, name) values (362, 'HS');	insert into pub_cell_line_alternative (cellline_id, name) values (362, 'HS578');	insert into pub_cell_line_alternative (cellline_id, name) values (362, 'HS-578');	insert into pub_cell_line_alternative (cellline_id, name) values (362, '578');		
insert into pub_cell_line_alternative (cellline_id, name) values (363, 'HS');	insert into pub_cell_line_alternative (cellline_id, name) values (363, 'HS578');	insert into pub_cell_line_alternative (cellline_id, name) values (363, 'HS-578');	insert into pub_cell_line_alternative (cellline_id, name) values (363, '578');		
insert into pub_cell_line_alternative (cellline_id, name) values (364, 'HS');	insert into pub_cell_line_alternative (cellline_id, name) values (364, 'HS633');	insert into pub_cell_line_alternative (cellline_id, name) values (364, 'HS-633');	insert into pub_cell_line_alternative (cellline_id, name) values (364, '633');		
insert into pub_cell_line_alternative (cellline_id, name) values (365, 'HS');	insert into pub_cell_line_alternative (cellline_id, name) values (365, 'HS68');	insert into pub_cell_line_alternative (cellline_id, name) values (365, 'HS-68');			
insert into pub_cell_line_alternative (cellline_id, name) values (366, 'HS');	insert into pub_cell_line_alternative (cellline_id, name) values (366, 'HS683');	insert into pub_cell_line_alternative (cellline_id, name) values (366, 'HS-683');	insert into pub_cell_line_alternative (cellline_id, name) values (366, '683');		
insert into pub_cell_line_alternative (cellline_id, name) values (367, 'HS');	insert into pub_cell_line_alternative (cellline_id, name) values (367, 'HS863');	insert into pub_cell_line_alternative (cellline_id, name) values (367, 'HS-863');	insert into pub_cell_line_alternative (cellline_id, name) values (367, '863');		
insert into pub_cell_line_alternative (cellline_id, name) values (368, 'HS');	insert into pub_cell_line_alternative (cellline_id, name) values (368, 'HS883');	insert into pub_cell_line_alternative (cellline_id, name) values (368, 'HS-883');	insert into pub_cell_line_alternative (cellline_id, name) values (368, '883');		
insert into pub_cell_line_alternative (cellline_id, name) values (369, 'HS');	insert into pub_cell_line_alternative (cellline_id, name) values (369, 'HS888');	insert into pub_cell_line_alternative (cellline_id, name) values (369, 'HS-888');	insert into pub_cell_line_alternative (cellline_id, name) values (369, '888');		
					
insert into pub_cell_line_alternative (cellline_id, name) values (371, 'HS');	insert into pub_cell_line_alternative (cellline_id, name) values (371, 'HS27');				
insert into pub_cell_line_alternative (cellline_id, name) values (372, 'HS');	insert into pub_cell_line_alternative (cellline_id, name) values (372, 'SULTAN');				
insert into pub_cell_line_alternative (cellline_id, name) values (373, 'HSDM1C1');					
insert into pub_cell_line_alternative (cellline_id, name) values (374, 'HT');	insert into pub_cell_line_alternative (cellline_id, name) values (374, 'HT-1080');	insert into pub_cell_line_alternative (cellline_id, name) values (374, 'HS1080');	insert into pub_cell_line_alternative (cellline_id, name) values (374, '1080');		
insert into pub_cell_line_alternative (cellline_id, name) values (375, 'HT');	insert into pub_cell_line_alternative (cellline_id, name) values (375, 'HT-1197');	insert into pub_cell_line_alternative (cellline_id, name) values (375, 'HT1197');	insert into pub_cell_line_alternative (cellline_id, name) values (375, '1197');		
insert into pub_cell_line_alternative (cellline_id, name) values (376, 'HT');	insert into pub_cell_line_alternative (cellline_id, name) values (376, 'HT-1376');	insert into pub_cell_line_alternative (cellline_id, name) values (376, 'HT1376');	insert into pub_cell_line_alternative (cellline_id, name) values (376, '1376');		
					
insert into pub_cell_line_alternative (cellline_id, name) values (378, 'HT');	insert into pub_cell_line_alternative (cellline_id, name) values (378, 'HT-29');	insert into pub_cell_line_alternative (cellline_id, name) values (378, 'HT29');			
insert into pub_cell_line_alternative (cellline_id, name) values (379, 'HT2');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (381, 'HUT');	insert into pub_cell_line_alternative (cellline_id, name) values (381, 'HUT102');	insert into pub_cell_line_alternative (cellline_id, name) values (381, 'HUT-102');	insert into pub_cell_line_alternative (cellline_id, name) values (381, '102');		
insert into pub_cell_line_alternative (cellline_id, name) values (382, 'HUT');	insert into pub_cell_line_alternative (cellline_id, name) values (382, 'HUT78');	insert into pub_cell_line_alternative (cellline_id, name) values (382, 'HUT-78');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (384, 'HUTU');					
insert into pub_cell_line_alternative (cellline_id, name) values (385, 'HVS');	insert into pub_cell_line_alternative (cellline_id, name) values (385, 'SILVA');				
insert into pub_cell_line_alternative (cellline_id, name) values (386, 'I10');	insert into pub_cell_line_alternative (cellline_id, name) values (386, 'I-10');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (388, 'SBR');	insert into pub_cell_line_alternative (cellline_id, name) values (388, 'IA-XS');	insert into pub_cell_line_alternative (cellline_id, name) values (388, 'IAXS');			
insert into pub_cell_line_alternative (cellline_id, name) values (389, 'IBRS');	insert into pub_cell_line_alternative (cellline_id, name) values (389, 'IBRS-2');	insert into pub_cell_line_alternative (cellline_id, name) values (389, 'IBRS2');	insert into pub_cell_line_alternative (cellline_id, name) values (389, 'D10');		
insert into pub_cell_line_alternative (cellline_id, name) values (390, 'IC21');	insert into pub_cell_line_alternative (cellline_id, name) values (390, 'IC-21');				
insert into pub_cell_line_alternative (cellline_id, name) values (391, 'ICR-2A');	insert into pub_cell_line_alternative (cellline_id, name) values (391, 'ICR');				
insert into pub_cell_line_alternative (cellline_id, name) values (392, 'IEC18');	insert into pub_cell_line_alternative (cellline_id, name) values (392, 'IEC-18');	insert into pub_cell_line_alternative (cellline_id, name) values (392, 'IEC');			
insert into pub_cell_line_alternative (cellline_id, name) values (393, 'IEC6');	insert into pub_cell_line_alternative (cellline_id, name) values (393, 'IEC');	insert into pub_cell_line_alternative (cellline_id, name) values (393, 'IEC-6');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (395, 'IGH');	insert into pub_cell_line_alternative (cellline_id, name) values (395, 'IGH-2');	insert into pub_cell_line_alternative (cellline_id, name) values (395, 'IGH2');			
insert into pub_cell_line_alternative (cellline_id, name) values (396, 'IM9');	insert into pub_cell_line_alternative (cellline_id, name) values (396, 'IM-9');	insert into pub_cell_line_alternative (cellline_id, name) values (396, 'IM');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (398, 'IMR31');	insert into pub_cell_line_alternative (cellline_id, name) values (398, 'IMR');				
insert into pub_cell_line_alternative (cellline_id, name) values (399, 'IMR32');	insert into pub_cell_line_alternative (cellline_id, name) values (399, 'IMR');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (401, 'IMR90');	insert into pub_cell_line_alternative (cellline_id, name) values (401, 'IMR-90');	insert into pub_cell_line_alternative (cellline_id, name) values (401, 'IMR');			
insert into pub_cell_line_alternative (cellline_id, name) values (402, 'INDIAN');	insert into pub_cell_line_alternative (cellline_id, name) values (402, 'MUNTJAC');				
insert into pub_cell_line_alternative (cellline_id, name) values (403, 'INT');	insert into pub_cell_line_alternative (cellline_id, name) values (403, 'INT407');	insert into pub_cell_line_alternative (cellline_id, name) values (403, '407');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (405, '774A');	insert into pub_cell_line_alternative (cellline_id, name) values (405, 'J774a');	insert into pub_cell_line_alternative (cellline_id, name) values (405, 'j-774a');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (407, 'JCAM1-6');	insert into pub_cell_line_alternative (cellline_id, name) values (407, 'JCAM');	insert into pub_cell_line_alternative (cellline_id, name) values (407, 'CAM');	insert into pub_cell_line_alternative (cellline_id, name) values (407, 'CAM1');	insert into pub_cell_line_alternative (cellline_id, name) values (407, 'CAM1-6');	
insert into pub_cell_line_alternative (cellline_id, name) values (408, 'J45-01');	insert into pub_cell_line_alternative (cellline_id, name) values (408, 'J45');				
insert into pub_cell_line_alternative (cellline_id, name) values (409, 'J774A');					
insert into pub_cell_line_alternative (cellline_id, name) values (410, 'JABOS');	insert into pub_cell_line_alternative (cellline_id, name) values (410, 'BOS');	insert into pub_cell_line_alternative (cellline_id, name) values (410, 'JA');			
insert into pub_cell_line_alternative (cellline_id, name) values (411, 'JAY');	insert into pub_cell_line_alternative (cellline_id, name) values (411, 'SEN');				
insert into pub_cell_line_alternative (cellline_id, name) values (412, 'JEG-3');	insert into pub_cell_line_alternative (cellline_id, name) values (412, 'JEG3');	insert into pub_cell_line_alternative (cellline_id, name) values (412, 'JEG');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (414, 'JENSEN');	insert into pub_cell_line_alternative (cellline_id, name) values (414, 'SARCOMA');				
insert into pub_cell_line_alternative (cellline_id, name) values (415, 'JH4');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (417, 'JIYOYE');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (419, 'JLS');					
insert into pub_cell_line_alternative (cellline_id, name) values (420, 'K562');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (422, 'KBALB');	insert into pub_cell_line_alternative (cellline_id, name) values (422, 'BALB');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (424, 'K6H6');					
insert into pub_cell_line_alternative (cellline_id, name) values (425, 'KATO');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (427, 'KB');					
insert into pub_cell_line_alternative (cellline_id, name) values (428, 'KG1');	insert into pub_cell_line_alternative (cellline_id, name) values (428, 'KG-1');				
insert into pub_cell_line_alternative (cellline_id, name) values (429, 'KG1');	insert into pub_cell_line_alternative (cellline_id, name) values (429, 'KG1A');	insert into pub_cell_line_alternative (cellline_id, name) values (429, 'KG-1A');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (431, 'KHOS');	insert into pub_cell_line_alternative (cellline_id, name) values (431, '240S');				
insert into pub_cell_line_alternative (cellline_id, name) values (432, 'KHOS');	insert into pub_cell_line_alternative (cellline_id, name) values (432, '312H');				
insert into pub_cell_line_alternative (cellline_id, name) values (433, 'KHOS');					
insert into pub_cell_line_alternative (cellline_id, name) values (434, 'KLN');	insert into pub_cell_line_alternative (cellline_id, name) values (434, '205');				
insert into pub_cell_line_alternative (cellline_id, name) values (435, 'KNRK');					
insert into pub_cell_line_alternative (cellline_id, name) values (436, 'L1210');					
insert into pub_cell_line_alternative (cellline_id, name) values (437, 'L132');					
insert into pub_cell_line_alternative (cellline_id, name) values (438, 'L216');					
insert into pub_cell_line_alternative (cellline_id, name) values (439, 'L243');					
insert into pub_cell_line_alternative (cellline_id, name) values (440, 'L51');					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (443, 'L2');					
insert into pub_cell_line_alternative (cellline_id, name) values (444, 'LM');					
					
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (449, 'L5178Y');					
insert into pub_cell_line_alternative (cellline_id, name) values (450, 'L5178Y');					
insert into pub_cell_line_alternative (cellline_id, name) values (451, 'L6');					
insert into pub_cell_line_alternative (cellline_id, name) values (452, 'L8');					
insert into pub_cell_line_alternative (cellline_id, name) values (453, 'LA4');	insert into pub_cell_line_alternative (cellline_id, name) values (453, 'LA-4');				
insert into pub_cell_line_alternative (cellline_id, name) values (454, 'LBRM');	insert into pub_cell_line_alternative (cellline_id, name) values (454, 'LBRM-33-1A5');	insert into pub_cell_line_alternative (cellline_id, name) values (454, '1A5');			
insert into pub_cell_line_alternative (cellline_id, name) values (455, 'LC540');	insert into pub_cell_line_alternative (cellline_id, name) values (455, 'LC-540');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (457, 'LL-2');	insert into pub_cell_line_alternative (cellline_id, name) values (457, 'LL2');				
insert into pub_cell_line_alternative (cellline_id, name) values (458, 'LL24');	insert into pub_cell_line_alternative (cellline_id, name) values (458, 'LL-24');				
insert into pub_cell_line_alternative (cellline_id, name) values (459, 'LL29');	insert into pub_cell_line_alternative (cellline_id, name) values (459, 'LL-29');				
insert into pub_cell_line_alternative (cellline_id, name) values (460, 'LL47');	insert into pub_cell_line_alternative (cellline_id, name) values (460, 'LL-47');				
insert into pub_cell_line_alternative (cellline_id, name) values (461, 'LL86');	insert into pub_cell_line_alternative (cellline_id, name) values (461, 'LL-86');				
insert into pub_cell_line_alternative (cellline_id, name) values (462, 'LLC');	insert into pub_cell_line_alternative (cellline_id, name) values (462, 'MK2');				
insert into pub_cell_line_alternative (cellline_id, name) values (463, 'LLC');	insert into pub_cell_line_alternative (cellline_id, name) values (463, 'PK1');				
insert into pub_cell_line_alternative (cellline_id, name) values (464, 'LLC');	insert into pub_cell_line_alternative (cellline_id, name) values (464, 'RK1');				
insert into pub_cell_line_alternative (cellline_id, name) values (465, 'LLC');	insert into pub_cell_line_alternative (cellline_id, name) values (465, 'WRC');	insert into pub_cell_line_alternative (cellline_id, name) values (465, '256');			
insert into pub_cell_line_alternative (cellline_id, name) values (466, 'LLCMK2');	insert into pub_cell_line_alternative (cellline_id, name) values (466, 'LLC');	insert into pub_cell_line_alternative (cellline_id, name) values (466, 'MK2');			
insert into pub_cell_line_alternative (cellline_id, name) values (467, 'LM');	insert into pub_cell_line_alternative (cellline_id, name) values (467, 'NCTC');	insert into pub_cell_line_alternative (cellline_id, name) values (467, '929');			
insert into pub_cell_line_alternative (cellline_id, name) values (468, 'LMTK');	insert into pub_cell_line_alternative (cellline_id, name) values (468, 'LM-TK');				
insert into pub_cell_line_alternative (cellline_id, name) values (469, 'LNCAP');	insert into pub_cell_line_alternative (cellline_id, name) values (469, 'FGC');				
insert into pub_cell_line_alternative (cellline_id, name) values (470, 'LOVO');					
insert into pub_cell_line_alternative (cellline_id, name) values (471, 'LS123');	insert into pub_cell_line_alternative (cellline_id, name) values (471, 'LS-123');				
insert into pub_cell_line_alternative (cellline_id, name) values (472, 'LS180');	insert into pub_cell_line_alternative (cellline_id, name) values (472, 'LS-180');				
insert into pub_cell_line_alternative (cellline_id, name) values (473, 'LS174');	insert into pub_cell_line_alternative (cellline_id, name) values (473, 'LS-174');	insert into pub_cell_line_alternative (cellline_id, name) values (473, '174');			
insert into pub_cell_line_alternative (cellline_id, name) values (474, 'LS180');	insert into pub_cell_line_alternative (cellline_id, name) values (474, 'LS-180');	insert into pub_cell_line_alternative (cellline_id, name) values (474, '180');			
insert into pub_cell_line_alternative (cellline_id, name) values (475, 'M1');	insert into pub_cell_line_alternative (cellline_id, name) values (475, 'M-1');				
insert into pub_cell_line_alternative (cellline_id, name) values (476, 'M2E6');	insert into pub_cell_line_alternative (cellline_id, name) values (476, 'M-2E6');	insert into pub_cell_line_alternative (cellline_id, name) values (476, '2E6');			
insert into pub_cell_line_alternative (cellline_id, name) values (477, 'MSV');	insert into pub_cell_line_alternative (cellline_id, name) values (477, 'BALB');	insert into pub_cell_line_alternative (cellline_id, name) values (477, '3T3');			
insert into pub_cell_line_alternative (cellline_id, name) values (478, 'DUNNI');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (480, 'M1WT3');	insert into pub_cell_line_alternative (cellline_id, name) values (480, 'WTC');				
insert into pub_cell_line_alternative (cellline_id, name) values (481, 'M2');	insert into pub_cell_line_alternative (cellline_id, name) values (481, '1C6');	insert into pub_cell_line_alternative (cellline_id, name) values (481, '4R3');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (483, 'MAB');					
insert into pub_cell_line_alternative (cellline_id, name) values (484, 'MALME');					
insert into pub_cell_line_alternative (cellline_id, name) values (485, 'MB');	insert into pub_cell_line_alternative (cellline_id, name) values (485, 'MB-III');	insert into pub_cell_line_alternative (cellline_id, name) values (485, 'MBIII');			
insert into pub_cell_line_alternative (cellline_id, name) values (486, 'MCCOY');	insert into pub_cell_line_alternative (cellline_id, name) values (486, 'MC-COY');				
insert into pub_cell_line_alternative (cellline_id, name) values (487, 'MC-116');	insert into pub_cell_line_alternative (cellline_id, name) values (487, 'MC116');	insert into pub_cell_line_alternative (cellline_id, name) values (487, '116');			
insert into pub_cell_line_alternative (cellline_id, name) values (488, 'MC-CAR');	insert into pub_cell_line_alternative (cellline_id, name) values (488, 'CAR');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (490, 'MCA');	insert into pub_cell_line_alternative (cellline_id, name) values (490, 'MCA-RH');	insert into pub_cell_line_alternative (cellline_id, name) values (490, '7777');			
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (493, 'MCF-7');	insert into pub_cell_line_alternative (cellline_id, name) values (493, 'MCF7');				
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (496, 'MDA');					
insert into pub_cell_line_alternative (cellline_id, name) values (497, 'MDA');					
insert into pub_cell_line_alternative (cellline_id, name) values (498, 'MDA');					
insert into pub_cell_line_alternative (cellline_id, name) values (499, 'MDA');					
insert into pub_cell_line_alternative (cellline_id, name) values (500, 'MDA');					
insert into pub_cell_line_alternative (cellline_id, name) values (501, 'MDA');					
insert into pub_cell_line_alternative (cellline_id, name) values (502, 'MDBK');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (504, 'MDCK');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (506, 'MDOK');					
insert into pub_cell_line_alternative (cellline_id, name) values (507, 'MDTC');	insert into pub_cell_line_alternative (cellline_id, name) values (507, 'RP19');	insert into pub_cell_line_alternative (cellline_id, name) values (507, 'RP-19');			
insert into pub_cell_line_alternative (cellline_id, name) values (508, 'MEG');	insert into pub_cell_line_alternative (cellline_id, name) values (508, 'MEG-01');	insert into pub_cell_line_alternative (cellline_id, name) values (508, 'MEG01');			
insert into pub_cell_line_alternative (cellline_id, name) values (509, 'MELIII');	insert into pub_cell_line_alternative (cellline_id, name) values (509, 'MEL');	insert into pub_cell_line_alternative (cellline_id, name) values (509, 'MEL-III');			
insert into pub_cell_line_alternative (cellline_id, name) values (510, 'MES');	insert into pub_cell_line_alternative (cellline_id, name) values (510, 'MES-SA');				
insert into pub_cell_line_alternative (cellline_id, name) values (511, 'DX5');	insert into pub_cell_line_alternative (cellline_id, name) values (511, 'DX-5');	insert into pub_cell_line_alternative (cellline_id, name) values (511, 'MES');			
insert into pub_cell_line_alternative (cellline_id, name) values (512, 'MG63');	insert into pub_cell_line_alternative (cellline_id, name) values (512, 'MG-63');				
insert into pub_cell_line_alternative (cellline_id, name) values (513, 'MH1C1');	insert into pub_cell_line_alternative (cellline_id, name) values (513, 'MH');	insert into pub_cell_line_alternative (cellline_id, name) values (513, '1C1');	insert into pub_cell_line_alternative (cellline_id, name) values (513, 'MH-1C1');		
insert into pub_cell_line_alternative (cellline_id, name) values (514, 'MHS');	insert into pub_cell_line_alternative (cellline_id, name) values (514, 'MH-S');				
insert into pub_cell_line_alternative (cellline_id, name) values (515, 'MH1C1');	insert into pub_cell_line_alternative (cellline_id, name) values (515, 'MH');	insert into pub_cell_line_alternative (cellline_id, name) values (515, '1C1');	insert into pub_cell_line_alternative (cellline_id, name) values (515, 'MH-1C1');		
insert into pub_cell_line_alternative (cellline_id, name) values (516, 'MIA');	insert into pub_cell_line_alternative (cellline_id, name) values (516, 'PACA');	insert into pub_cell_line_alternative (cellline_id, name) values (516, 'PACA-2');	insert into pub_cell_line_alternative (cellline_id, name) values (516, 'PACA2');		
					
insert into pub_cell_line_alternative (cellline_id, name) values (518, 'MICL');	insert into pub_cell_line_alternative (cellline_id, name) values (518, 'MICL1');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (520, 'MKD6');	insert into pub_cell_line_alternative (cellline_id, name) values (520, 'MK-D6');	insert into pub_cell_line_alternative (cellline_id, name) values (520, 'MK');	insert into pub_cell_line_alternative (cellline_id, name) values (520, 'D6');		
insert into pub_cell_line_alternative (cellline_id, name) values (521, 'MLA');	insert into pub_cell_line_alternative (cellline_id, name) values (521, 'MLA-144');	insert into pub_cell_line_alternative (cellline_id, name) values (521, '144');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (523, 'MLG');					
insert into pub_cell_line_alternative (cellline_id, name) values (524, 'MMT');					
insert into pub_cell_line_alternative (cellline_id, name) values (525, 'MNNG');	insert into pub_cell_line_alternative (cellline_id, name) values (525, 'HOS');				
insert into pub_cell_line_alternative (cellline_id, name) values (526, 'MOB');	insert into pub_cell_line_alternative (cellline_id, name) values (526, 'MO-B');				
insert into pub_cell_line_alternative (cellline_id, name) values (527, 'MOLT');					
insert into pub_cell_line_alternative (cellline_id, name) values (528, 'MOLT');					
insert into pub_cell_line_alternative (cellline_id, name) values (529, 'MOP');	insert into pub_cell_line_alternative (cellline_id, name) values (529, 'MOP8');	insert into pub_cell_line_alternative (cellline_id, name) values (529, 'MOP-8');			
insert into pub_cell_line_alternative (cellline_id, name) values (530, 'MOPC');	insert into pub_cell_line_alternative (cellline_id, name) values (530, '315');				
insert into pub_cell_line_alternative (cellline_id, name) values (531, 'MOPC');	insert into pub_cell_line_alternative (cellline_id, name) values (531, '31C');				
insert into pub_cell_line_alternative (cellline_id, name) values (532, 'MPC');	insert into pub_cell_line_alternative (cellline_id, name) values (532, 'MPC11');	insert into pub_cell_line_alternative (cellline_id, name) values (532, 'MPC-11');			
insert into pub_cell_line_alternative (cellline_id, name) values (533, 'MPF');					
insert into pub_cell_line_alternative (cellline_id, name) values (534, 'MPK');					
insert into pub_cell_line_alternative (cellline_id, name) values (535, 'MRC5');	insert into pub_cell_line_alternative (cellline_id, name) values (535, 'MRC-5');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (537, 'MRC9');	insert into pub_cell_line_alternative (cellline_id, name) values (537, 'MRC-9');				
insert into pub_cell_line_alternative (cellline_id, name) values (538, 'MRSS');	insert into pub_cell_line_alternative (cellline_id, name) values (538, 'MRSS-1');	insert into pub_cell_line_alternative (cellline_id, name) values (538, 'MRSS1');			
insert into pub_cell_line_alternative (cellline_id, name) values (539, 'MV1LU');	insert into pub_cell_line_alternative (cellline_id, name) values (539, 'MV-1-LU');	insert into pub_cell_line_alternative (cellline_id, name) values (539, 'MV');	insert into pub_cell_line_alternative (cellline_id, name) values (539, 'MV1');	insert into pub_cell_line_alternative (cellline_id, name) values (539, '1LU');	
					
insert into pub_cell_line_alternative (cellline_id, name) values (541, 'MV411');	insert into pub_cell_line_alternative (cellline_id, name) values (541, 'MV-4-11');	insert into pub_cell_line_alternative (cellline_id, name) values (541, 'MV4');			
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (544, 'N1S1');	insert into pub_cell_line_alternative (cellline_id, name) values (544, 'N1-S1');				
insert into pub_cell_line_alternative (cellline_id, name) values (545, 'N1E-115');	insert into pub_cell_line_alternative (cellline_id, name) values (545, '115');				
insert into pub_cell_line_alternative (cellline_id, name) values (546, 'NAMALWA');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (548, 'NB4');	insert into pub_cell_line_alternative (cellline_id, name) values (548, '1A3');	insert into pub_cell_line_alternative (cellline_id, name) values (548, 'NB4-1A3');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (550, 'NBT');					
insert into pub_cell_line_alternative (cellline_id, name) values (551, 'NC-37');	insert into pub_cell_line_alternative (cellline_id, name) values (551, 'NC37');				
insert into pub_cell_line_alternative (cellline_id, name) values (552, 'NCL');	insert into pub_cell_line_alternative (cellline_id, name) values (552, 'H292');				
insert into pub_cell_line_alternative (cellline_id, name) values (553, 'NCL');	insert into pub_cell_line_alternative (cellline_id, name) values (553, 'H322');				
insert into pub_cell_line_alternative (cellline_id, name) values (554, 'NCL');	insert into pub_cell_line_alternative (cellline_id, name) values (554, 'H358');				
insert into pub_cell_line_alternative (cellline_id, name) values (555, 'NCL');	insert into pub_cell_line_alternative (cellline_id, name) values (555, 'H716');				
insert into pub_cell_line_alternative (cellline_id, name) values (556, 'NCL');	insert into pub_cell_line_alternative (cellline_id, name) values (556, 'H727');				
insert into pub_cell_line_alternative (cellline_id, name) values (557, 'NCL');	insert into pub_cell_line_alternative (cellline_id, name) values (557, 'H929');				
insert into pub_cell_line_alternative (cellline_id, name) values (558, 'NCTC');	insert into pub_cell_line_alternative (cellline_id, name) values (558, '2071');				
insert into pub_cell_line_alternative (cellline_id, name) values (559, 'NCTC');	insert into pub_cell_line_alternative (cellline_id, name) values (559, '3749');				
insert into pub_cell_line_alternative (cellline_id, name) values (560, 'NCTC');	insert into pub_cell_line_alternative (cellline_id, name) values (560, '4093');				
insert into pub_cell_line_alternative (cellline_id, name) values (561, 'NCTC');	insert into pub_cell_line_alternative (cellline_id, name) values (561, '4206');				
insert into pub_cell_line_alternative (cellline_id, name) values (562, 'NCTC');	insert into pub_cell_line_alternative (cellline_id, name) values (562, '1469');				
insert into pub_cell_line_alternative (cellline_id, name) values (563, 'NCTC');	insert into pub_cell_line_alternative (cellline_id, name) values (563, '2472');				
insert into pub_cell_line_alternative (cellline_id, name) values (564, 'NCTC');	insert into pub_cell_line_alternative (cellline_id, name) values (564, '2555');				
insert into pub_cell_line_alternative (cellline_id, name) values (565, 'NCTC');	insert into pub_cell_line_alternative (cellline_id, name) values (565, '3526');				
insert into pub_cell_line_alternative (cellline_id, name) values (566, 'NCTC');	insert into pub_cell_line_alternative (cellline_id, name) values (566, '929');				
insert into pub_cell_line_alternative (cellline_id, name) values (567, 'NEURO');					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (570, 'NFS');	insert into pub_cell_line_alternative (cellline_id, name) values (570, 'NFS-25');	insert into pub_cell_line_alternative (cellline_id, name) values (570, 'NFS25');			
insert into pub_cell_line_alternative (cellline_id, name) values (571, 'NFS');	insert into pub_cell_line_alternative (cellline_id, name) values (571, 'NFS-5');	insert into pub_cell_line_alternative (cellline_id, name) values (571, 'NFS5');			
insert into pub_cell_line_alternative (cellline_id, name) values (572, 'NFS');	insert into pub_cell_line_alternative (cellline_id, name) values (572, 'NFS-70');	insert into pub_cell_line_alternative (cellline_id, name) values (572, 'NFS70');			
insert into pub_cell_line_alternative (cellline_id, name) values (573, 'NIH');	insert into pub_cell_line_alternative (cellline_id, name) values (573, '3T3');	insert into pub_cell_line_alternative (cellline_id, name) values (573, 'NIH3T3');	insert into pub_cell_line_alternative (cellline_id, name) values (573, 'NIH-3T3');		
					
insert into pub_cell_line_alternative (cellline_id, name) values (575, 'NIH');	insert into pub_cell_line_alternative (cellline_id, name) values (575, '3T3');	insert into pub_cell_line_alternative (cellline_id, name) values (575, 'NIH3T3');	insert into pub_cell_line_alternative (cellline_id, name) values (575, 'NIH-3T3');		
					
insert into pub_cell_line_alternative (cellline_id, name) values (577, 'NIH');	insert into pub_cell_line_alternative (cellline_id, name) values (577, 'OVCAR');	insert into pub_cell_line_alternative (cellline_id, name) values (577, 'OVCAR3');			
insert into pub_cell_line_alternative (cellline_id, name) values (578, 'NMUMG');					
insert into pub_cell_line_alternative (cellline_id, name) values (579, 'NOR');					
insert into pub_cell_line_alternative (cellline_id, name) values (580, 'NRK');	insert into pub_cell_line_alternative (cellline_id, name) values (580, '49F');	insert into pub_cell_line_alternative (cellline_id, name) values (580, 'NRK49F');	insert into pub_cell_line_alternative (cellline_id, name) values (580, 'NRK-49F');		
					
insert into pub_cell_line_alternative (cellline_id, name) values (582, 'NRK');	insert into pub_cell_line_alternative (cellline_id, name) values (582, 'NRK-52E');	insert into pub_cell_line_alternative (cellline_id, name) values (582, 'NRK52E');	insert into pub_cell_line_alternative (cellline_id, name) values (582, '52E');		
insert into pub_cell_line_alternative (cellline_id, name) values (583, 'NULLI');	insert into pub_cell_line_alternative (cellline_id, name) values (583, 'SCC1');				
insert into pub_cell_line_alternative (cellline_id, name) values (584, 'OA1');					
insert into pub_cell_line_alternative (cellline_id, name) values (585, 'OHH1');	insert into pub_cell_line_alternative (cellline_id, name) values (585, 'OHH1-K');	insert into pub_cell_line_alternative (cellline_id, name) values (585, 'OHH1K');			
insert into pub_cell_line_alternative (cellline_id, name) values (586, 'OK');					
insert into pub_cell_line_alternative (cellline_id, name) values (587, 'OKT3');	insert into pub_cell_line_alternative (cellline_id, name) values (587, 'OKT');				
insert into pub_cell_line_alternative (cellline_id, name) values (588, 'OKT4');	insert into pub_cell_line_alternative (cellline_id, name) values (588, 'OKT');				
insert into pub_cell_line_alternative (cellline_id, name) values (589, 'OKT8');	insert into pub_cell_line_alternative (cellline_id, name) values (589, 'OKT');				
insert into pub_cell_line_alternative (cellline_id, name) values (590, 'OMK');					
insert into pub_cell_line_alternative (cellline_id, name) values (591, 'ORDE');	insert into pub_cell_line_alternative (cellline_id, name) values (591, 'OR');	insert into pub_cell_line_alternative (cellline_id, name) values (591, 'DE');			
insert into pub_cell_line_alternative (cellline_id, name) values (592, 'OVCAR3');	insert into pub_cell_line_alternative (cellline_id, name) values (592, 'OVCAR');				
insert into pub_cell_line_alternative (cellline_id, name) values (593, 'P3HR1');	insert into pub_cell_line_alternative (cellline_id, name) values (593, 'HR1');				
insert into pub_cell_line_alternative (cellline_id, name) values (594, 'P-815');	insert into pub_cell_line_alternative (cellline_id, name) values (594, 'P815');				
insert into pub_cell_line_alternative (cellline_id, name) values (595, 'P19');	insert into pub_cell_line_alternative (cellline_id, name) values (595, 'P-19');				
insert into pub_cell_line_alternative (cellline_id, name) values (596, 'P3-88-D1');	insert into pub_cell_line_alternative (cellline_id, name) values (596, '88D1');				
insert into pub_cell_line_alternative (cellline_id, name) values (597, 'PSNS1');	insert into pub_cell_line_alternative (cellline_id, name) values (597, 'AG4');	insert into pub_cell_line_alternative (cellline_id, name) values (597, 'PS-NS1');			
insert into pub_cell_line_alternative (cellline_id, name) values (598, 'P3');	insert into pub_cell_line_alternative (cellline_id, name) values (598, 'NS1');	insert into pub_cell_line_alternative (cellline_id, name) values (598, 'AG4-1');	insert into pub_cell_line_alternative (cellline_id, name) values (598, 'AG4');		
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (601, 'P388');	insert into pub_cell_line_alternative (cellline_id, name) values (601, 'P388-D1');	insert into pub_cell_line_alternative (cellline_id, name) values (601, '388-D1');			
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (604, 'P3HR1');	insert into pub_cell_line_alternative (cellline_id, name) values (604, 'P3HR-1');	insert into pub_cell_line_alternative (cellline_id, name) values (604, 'P3HR');			
insert into pub_cell_line_alternative (cellline_id, name) values (605, 'P3NP');	insert into pub_cell_line_alternative (cellline_id, name) values (605, 'PFN');				
insert into pub_cell_line_alternative (cellline_id, name) values (606, 'P3U1');					
insert into pub_cell_line_alternative (cellline_id, name) values (607, 'P3X');	insert into pub_cell_line_alternative (cellline_id, name) values (607, 'P3X63');	insert into pub_cell_line_alternative (cellline_id, name) values (607, 'AG8');			
insert into pub_cell_line_alternative (cellline_id, name) values (608, 'P3X');	insert into pub_cell_line_alternative (cellline_id, name) values (608, 'P3X63');	insert into pub_cell_line_alternative (cellline_id, name) values (608, 'AG8');	insert into pub_cell_line_alternative (cellline_id, name) values (608, '653');		
insert into pub_cell_line_alternative (cellline_id, name) values (609, 'P3X');	insert into pub_cell_line_alternative (cellline_id, name) values (609, 'P3X63');	insert into pub_cell_line_alternative (cellline_id, name) values (609, 'AG8');			
insert into pub_cell_line_alternative (cellline_id, name) values (610, 'P815');					
insert into pub_cell_line_alternative (cellline_id, name) values (611, 'PA-1');	insert into pub_cell_line_alternative (cellline_id, name) values (611, 'PA1');				
insert into pub_cell_line_alternative (cellline_id, name) values (612, 'PA317');	insert into pub_cell_line_alternative (cellline_id, name) values (612, 'PA-317');	insert into pub_cell_line_alternative (cellline_id, name) values (612, '317');			
insert into pub_cell_line_alternative (cellline_id, name) values (613, 'PAB');	insert into pub_cell_line_alternative (cellline_id, name) values (613, 'PAB-100');	insert into pub_cell_line_alternative (cellline_id, name) values (613, 'PAB100');			
insert into pub_cell_line_alternative (cellline_id, name) values (614, 'PAB');	insert into pub_cell_line_alternative (cellline_id, name) values (614, 'PAB-122');	insert into pub_cell_line_alternative (cellline_id, name) values (614, 'PAB122');			
insert into pub_cell_line_alternative (cellline_id, name) values (615, 'PANC1');	insert into pub_cell_line_alternative (cellline_id, name) values (615, 'PANC-1');	insert into pub_cell_line_alternative (cellline_id, name) values (615, 'PANC');			
insert into pub_cell_line_alternative (cellline_id, name) values (616, 'PC61');	insert into pub_cell_line_alternative (cellline_id, name) values (616, 'PC61-5-3');				
insert into pub_cell_line_alternative (cellline_id, name) values (617, 'PC12');	insert into pub_cell_line_alternative (cellline_id, name) values (617, 'PC-12');				
insert into pub_cell_line_alternative (cellline_id, name) values (618, 'PC3');	insert into pub_cell_line_alternative (cellline_id, name) values (618, 'PC-3');				
insert into pub_cell_line_alternative (cellline_id, name) values (619, 'PEG');	insert into pub_cell_line_alternative (cellline_id, name) values (619, 'PEG-16');	insert into pub_cell_line_alternative (cellline_id, name) values (619, 'PEG-1-6');			
insert into pub_cell_line_alternative (cellline_id, name) values (620, 'PG-4');	insert into pub_cell_line_alternative (cellline_id, name) values (620, 'PG4');				
insert into pub_cell_line_alternative (cellline_id, name) values (621, 'PG13');	insert into pub_cell_line_alternative (cellline_id, name) values (621, 'PG-13');				
insert into pub_cell_line_alternative (cellline_id, name) values (622, 'PI-1');	insert into pub_cell_line_alternative (cellline_id, name) values (622, 'PI1');	insert into pub_cell_line_alternative (cellline_id, name) values (622, 'PI1UT');			
insert into pub_cell_line_alternative (cellline_id, name) values (623, 'PK15');	insert into pub_cell_line_alternative (cellline_id, name) values (623, 'PK-15');	insert into pub_cell_line_alternative (cellline_id, name) values (623, 'PK');			
insert into pub_cell_line_alternative (cellline_id, name) values (624, 'PK');					
insert into pub_cell_line_alternative (cellline_id, name) values (625, 'PLC');	insert into pub_cell_line_alternative (cellline_id, name) values (625, 'PRF');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (627, 'PSI');	insert into pub_cell_line_alternative (cellline_id, name) values (627, 'PSI2');	insert into pub_cell_line_alternative (cellline_id, name) values (627, 'BAG');			
insert into pub_cell_line_alternative (cellline_id, name) values (628, 'PTK1');	insert into pub_cell_line_alternative (cellline_id, name) values (628, 'PT-K1');				
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (631, 'PTK2');	insert into pub_cell_line_alternative (cellline_id, name) values (631, 'PT-K2');				
insert into pub_cell_line_alternative (cellline_id, name) values (632, 'PU518');	insert into pub_cell_line_alternative (cellline_id, name) values (632, '518');	insert into pub_cell_line_alternative (cellline_id, name) values (632, 'PU-518');			
insert into pub_cell_line_alternative (cellline_id, name) values (633, 'QT6');	insert into pub_cell_line_alternative (cellline_id, name) values (633, 'QT-6');				
insert into pub_cell_line_alternative (cellline_id, name) values (634, 'R2C');					
insert into pub_cell_line_alternative (cellline_id, name) values (635, 'R9AB');					
insert into pub_cell_line_alternative (cellline_id, name) values (636, 'RD');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (638, 'R63');					
insert into pub_cell_line_alternative (cellline_id, name) values (639, 'R9AB');					
insert into pub_cell_line_alternative (cellline_id, name) values (640, 'RAB-9');	insert into pub_cell_line_alternative (cellline_id, name) values (640, 'RAB');				
insert into pub_cell_line_alternative (cellline_id, name) values (641, 'RAG');					
insert into pub_cell_line_alternative (cellline_id, name) values (642, 'RAJI');					
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (646, 'RAMOS');					
insert into pub_cell_line_alternative (cellline_id, name) values (647, 'RAT-2');	insert into pub_cell_line_alternative (cellline_id, name) values (647, 'RAT2');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (649, 'RAW264');	insert into pub_cell_line_alternative (cellline_id, name) values (649, 'RAW-264');	insert into pub_cell_line_alternative (cellline_id, name) values (649, '264');			
insert into pub_cell_line_alternative (cellline_id, name) values (650, 'RBL1');	insert into pub_cell_line_alternative (cellline_id, name) values (650, 'RBL-1');	insert into pub_cell_line_alternative (cellline_id, name) values (650, 'RBL');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (652, 'RD');					
insert into pub_cell_line_alternative (cellline_id, name) values (653, 'RD-ES');	insert into pub_cell_line_alternative (cellline_id, name) values (653, 'RDES');	insert into pub_cell_line_alternative (cellline_id, name) values (653, 'RD');			
insert into pub_cell_line_alternative (cellline_id, name) values (654, 'RFL6');	insert into pub_cell_line_alternative (cellline_id, name) values (654, 'RFL');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (656, 'RIN');	insert into pub_cell_line_alternative (cellline_id, name) values (656, 'RIN5F');				
insert into pub_cell_line_alternative (cellline_id, name) values (657, 'RINM');	insert into pub_cell_line_alternative (cellline_id, name) values (657, 'RIN');				
insert into pub_cell_line_alternative (cellline_id, name) values (658, 'RK13');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (660, 'RPMI');					
insert into pub_cell_line_alternative (cellline_id, name) values (661, 'RPMI');					
insert into pub_cell_line_alternative (cellline_id, name) values (662, 'RPMI');					
insert into pub_cell_line_alternative (cellline_id, name) values (663, 'RPMI');					
insert into pub_cell_line_alternative (cellline_id, name) values (664, 'RPMI');					
insert into pub_cell_line_alternative (cellline_id, name) values (665, 'RPMI');					
insert into pub_cell_line_alternative (cellline_id, name) values (666, 'RPMI');					
insert into pub_cell_line_alternative (cellline_id, name) values (667, 'RR');	insert into pub_cell_line_alternative (cellline_id, name) values (667, '1022');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (669, 'RT4');	insert into pub_cell_line_alternative (cellline_id, name) values (669, 'RT');				
insert into pub_cell_line_alternative (cellline_id, name) values (670, 'RTG2');	insert into pub_cell_line_alternative (cellline_id, name) values (670, 'RTG');	insert into pub_cell_line_alternative (cellline_id, name) values (670, 'RTG-2');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (672, 'SAOS');	insert into pub_cell_line_alternative (cellline_id, name) values (672, 'SAOS-2');	insert into pub_cell_line_alternative (cellline_id, name) values (672, 'SAOS2');			
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (675, 'SBAC');					
insert into pub_cell_line_alternative (cellline_id, name) values (676, 'SC1');	insert into pub_cell_line_alternative (cellline_id, name) values (676, 'SC-1');				
insert into pub_cell_line_alternative (cellline_id, name) values (677, 'SCP');					
insert into pub_cell_line_alternative (cellline_id, name) values (678, 'SF1EP');	insert into pub_cell_line_alternative (cellline_id, name) values (678, 'SF1');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (680, 'SF9');	insert into pub_cell_line_alternative (cellline_id, name) values (680, 'SF-9');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (682, 'SHM');	insert into pub_cell_line_alternative (cellline_id, name) values (682, 'SHM-D33');	insert into pub_cell_line_alternative (cellline_id, name) values (682, 'D33');			
insert into pub_cell_line_alternative (cellline_id, name) values (683, 'SIHA');					
insert into pub_cell_line_alternative (cellline_id, name) values (684, 'SIRC');					
insert into pub_cell_line_alternative (cellline_id, name) values (685, 'SJMRF');					
insert into pub_cell_line_alternative (cellline_id, name) values (686, 'SKLU1');	insert into pub_cell_line_alternative (cellline_id, name) values (686, 'SKLU');				
insert into pub_cell_line_alternative (cellline_id, name) values (687, 'SKBR');	insert into pub_cell_line_alternative (cellline_id, name) values (687, 'SKBR-3');	insert into pub_cell_line_alternative (cellline_id, name) values (687, 'SKBR3');			
insert into pub_cell_line_alternative (cellline_id, name) values (688, 'SK');	insert into pub_cell_line_alternative (cellline_id, name) values (688, 'HEP1');	insert into pub_cell_line_alternative (cellline_id, name) values (688, 'HEP');			
insert into pub_cell_line_alternative (cellline_id, name) values (689, 'SK');	insert into pub_cell_line_alternative (cellline_id, name) values (689, 'LU');				
insert into pub_cell_line_alternative (cellline_id, name) values (690, 'SK');	insert into pub_cell_line_alternative (cellline_id, name) values (690, 'MEL');	insert into pub_cell_line_alternative (cellline_id, name) values (690, 'MEL28');			
insert into pub_cell_line_alternative (cellline_id, name) values (691, 'SK');	insert into pub_cell_line_alternative (cellline_id, name) values (691, 'MES');				
insert into pub_cell_line_alternative (cellline_id, name) values (692, 'SK');	insert into pub_cell_line_alternative (cellline_id, name) values (692, 'NAS');				
insert into pub_cell_line_alternative (cellline_id, name) values (693, 'SK');	insert into pub_cell_line_alternative (cellline_id, name) values (693, 'NDZ');				
insert into pub_cell_line_alternative (cellline_id, name) values (694, 'SK');	insert into pub_cell_line_alternative (cellline_id, name) values (694, 'NMC');				
insert into pub_cell_line_alternative (cellline_id, name) values (695, 'SK');	insert into pub_cell_line_alternative (cellline_id, name) values (695, 'NSH');				
insert into pub_cell_line_alternative (cellline_id, name) values (696, 'SK');	insert into pub_cell_line_alternative (cellline_id, name) values (696, 'NEP');				
insert into pub_cell_line_alternative (cellline_id, name) values (697, 'SK');	insert into pub_cell_line_alternative (cellline_id, name) values (697, 'OV3');				
insert into pub_cell_line_alternative (cellline_id, name) values (698, 'SK');	insert into pub_cell_line_alternative (cellline_id, name) values (698, 'PNDW');				
insert into pub_cell_line_alternative (cellline_id, name) values (699, 'SK');	insert into pub_cell_line_alternative (cellline_id, name) values (699, 'UT1B');				
insert into pub_cell_line_alternative (cellline_id, name) values (700, 'SP1K');					
insert into pub_cell_line_alternative (cellline_id, name) values (701, 'SP2');	insert into pub_cell_line_alternative (cellline_id, name) values (701, 'AG14');				
					
					
					
					
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (709, 'SR');	insert into pub_cell_line_alternative (cellline_id, name) values (709, '4987');				
insert into pub_cell_line_alternative (cellline_id, name) values (710, 'ST');					
insert into pub_cell_line_alternative (cellline_id, name) values (711, 'STO');					
insert into pub_cell_line_alternative (cellline_id, name) values (712, 'SUP');	insert into pub_cell_line_alternative (cellline_id, name) values (712, 'SUPT1');	insert into pub_cell_line_alternative (cellline_id, name) values (712, 'SUP-T1');			
insert into pub_cell_line_alternative (cellline_id, name) values (713, 'SVT2');	insert into pub_cell_line_alternative (cellline_id, name) values (713, 'SV-T2');				
insert into pub_cell_line_alternative (cellline_id, name) values (714, 'SW-1116');	insert into pub_cell_line_alternative (cellline_id, name) values (714, 'SW1116');	insert into pub_cell_line_alternative (cellline_id, name) values (714, '1116');			
insert into pub_cell_line_alternative (cellline_id, name) values (715, 'SW13');	insert into pub_cell_line_alternative (cellline_id, name) values (715, 'SW-13');				
insert into pub_cell_line_alternative (cellline_id, name) values (716, 'SW');	insert into pub_cell_line_alternative (cellline_id, name) values (716, '1417');	insert into pub_cell_line_alternative (cellline_id, name) values (716, 'SW1417');			
insert into pub_cell_line_alternative (cellline_id, name) values (717, 'SW');	insert into pub_cell_line_alternative (cellline_id, name) values (717, '1463');	insert into pub_cell_line_alternative (cellline_id, name) values (717, 'SW1463');			
insert into pub_cell_line_alternative (cellline_id, name) values (718, 'SW');	insert into pub_cell_line_alternative (cellline_id, name) values (718, '403');	insert into pub_cell_line_alternative (cellline_id, name) values (718, 'SW403');			
insert into pub_cell_line_alternative (cellline_id, name) values (719, 'SW');	insert into pub_cell_line_alternative (cellline_id, name) values (719, '48');	insert into pub_cell_line_alternative (cellline_id, name) values (719, 'SW48');			
insert into pub_cell_line_alternative (cellline_id, name) values (720, 'SW');	insert into pub_cell_line_alternative (cellline_id, name) values (720, '480');	insert into pub_cell_line_alternative (cellline_id, name) values (720, 'SW480');			
insert into pub_cell_line_alternative (cellline_id, name) values (721, 'SW');	insert into pub_cell_line_alternative (cellline_id, name) values (721, '620');	insert into pub_cell_line_alternative (cellline_id, name) values (721, 'SW620');			
insert into pub_cell_line_alternative (cellline_id, name) values (722, 'SW');	insert into pub_cell_line_alternative (cellline_id, name) values (722, '837');	insert into pub_cell_line_alternative (cellline_id, name) values (722, 'SW837');			
insert into pub_cell_line_alternative (cellline_id, name) values (723, 'SW');	insert into pub_cell_line_alternative (cellline_id, name) values (723, '948');	insert into pub_cell_line_alternative (cellline_id, name) values (723, 'SW948');			
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (727, 'T-24');	insert into pub_cell_line_alternative (cellline_id, name) values (727, 'T24');				
insert into pub_cell_line_alternative (cellline_id, name) values (728, 'T98G');	insert into pub_cell_line_alternative (cellline_id, name) values (728, 'T98');	insert into pub_cell_line_alternative (cellline_id, name) values (728, 'T-98-G');			
insert into pub_cell_line_alternative (cellline_id, name) values (729, 'T-47D');	insert into pub_cell_line_alternative (cellline_id, name) values (729, 'T47D');	insert into pub_cell_line_alternative (cellline_id, name) values (729, '47D');			
insert into pub_cell_line_alternative (cellline_id, name) values (730, 'VSMC');	insert into pub_cell_line_alternative (cellline_id, name) values (730, 'HA-VSMC');				
insert into pub_cell_line_alternative (cellline_id, name) values (731, 'T24-83');	insert into pub_cell_line_alternative (cellline_id, name) values (731, 'T2483');				
insert into pub_cell_line_alternative (cellline_id, name) values (732, 'T47D');	insert into pub_cell_line_alternative (cellline_id, name) values (732, 'T-47D');	insert into pub_cell_line_alternative (cellline_id, name) values (732, '47D');			
insert into pub_cell_line_alternative (cellline_id, name) values (733, 'T84');					
insert into pub_cell_line_alternative (cellline_id, name) values (734, 'T98G');	insert into pub_cell_line_alternative (cellline_id, name) values (734, 'T-98G');	insert into pub_cell_line_alternative (cellline_id, name) values (734, 'T98-G');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (736, 'TB1LU');	insert into pub_cell_line_alternative (cellline_id, name) values (736, 'TB-1-LU');	insert into pub_cell_line_alternative (cellline_id, name) values (736, '1LU');	insert into pub_cell_line_alternative (cellline_id, name) values (736, 'TB1');		
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (739, 'TCMK');	insert into pub_cell_line_alternative (cellline_id, name) values (739, 'TCMK-1');	insert into pub_cell_line_alternative (cellline_id, name) values (739, 'TCMK1');			
insert into pub_cell_line_alternative (cellline_id, name) values (740, 'TE671');					
insert into pub_cell_line_alternative (cellline_id, name) values (741, 'TGP');	insert into pub_cell_line_alternative (cellline_id, name) values (741, 'TGP-49');	insert into pub_cell_line_alternative (cellline_id, name) values (741, 'TGP49');			
insert into pub_cell_line_alternative (cellline_id, name) values (742, 'TGP');	insert into pub_cell_line_alternative (cellline_id, name) values (742, 'TGP-52');	insert into pub_cell_line_alternative (cellline_id, name) values (742, 'TGP52');			
insert into pub_cell_line_alternative (cellline_id, name) values (743, 'TGP');	insert into pub_cell_line_alternative (cellline_id, name) values (743, 'TGP-55');	insert into pub_cell_line_alternative (cellline_id, name) values (743, 'TGP55');			
insert into pub_cell_line_alternative (cellline_id, name) values (744, 'TH1');	insert into pub_cell_line_alternative (cellline_id, name) values (744, 'TH-1');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (746, 'THP');	insert into pub_cell_line_alternative (cellline_id, name) values (746, 'THP1');	insert into pub_cell_line_alternative (cellline_id, name) values (746, 'THP-1');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (748, 'TKTS');	insert into pub_cell_line_alternative (cellline_id, name) values (748, 'TKTS13');	insert into pub_cell_line_alternative (cellline_id, name) values (748, 'TKTS-13');			
					
insert into pub_cell_line_alternative (cellline_id, name) values (750, 'TK6');	insert into pub_cell_line_alternative (cellline_id, name) values (750, 'TK-6');				
insert into pub_cell_line_alternative (cellline_id, name) values (751, 'TM3');	insert into pub_cell_line_alternative (cellline_id, name) values (751, 'TM-3');				
insert into pub_cell_line_alternative (cellline_id, name) values (752, 'TM4');	insert into pub_cell_line_alternative (cellline_id, name) values (752, 'TM-4');				
insert into pub_cell_line_alternative (cellline_id, name) values (753, 'TRA');	insert into pub_cell_line_alternative (cellline_id, name) values (753, 'TRA-171');	insert into pub_cell_line_alternative (cellline_id, name) values (753, 'TRA171');	insert into pub_cell_line_alternative (cellline_id, name) values (753, '171');		
insert into pub_cell_line_alternative (cellline_id, name) values (754, 'TT');					
insert into pub_cell_line_alternative (cellline_id, name) values (755, 'U-937');	insert into pub_cell_line_alternative (cellline_id, name) values (755, 'U937');	insert into pub_cell_line_alternative (cellline_id, name) values (755, '937');			
insert into pub_cell_line_alternative (cellline_id, name) values (756, 'U138');	insert into pub_cell_line_alternative (cellline_id, name) values (756, 'U138MG');	insert into pub_cell_line_alternative (cellline_id, name) values (756, 'MG');	insert into pub_cell_line_alternative (cellline_id, name) values (756, '138MG');		
insert into pub_cell_line_alternative (cellline_id, name) values (757, 'U2OS');	insert into pub_cell_line_alternative (cellline_id, name) values (757, 'U2-OS');				
insert into pub_cell_line_alternative (cellline_id, name) values (758, 'U266');	insert into pub_cell_line_alternative (cellline_id, name) values (758, 'U-266');				
insert into pub_cell_line_alternative (cellline_id, name) values (759, 'U373');	insert into pub_cell_line_alternative (cellline_id, name) values (759, 'U-373');				
insert into pub_cell_line_alternative (cellline_id, name) values (760, 'U87');	insert into pub_cell_line_alternative (cellline_id, name) values (760, 'U-87');				
insert into pub_cell_line_alternative (cellline_id, name) values (761, 'U937');	insert into pub_cell_line_alternative (cellline_id, name) values (761, 'U-937');				
insert into pub_cell_line_alternative (cellline_id, name) values (762, 'U266-B1');	insert into pub_cell_line_alternative (cellline_id, name) values (762, 'U266B1');				
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (765, 'UMR');	insert into pub_cell_line_alternative (cellline_id, name) values (765, 'UMR-106');	insert into pub_cell_line_alternative (cellline_id, name) values (765, 'UMR196');			
insert into pub_cell_line_alternative (cellline_id, name) values (766, 'UMR');	insert into pub_cell_line_alternative (cellline_id, name) values (766, 'UMR-108');	insert into pub_cell_line_alternative (cellline_id, name) values (766, 'UMR108');			
insert into pub_cell_line_alternative (cellline_id, name) values (767, 'UT1');	insert into pub_cell_line_alternative (cellline_id, name) values (767, 'UT-1');				
insert into pub_cell_line_alternative (cellline_id, name) values (768, 'V79');	insert into pub_cell_line_alternative (cellline_id, name) values (768, 'V79-4');				
insert into pub_cell_line_alternative (cellline_id, name) values (769, 'VA');	insert into pub_cell_line_alternative (cellline_id, name) values (769, 'VA-ES-BJ');				
insert into pub_cell_line_alternative (cellline_id, name) values (770, 'VERO');					
					
					
					
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (777, 'VH2');					
insert into pub_cell_line_alternative (cellline_id, name) values (778, 'VX2');					
insert into pub_cell_line_alternative (cellline_id, name) values (779, 'WEHI');					
					
					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (784, 'WERI');					
insert into pub_cell_line_alternative (cellline_id, name) values (785, 'WES');					
insert into pub_cell_line_alternative (cellline_id, name) values (786, 'WGD5');					
insert into pub_cell_line_alternative (cellline_id, name) values (787, 'WI');					
insert into pub_cell_line_alternative (cellline_id, name) values (788, 'WI');					
insert into pub_cell_line_alternative (cellline_id, name) values (789, 'WI');					
insert into pub_cell_line_alternative (cellline_id, name) values (790, 'WI');					
insert into pub_cell_line_alternative (cellline_id, name) values (791, 'WI');					
insert into pub_cell_line_alternative (cellline_id, name) values (792, 'WI');					
insert into pub_cell_line_alternative (cellline_id, name) values (793, 'WI');					
insert into pub_cell_line_alternative (cellline_id, name) values (794, 'WI');					
insert into pub_cell_line_alternative (cellline_id, name) values (795, 'WI');					
insert into pub_cell_line_alternative (cellline_id, name) values (796, 'WIDR');					
insert into pub_cell_line_alternative (cellline_id, name) values (797, 'WIL2');	insert into pub_cell_line_alternative (cellline_id, name) values (797, 'WIL2-NS');				
insert into pub_cell_line_alternative (cellline_id, name) values (798, 'WISH');					
insert into pub_cell_line_alternative (cellline_id, name) values (799, 'WM');	insert into pub_cell_line_alternative (cellline_id, name) values (799, 'WM155');				
insert into pub_cell_line_alternative (cellline_id, name) values (800, 'WM');	insert into pub_cell_line_alternative (cellline_id, name) values (800, 'WM266-4');	insert into pub_cell_line_alternative (cellline_id, name) values (800, 'WM266');	insert into pub_cell_line_alternative (cellline_id, name) values (800, 'WM-266');		
insert into pub_cell_line_alternative (cellline_id, name) values (801, 'WM');	insert into pub_cell_line_alternative (cellline_id, name) values (801, 'WM115');	insert into pub_cell_line_alternative (cellline_id, name) values (801, 'WM-155');			
insert into pub_cell_line_alternative (cellline_id, name) values (802, 'WRL');	insert into pub_cell_line_alternative (cellline_id, name) values (802, 'WRL68');	insert into pub_cell_line_alternative (cellline_id, name) values (802, 'WRL-68');			
insert into pub_cell_line_alternative (cellline_id, name) values (803, 'WS1');					
insert into pub_cell_line_alternative (cellline_id, name) values (804, 'X63AG8');	insert into pub_cell_line_alternative (cellline_id, name) values (804, '653');	insert into pub_cell_line_alternative (cellline_id, name) values (804, 'W63');			
insert into pub_cell_line_alternative (cellline_id, name) values (805, 'XC');					
insert into pub_cell_line_alternative (cellline_id, name) values (806, 'Y1');					
					
insert into pub_cell_line_alternative (cellline_id, name) values (808, 'Y79');	insert into pub_cell_line_alternative (cellline_id, name) values (808, 'Y-79');				
					
insert into pub_cell_line_alternative (cellline_id, name) values (810, 'Y3');					
					
					
insert into pub_cell_line_alternative (cellline_id, name) values (813, 'YAC-1');	insert into pub_cell_line_alternative (cellline_id, name) values (813, 'YAC');				
insert into pub_cell_line_alternative (cellline_id, name) values (814, 'YO');					
insert into pub_cell_line_alternative (cellline_id, name) values (815, 'ZR');	insert into pub_cell_line_alternative (cellline_id, name) values (815, 'ZR-75-1');	insert into pub_cell_line_alternative (cellline_id, name) values (815, 'ZR75');			
insert into pub_cell_line_alternative (cellline_id, name) values (816, 'ZR');	insert into pub_cell_line_alternative (cellline_id, name) values (816, 'ZR-75-30');	insert into pub_cell_line_alternative (cellline_id, name) values (816, 'ZR75');			
