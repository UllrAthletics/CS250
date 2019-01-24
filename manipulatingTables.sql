SELECT *
FROM [dbo].[authors];


--give first name and phone
SELECT au_fname,phone
FROM [dbo].[authors];

-- give full name
SELECT au_fname+' '+au_lname as full_name
FROM [dbo].[authors];

/* query relationship between tables; find book/s an author wrote in the past
we need to join multiple tables to get this information */

SELECT a.[au_fname],a.[au_lname],t.[title_name]
FROM [dbo].[authors] as a
join [dbo].[title_authors] as ta on a.au_id = ta.au_id
join  [dbo].[titles] as t on t.title_id = ta.title_id


/* Only filter rows for authors that have last name = Hull */
SELECT a.[au_fname],a.[au_lname],t.[title_name]
FROM [dbo].[authors] as a
join [dbo].[title_authors] as ta on a.au_id = ta.au_id
join  [dbo].[titles] as t on t.title_id = ta.title_id
WHERE a.au_lname = 'Hull'


/* Find a total number of bookd each publisher published */
SELECT p.pub_id,p.pub_name,COUNT (t.title_name) as count_of_books
FROM [dbo].[publishers] as p
join [dbo].[titles] as t on p.pub_id = t.pub_id
GROUP BY  p.pub_id,p.pub_name 


/* Display all authors and books then sort author name in descending and then 
by title in ascending order */
SELECT a.[au_fname],a.[au_lname],t.[title_name]
FROM [dbo].[authors] as a
join [dbo].[title_authors] as ta on a.au_id = ta.au_id
join  [dbo].[titles] as t on t.title_id = ta.title_id
ORDER BY a.au_lname DESC, t.title_name ASC;


/* Provide the top 3 authors */
SELECT TOP(3) au_fname,phone
FROM [dbo].[authors];


/* Find the publishere with the most books published */
SELECT TOP(1) p.pub_id,p.pub_name,COUNT (t.title_name) as count_of_books
FROM [dbo].[publishers] as p
join [dbo].[titles] as t on p.pub_id = t.pub_id
GROUP BY  p.pub_id,p.pub_name 
ORDER BY count_of_books DESC;

--Find max book price
SELECT TOP(1) t.title_name, t.price
FROM [dbo].[titles] as t
ORDER BY t.price DESC;

--List book with the highest price for each publisher
Select p.pub_id,p.pub_name,MAX(t.price) as MAX_PRICE
FROM [dbo].[publishers] as p
join [dbo].[titles] as t on p.pub_id = t.pub_id
GROUP BY p.pub_id,p.pub_name


--give total amount of book price per publisher
Select p.pub_id,p.pub_name,SUM(t.price) as total_price
FROM [dbo].[publishers] as p
join [dbo].[titles] as t on p.pub_id = t.pub_id
GROUP BY p.pub_id,p.pub_name
ORDER BY total_price DESC;

--List all managers in the organizational structure that employee 'e06' reports to
