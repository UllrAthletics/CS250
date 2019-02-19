
-- CREATE VIEWS
SELECT *
FROM [dbo].[titles];


CREATE VIEW vw_author_titles
as
	SELECT A.au_fname,A.au_lname,T.title_name
	FROM [dbo].[titles] AS T
	JOIN [dbo].[title_authors] as TA ON T.title_id = TA.title_id
	JOIN [dbo].[authors] as A ON A.au_id = TA.au_id
GO

SELECT *
FROM vw_author_titles;

CREATE VIEW vw_publisherRoyaltiesbyTitle
as
	SELECT P.pub_name,T.title_name,R.royalty_rate
	FROM [dbo].[titles] as T
	JOIN [dbo].[royalties] as R on T.title_id = R.title_id
	JOIN [dbo].[publishers] as P on T.pub_id = P.pub_id
GO


--EMAIL QUESTIONS ABOUT MOVIES
SELECT *
FROM vw_publisherRoyaltiesbyTitle;

SELECT * 
FROM [dbo].[Movie];

SELECT *
FROM [dbo].[Rating];

SELECT *
FROM [dbo].[Reviewer];

SELECT *
FROM [dbo].[Movie] 
WHERE director = 'Steven Spielberg';

SELECT M.title,M.[year],R.stars
FROM [dbo].[Movie] AS M
JOIN [dbo].[Rating] AS R ON M.mID = R.mID
WHERE stars in (4,5)
ORDER BY M.[year] ASC;

----------------------------------------------------
SELECT *
FROM movie AS m
WHERE m.mID not in (SELECT mID FROM rating);

SELECT *
FROM movie AS m
LEFT JOIN rating AS r ON m.mID = r.mID
WHERE r.mID is null


SELECT RV.*,R.mID,R.stars
FROM [dbo].[Reviewer] AS RV
JOIN [dbo].[Rating] AS R ON RV.rID = R.rID
WHERE R.ratingDate is null;

--
SELECT ratingDate, format(ratingDate, 'MM-dd-yyyy') as ratingDate_formatted
FROM [dbo].[Rating];