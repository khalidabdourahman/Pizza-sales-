select * from pizza_sales;

/* Total revenua*/
SELECT 
    SUM(total_price) as Total_Revenua
FROM
    pizza_sales;

/* avaerage order value */
    
select 
	sum(total_price) / count(distinct(order_id)) as avarege_order_value
from
	pizza_sales;
    
/*Total pizza sold*/

select 
	sum(quantity) AS Tatal_pizza_sold
from
	pizza_sales;

/* Total order placed */

SELECT 
    COUNT(DISTINCT (order_id)) as Total_order
FROM
    pizza_sales;

/* Avarege pizza pre order */

select 
	cast(cast(sum(quantity) as decimal(10,2)) / 
    cast(count(distinct(order_id)) as decimal(10,2)) as decimal(10,2)) as avar_pizza_pre_order 
from 
	pizza_sales;

/* Daily trend */

select 
	DATENAME(DW, order_date) as order_day,
	COUNT(distinct(order_id)) as total_order
from 
	pizza_sales
group by 
	DATENAME(DW, order_date);

/* Hourly trend*/

select 
	DATEPART(HOUR, order_time)as order_hourly,
	COUNT(distinct(order_id)) as total_order
from 
	pizza_sales
group by 
	DATEPART(HOUR, order_time)
order by	
	DATEPART(HOUR, order_time)


/* precentgae pre catogray*/

select 
	pizza_category,
	SUM(total_price) * 100 /
	(select SUM(total_price) from pizza_sales) AS PCT
from 
	pizza_sales
group by 
	pizza_category

/* precentgae pre pizza zise*/

select 
	pizza_size,
	CAST(SUM(total_price) * 100 /
	(select SUM(total_price) from pizza_sales)AS decimal(10,2))  AS PCT
from 
	pizza_sales
group by 
	pizza_size
ORDER BY
	PCT desc;

/* total pizza sold pre catogary*/

select
	pizza_category, sum(quantity)
from
	pizza_sales
group by 
	pizza_category

/* top 5 best sallers*/

select 
	top 5 pizza_name,
	sum(quantity) as N_of_sales
from pizza_sales
group by 
	pizza_name
order by N_of_sales	desc