-- create temp table
use scin_db;
create table pub_keyword_temp
(
  doc_id      INT(11),
  source      VARCHAR(20),         
  source_id   INT(11),
  keyword     VARCHAR(50),
  content     LONGTEXT
);

create table pub_keyword_results
(
  id          INT(11)  NOT NULL AUTO_INCREMENT,
  doc_id      INT(11),
  source      VARCHAR(20),         
  source_id   INT(11),
  keyword     VARCHAR(50),
  content     LONGTEXT,
  sentence    VARCHAR(2000),
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table pub_keyword_result_splits;
create table pub_keyword_result_splits
(
  id          INT(11) NOT NULL AUTO_INCREMENT,
  rslt_id     INT(11) NOT NULL,
  sentence    VARCHAR(2000),
  word        VARCHAR(20),
  PRIMARY KEY (id),
  CONSTRAINT `pub_keyword_result_splt_fk_1` FOREIGN KEY (`rslt_id`) REFERENCES `pub_keyword_results` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- insert result into target  (generalize it into stored procedure later)
INSERT INTO pub_keyword_temp (doc_id, source, source_id, keyword, content)
  SELECT id, 'TITLE', id, 'Hirudin', title  FROM scin_pub_meta WHERE title COLLATE UTF8_GENERAL_CI LIKE '%Hirudin%';
INSERT INTO pub_keyword_temp (doc_id, source, source_id, keyword, content)
  SELECT doc_id, 'DISCUSSION', id, 'Hirudin', content FROM scin_pub_discussion WHERE content COLLATE UTF8_GENERAL_CI LIKE '%Hirudin%';
INSERT INTO pub_keyword_temp (doc_id, source, source_id, keyword, content)
  SELECT doc_id, 'ABSTRACT', id, 'Hirudin', content FROM scin_pub_abstract  WHERE content COLLATE UTF8_GENERAL_CI LIKE '%Hirudin%';


/* python scripts 
1. write a script to further process content and extract into sentence (reference to current scripts)
2. write a script to split sentence into keywords
*/

-- test case
INSERT INTO pub_keyword_temp (doc_id, source, source_id, keyword, content)
VALUES (1, 'TITLE', 1, 'test', 'This is a test case');
INSERT INTO pub_keyword_temp (doc_id, source, source_id, keyword, content)
VALUES (2, 'TITLE', 2, 'TEST', 'This is a test case. This is test case2.');

select * from pub_keyword_temp;
select * from pub_keyword_results;
select * from pub_keyword_result_splits;
truncate table pub_keyword_temp;
truncate table pub_keyword_result_splits;
delete from pub_keyword_results;
alter table pub_keyword_results AUTO_INCREMENT = 1;


SELECT id as rslt_id FROM scin_db.pub_keyword_temp WHERE doc_id = 1 AND source_id = 1;