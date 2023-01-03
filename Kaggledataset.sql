use bootcamp;

select * from region;

-- 1. How many olympics games have been held?
use bootcamp

SELECT COUNT(distinct Games) as Total_Olympic_games  from  athlete_events;

-- Mention the total no of nations who participated in each olympics game?



WITH CTE_Numb as (
SELECT a.Games AS Game, ( r.Region) as number from athlete_events
 a
JOIN noc_regions r
ON
a.NOC= r.NOC
GROUP BY Games,Region)

SELECT Game, count (1) from CTE_Numb  group by Gam order by Game desc


-- 2. List down all Olympics games held so far.
SELECT  distinct Year, games, season, city from OLYMPIC_HISTORY
order by year

-- 3. Mention the total no of nations who participated in each olympics game?



WITH CTE_Numb as (
SELECT a.Games AS Game,  r.Region as 'number' from  athlete_events a
JOIN NOC_regions  r
ON
a.NOC= r.NOC
GROUP BY Games,Region)
 
SELECT Game,  count(game)  from CTE_numb  group by game order by 1;



    with cte_number as
        (select games, nr.region
        from athlete_events oh
        join noc_regions nr ON nr.noc = oh.noc
        group by games, nr.region)
    select games, count(1) as total_countries
    from cte_numb
    group by games
    order by games;

-- number from CTE_Numb  -- group by Gam order by Game desc

Error Code: 1064. You have an error in your SQL syntax; check the manual
 that corresponds to your MySQL server version for the right syntax to use near
 '.Region as number from  athlete_events a JOIN NOC_regions  r ON a.NOC= r.NOC GRO' at line 2

-- 4. Write a SQL query to return the Olympic Games which had the highest participating countries and the lowest participating countries.
WITH cte_Result as(
SELECT  Games ,COUNT(r.region) AS Countries FROM OLYMPIC_HISTORY a
join Region r ON a.NOC= r.NOC
GROUP BY Year, Games)

SELECT    MAX(Games) as highest_participating,MIN(Games) as lowest_Participating,  MAX(Countries) as Highest,
MIN(Countries) as Lowest from cte_Result 

-- 5. Which nation has participated in all of the olympic games?
use bootcamp;
WITH C1 as(
SELECT  count( DISTINCT Games) AS total_Olympic_Games from OLYMPIC_HISTORY),

C2 as(  SELECT   Distinct (Region) AS Country , Games as total_g FROM OLYMPIC_HISTORY o 
JOIN Region r ON r.NOC= o.NOC group by games, region), -- SELECT COUNT ( Distinct  Region ) as
 -- Countries from Region),

 C3 AS (

SELECT country,  count (Country) AS participation_counts from C2 group by  country )

SELECT * FROM C3 ORDER BY participation_counts DESC; 
-- JOIN C  ON  C.total_Olympic_Games = C3.participation_counts order by participation_counts desc

-- 6.Identify the sport which was played in all summer olympics.

WITH C1 as(
 SELECT   count(distinct Games) as total_summergames FROM OLYMPIC_HISTORY where Season = 'Summer'),

 C2 as(
 SELECT Distinct Sport, Games from OLYMPIC_HISTORY where Season= 'Summer'),

 C3 as(
 SELECT Sport,count(Games) as total_game from C2 group by sport)

 SELECT * FROM C3 
 JOIN C1 ON C1.total_summergames= C3.total_game  ORDER BY Sport
 
 
-- 7.Which Sports were just played only once in the olympics.
use bootcamp;

 with c1 as (
 select  count(sport) as freq , Games , sport from OLYMPIC_HISTORY group by sport, Games ),

c2 as(
 select   distinct( sport) as Sports, count( freq) as Number 
 from c1  group by  sport )

 select  Sports, Number from c2  where number = 1  order by sports


-- 8. Fetch the total no of sports played in each olympic games.

WITH C as(
 SELECT   count(distinct sport)  as total_games FROM OLYMPIC_HISTORY ) ,-- where Season = '"Summer"'),

 C2 as(
 SELECT Distinct Sport, Games from OLYMPIC_HISTORY ), 

 C3 as(
 SELECT Games , count(games)  as total_game from C2 group by  Games)

 SELECT * FROM C3 order by games 
 
 
 -- 9 





