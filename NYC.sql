create database NewYorkCitiBike;
use NewYorkCitiBike

select*from [dbo].[NYCitiBikes]
---1.	What are the most popular pick-up locations across the city for Citi Bike rental?
select top 5 with ties* from (
select count ([Start Station Name])[count],[Start Station Name] from [dbo].[NYCitiBikes]
group by [Start Station Name]
) Z 
order by [count] desc

--2.	**How does the average trip duration vary across different age groups, and over time? **
select avg([Trip_Duration_in_min])[avg],[Age Groups],[Season] from [dbo].[NYCitiBikes]
group by [Season],[Age Groups]
order by [Age Groups]

select min([Trip_Duration_in_min])[min],max([Trip_Duration_in_min])[max],[Age Groups],[Season] from [dbo].[NYCitiBikes]
group by [Age Groups],[Season]
--3.	Which age group rents the most bikes?
select top 3 with ties* from (
select count ([Age Groups])[count],[Age Groups] from [dbo].[NYCitiBikes]
group by [Age Groups]
) Z 
order by [count] desc
----4.	**How does bike rental vary across the two user groups (one-time users vs long-term subscribers) on different days of the week? **

select count([User Type])[Subscriber_count],[Weekday] from [dbo].[NYCitiBikes]
where [User Type] = 'Subscriber'
group by [User Type],[Weekday]

select count([User Type])[One-time_count], [Weekday] from [dbo].[NYCitiBikes]
where [User Type]= 'One-time user'
group by [User Type],[Weekday]
--•	What’s the average age of Citi Bike users?
select avg([Age])[avg age] from [dbo].[NYCitiBikes]
--•	What’s the average trip duration for Citi Bike users?
select avg ([Trip_Duration_in_min])[avg trip duration] from [dbo].[NYCitiBikes]
--•	What were the shortest and longest trips taken by Citi Bike users?
select max([Trip_Duration_in_min])[max], min([Trip_Duration_in_min])[min] from [dbo].[NYCitiBikes]

--•	What are the most popular pick-up locations across the city for Citi Bike rental?
select count([Start Station Name])[SSname_count],[Start Station Name]  from [dbo].[NYCitiBikes]
group by [Start Station Name]
order by [SSname_count] desc

