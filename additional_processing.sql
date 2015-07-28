-- search result (polyclonal)
select * from scin_db.pub_tech_prod_result where sentence REGEXP CONCAT('([[:<:]]|^)', 'polyclonal', '([[:>:]]|$)');
-- search result (monoclonal)
select * from scin_db.pub_tech_prod_result where sentence REGEXP CONCAT('([[:<:]]|^)', 'monoclonal', '([[:>:]]|$)');
-- search result (number before word dilution)
select * from scin_db.pub_tech_prod_result where sentence REGEXP '[[:digit:]]+[[:space:]]dilution([[:>:]]|$)';


-- search cell line exists
select * from scin_db.pub_tech_prod_result rslt
inner join scin_db.pub_cell_line line
on rslt.sentence REGEXP CONCAT ('([[:space:]]|^)', line.name, '([[:space:]]|$)');