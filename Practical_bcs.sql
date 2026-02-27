create database Practical_BCS ;

use Practical_BCS ;

--- Query 1 ---

select SubscriptionType,IsChurned,COUNT(*) as TotalCustomers from CustomerSubscriptions
group by SubscriptionType, IsChurned
order by SubscriptionType;

--- Query 2 ---

select SubscriptionType,Gender,avg(FeedbackScore) as AvgFeedback from CustomerSubscriptions
group by SubscriptionType, Gender
order by SubscriptionType, Gender;

--- Query 3 ---

select CustomerID , CustomerName  from CustomerSubscriptions
where TotalSessions < 5
and FeedbackScore < 5;

--- Query 4 ---

select * from CustomerSubscriptions
where LastLoginDate < CURRENT_DATE - INTERVAL 60 DAY;

--- Query 5 ---

--- Query 6 ---

select * from CustomerSubscriptions
order by SubscriptionDate asc
limit 10;

select
    case 
        when Age BETWEEN 18 AND 25 THEN '18-25'
        when Age BETWEEN 26 AND 35 THEN '26-35'
        when Age BETWEEN 36 AND 45 THEN '36-45'
        when Age BETWEEN 46 AND 60 THEN '46-60'
        else '60+'
    end as AgeGroup,
    count(*) AS TotalCustomers,
    sum(CASE WHEN IsChurned = 1 THEN 1 
    ELSE 0 END) AS ChurnedCustomers
from CustomerSubscriptions
group by AgeGroup
order by AgeGroup;

