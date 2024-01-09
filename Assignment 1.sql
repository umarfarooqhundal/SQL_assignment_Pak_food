select*
from wfp_food_prices_pakistan;

-- Q1
select date, cmname, mktname, price
from wfp_food_prices_pakistan
where mktname in ('Quetta','Peshawar','Karachi')and  price <= 50;

-- Q2
select mktname as city, count(cmname) as no_of_observations
from wfp_food_prices_pakistan
group by mktname, cmname;

-- Q3
select count(distinct( mktname)) as number_of_distinct_cities
from wfp_food_prices_pakistan;

-- Q4
select distinct( mktname) as cities
from wfp_food_prices_pakistan;

-- Q5
select distinct( cmname) as commodity_names
from wfp_food_prices_pakistan;


-- Q6
select  mktname, avg(price) as Avg_price
from wfp_food_prices_pakistan
where cmname = 'Wheat flour - Retail'
group by mktname;

-- Q7
select mktname, cmname, avg(price) as Avg_price, max(price)as Maximum_price 
from  wfp_food_prices_pakistan
where mktname != 'Karachi' and cmname like '%Wheat%'
group by mktname, cmname
order by mktname;

-- Q8
select  mktname, avg(price) as Avg_prices
from wfp_food_prices_pakistan
where cmname  = 'Wheat Retail' 
group by mktname
having avg(price) < 30;

-- Q9
select mktid, mktname, price, 
case 
when price < 30 then 'low'
when price >250 then 'high'
else 'fair'
end as category_price 
from wfp_food_prices_pakistan;

-- Q10
select date, cmname, category, mktname, price, 
case 
WHEN mktname in ('Karachi','Lahore') THEN 'Big City'
WHEN mktname in ('Multan','Peshawar') THEN 'Medium-sized City'
else 'Small City'
end as city_category
FROM wfp_food_prices_pakistan;


-- Q11 
Select cmname, date, mktname, price, 
case 
when price < 100 then 'fair'
when price >= 100 and price <= 300 then 'unfair'
else 'speculative'
end as price_fairness
from wfp_food_prices_pakistan;

-- Q12. Left join applied on cmname

select p.date, p.cmname, p. price, p.category
from wfp_food_prices_pakistan as p 
left join commodity as c
on p.cmname = c.cmname;

-- Q12. Left join applied on category
select p.date, p.cmname, p. price, p.category
from wfp_food_prices_pakistan as p 
left join commodity as c
on p.category = c.category;


-- Q13 inner join on cmname 

select p.date, p.cmname, p. price, p.category
from wfp_food_prices_pakistan as p 
inner join commodity as c
on p.cmname = c.cmname;

-- Q13 inner join on category

select p.date, p.cmname, p. price, p.category
from wfp_food_prices_pakistan as p 
inner join commodity as c
on p.category = c.category;





