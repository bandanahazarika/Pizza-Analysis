SELECT * FROM personal_project.pizza_sales;
drop table pizza_sales;
use personal_project;
create table pizza (
pizza_id int,
order_id int,
pizza_name_id varchar(255),
quantity int,
order_date date,
order_time time,
unit_price float,
total_price float,
pizza_size varchar(2),
pizza_category varchar(15),
pizza_ingredients varchar(255),
pizza_name varchar(255)
);
