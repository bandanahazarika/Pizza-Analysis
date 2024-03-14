SELECT * FROM personal_project.pizza;
use personal_project;
# KPIs

# Total Revenue

select sum(total_price) as total_revenue from pizza;

# Average Order Value

select avg(total_price) as average_order_value from pizza;
select sum(total_price)/count(distinct(order_id)) as average_order_value from pizza;

# Total Pizza Sold

select sum(quantity) as total_pizza_sold from pizza;

# Total Order

select count(distinct(order_id)) as total_order from pizza;

# Average Pizza Per Order

select sum(quantity)/count(distinct(order_id)) as average_pizza_per_order from pizza;
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza;
select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct(order_id)) as decimal(10,2)) as decimal(10,2))
 as average_pizza_per_order from pizza;
 
# Analyze

# Daily Trends For Total Orders

select dayname(order_date) as order_day, count(distinct(order_id)) as total_orders from pizza
group by order_day;

# Monthly Trends For Orders

select monthname(order_date) as month_name, count(distinct(order_id)) as total_orders from pizza
group by month_name;

# Percent Of Sales By Pizza Category

select pizza_category, sum(total_price) as total_revenue,(sum(total_price)*100)/sum(sum(total_price)) over() as PCT from pizza
group by pizza_category;
select pizza_category, cast(sum(total_price) as decimal(10,2)) as total_revenue, cast(sum(total_price)*100/sum(sum(total_price)) 
over() as decimal(10,2)) as PCT from pizza
group by pizza_category;

# Percent Of Sales By Pizza Size

select pizza_size, sum(total_price) as total_revenue, sum(total_price*100)/sum(sum(total_price)) over() as PCT from pizza
group by  pizza_size;
select pizza_size, cast(sum(total_price) as decimal(10,2)) as total_revenue, cast(sum(total_price*100)/sum(sum(total_price))
over() as decimal(10,2)) as PCT from pizza
group by  pizza_size;

# Total Pizzas Sold By Pizza Category

select pizza_category, sum(quantity) as total_quantity_sold from pizza
where month(order_date) = 2 
group by pizza_category
order by total_quantity_sold desc;

# Top 5 Pizzas By Revenue

select pizza_name, sum(total_price) as total_revenue from pizza
group by pizza_name
order by total_revenue desc
limit 5;

# Bottom 5 Pizzas By Revenue

select pizza_name, sum(total_price) as total_revenue from pizza
group by pizza_name
order by total_revenue
limit 5;
select pizza_name, cast(sum(total_price) as float) as total_revenue from pizza
group by pizza_name
order by total_revenue
limit 5;

# Top 5 Pizzas By Quantity

select pizza_name, sum(quantity) as total_pizza_sold from pizza
group by pizza_name
order by total_pizza_sold desc
limit 5;

# Bottom 5 Pizzas By Quantity

select pizza_name, sum(quantity) as total_pizza_sold from pizza
group by pizza_name
order by total_pizza_sold
limit 5;

# Top 5 Pizzas By Total Orders

select pizza_name, count(distinct(order_id)) as total_orders from pizza
group by pizza_name
order by total_orders desc
limit 5;

# Bottom 5 Pizzas by Total Orders

select pizza_name, count(distinct(order_id)) as total_orders from pizza
group by pizza_name
order by total_orders 
limit 5;

