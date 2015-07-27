DROP TABLE scin_db.pub_figure_tech_result;
CREATE TABLE scin_db.pub_figure_tech_result
(
  id INT(11),
  figure_id INT(11),
  doc_figure_id INT(11),
  header VARCHAR(800),
  content LONGTEXT,
  url VARCHAR(200),
  doc_id INT(11),
  tech_id INT(11),
  technique_group VARCHAR(100),
  parental_name VARCHAR(100),
  alternative VARCHAR(100)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP PROCEDURE scin_db.pub_figure_technique;
CREATE PROCEDURE scin_db.pub_figure_technique()
BEGIN

DECLARE v_figure_id INT(11);
DECLARE v_doc_figure_id INT(11);
DECLARE v_header VARCHAR(800);
DECLARE v_content LONGTEXT;
DECLARE v_url VARCHAR(200);
DECLARE v_doc_id INT(11);

DECLARE v_tech_id INT(11);
DECLARE v_technique_group VARCHAR(100);
DECLARE v_parental_name VARCHAR(100);
DECLARE v_alternative VARCHAR(100);

DECLARE cur1_done BOOLEAN DEFAULT FALSE;
DECLARE cur2_done BOOLEAN DEFAULT FALSE;
DECLARE cur3_done BOOLEAN DEFAULT FALSE;

DECLARE cur1 CURSOR FOR 
    SELECT id, figure_id, header, content, url, doc_id FROM scin_db.scin_pub_figure;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET cur1_done = TRUE;

OPEN cur1;
cur1_loop: LOOP
FETCH FROM cur1 INTO v_figure_id, v_doc_figure_id, v_header, v_content, v_url, v_doc_id;
    
    IF cur1_done then
        CLOSE cur1;
        LEAVE cur1_loop;
    END IF;
    BLOCK2: BEGIN
    DECLARE cur2 CURSOR FOR 
        SELECT id, technique_group, parental_name, alternative FROM scin_db.pub_technique_list;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET cur2_done = TRUE;
    
    OPEN cur2;
    cur2_loop: LOOP
    FETCH FROM cur2 INTO v_tech_id, v_technique_group, v_parental_name, v_alternative;
    
      IF cur2_done then
        SET cur1_done = FALSE;
        CLOSE cur2;
        LEAVE cur2_loop;
      END IF;
      
      -- CHECK technique presence and insert all keywords
      IF EXISTS (SELECT 1
                FROM scin_db.scin_pub_figure
                WHERE id = v_figure_id
                AND CONTENT REGEXP CONCAT('([[:<:]]|^)', v_alternative, '([[:>:]]|$)')) THEN
        
         INSERT INTO scin_db.pub_figure_tech_result (figure_id, doc_figure_id, header, content, url, doc_id, tech_id, technique_group, parental_name, alternative)
           VALUES (v_figure_id, v_doc_figure_id, v_header, v_content, v_url, v_doc_id, v_tech_id, v_technique_group, v_parental_name, v_alternative)
           ;
      END IF;
        
      -- implement here supportive information check here
      /*  need to include si_id into the table
      IF EXISTS (SELECT 1
                FROM scin_db.scin_pub_support_info
                WHERE doc_id = v_doc_id
                AND header = CONCAT('S' ,v_doc_figure_id ,' Figure.')
                AND CONTENT LIKE CONCAT('%', v_alternative, '%')) THEN
                    
         INSERT INTO scin_db.pub_tech_prod_temp (figure_id, doc_figure_id, header, content, url, doc_id, tech_id, technique_group, parental_name, alternative)
            VALUES (v_figure_id, v_doc_figure_id, CONCAT('S' ,v_doc_figure_id ,' Figure.'), v_content, v_url, v_doc_id, v_tech_id, '', v_parental_name, v_alternative)
           ;
      END IF;
      */
    
    END LOOP cur2_loop;
    END BLOCK2;
    
    -- reset value
    SET cur2_done = FALSE;

END LOOP cur1_loop;

END;