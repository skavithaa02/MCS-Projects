-- A) Table menu_item

--1. check null value in id column.
SELECT * FROM menu_item WHERE id IS NULL or id = '';
-- Result -  zero rows found.

--2. Check duplicate ids in the id column.
Select Id, COUNT(Id) as count_id FROM menu_item GROUP BY Id HAVING COUNT(Id) > 1;
-- Result - No Duplicate row was found.

--3. Check if there are any Integrity CV violation with dish table.
DELETE from menu_item WHERE dish_id  NOT IN(SELECT id from dish) and dish_id <>'';
-- Result - 3 rows deleted dish_id = 220797, 329183, 395403
-- menu_item id = 619133, 837354, 1047160

--4. Check if there are any ICV violation with menu page table
SELECT menu_page_id from menu_item WHERE menu_page_id NOT IN(SELECT id from menu_page) and menu_page_id <>'';
-- Result -  0 rows found.


-- B) Table menu

--1. check null value in id column.
SELECT * FROM menu WHERE id IS NULL or id = '';
-- Result -  zero rows found. No action needed.

--2. Check duplicate ids in the id column.
Select Id, COUNT(Id) as count_id FROM menu_item GROUP BY Id HAVING COUNT(Id) > 1;
-- Result - No Duplicate row was found.

-- 3. check count of menu rows where name is null and place is null.
SELECT * FROM menu where place IS NULL and name is null;
-- Result - 6202 rows found. Most of the rows dont have enough information and thus we can delete such rows.

--4. delete above rows as they are not useful
DELETE FROM menu where place IS NULL and name is null;
SELECT * FROM menu where place IS NULL and name is null;
-- Result - deleted all rows.

-- 5. check how many event rows have blank or null values
SELECT * FROM menu where event IS NULL;
-- Result - 3387 rows were retrieved. We will update such rows with text "NA".

-- 6. update above rows where event is null.
UPDATE menu
SET event = 'UNKNOWN'
WHERE event is null;

SELECT count(*) FROM menu where event IS NULL;
-- Result - 3387 rows were retrieved and updated.

-- 7. Check how many null name values are there in menu table.
SELECT * FROM menu where name IS NULL;
-- Result - 7558 rows retrieved.

-- 8. update the above name values to UNKNOWN.
UPDATE menu
SET name = 'UNKNOWN'
WHERE name is null;

SELECT count(*) FROM menu where name IS NULL;
-- Result - 7558 rows were updated.

-- 9. Check how many null place values are there in menu table.
SELECT * FROM menu where place IS NULL;
-- Result - 3195 rows retrieved.

-- 10. update the above place values to UNKNOWN.
UPDATE menu
SET place = 'UNKNOWN'
WHERE place is null;

SELECT count(*) FROM menu where place IS NULL;
-- Result - 3195 rows were updated.

-- 11. Check how many null place values are there in menu table.
SELECT * FROM menu where location IS NULL;
-- Result - 27 rows retrieved.

-- 12. update the above location values to UNKNOWN.
UPDATE menu
SET location = 'UNKNOWN'
WHERE location is null;

SELECT count(*) FROM menu where location IS NULL;
-- Result - 27 rows were updated.


-- C) Table - menu_pages
--Integrity Constraint Check :

--1) Criteria: id shouldn’t have dupliacte
SELECT id, COUNT(id) FROM menu_page
 GROUP BY id  HAVING COUNT(id) > 1;
--Resut : 0 Records
--Action : No action

--2) NULL Value Check: (for all clmns)
SELECT * FROM menu_page WHERE id IS NULL;
--Result : 0 Records
--Action : No action

--3) empty Value check and update: (for all clmns)

SELECT * FROM menu_page WHERE page_number is null;
-- Result - count——1202, Updating page numbers to 0.

-- update the above pages.
update menu_page set page_number = 0 where page_number is null;
-- Result - 1202 rows were updated.

-- update the above pages.
SELECT * FROM menu_page WHERE full_height=''
-- Result - count = 329. updating full_height to 0.

update menu_page set full_height = 0 where full_height = ''
-- 329 rows were updated.

SELECT * FROM menu_page WHERE full_width=''
-- Result - count = 329. updating full_width to 0.

update menu_page set full_width = 0 where full_width = ''
-- 329 rows were updated.

--4) Values negative  (for all integer clmns)
SELECT * FROM menu_page WHERE page_number<0
--Result : 0 Records
--Action : No action

--5)values min and max to check
SELECT max(full_width) FROM menu_page
--Result : 0 Records
--Action : No action

-- 6) foreign key reference
-- check menu_id reference

-- TODO: - we will update once we know the relationship



-- D) Table dish

-- 1. Query where time appeared is negative.
Select count(*) from dish where times_appeared < 0;
-- Result - 21 rows retrieved.

--2. Update the times_appeared to 0 if negative.
update dish set times_appeared = 0 where times_appeared < 0;
-- Result - updated 21 rows.

--3. Clean up first_appeared.
select id from dish where first_appeared<100 or first_appeared>2021;
-- Result - 55503 rows retrieved.

--4. update first_appeared.
update dish set first_appeared = ''  where first_appeared<100 or first_appeared>2021;
-- Result - 55503 rows updated.

--5. Clean up last_appeared.
select id from dish where last_appeared<100 or last_appeared>2021;
-- Result - 55500 rows were retrieved.

--6. update last_appeared.
update dish set last_appeared = ''  where last_appeared<100 or last_appeared>2021;
-- Result - 55500 rows were updated.

--7. Clean up lowest_price
select * from dish where lowest_price = '';
-- Result - 29100 rows retrieved.

-- 8. update lowest price to zero
update dish set lowest_price = 0 where lowest_price = '';
-- Result - 29100 rows updated.

-- 9. Clean up highest_price.
select * from dish where highest_price = '';
-- Result - 29100 rows retrieved.

-- 10. Update highest price.
update dish set highest_price = 0 where highest_price = '';
-- Result - 29100 rows updated.
