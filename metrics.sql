---Total Sales---

select date(order_date) as Дата, sum(sales) as Total_Sales from orders 
group by date(order_date)
order by 1;

---Total Profit---

select date(order_date) as Дата, sum(profit) as Total_Profit from orders 
group by date(order_date)
order by 1;


---Profit Ratio---
select date(order_date) as Дата, sum(profit)/sum(sales) as Profit_Ratio from orders 
group by date(order_date)
order by 1;

---Profit per Order---
select date(order_date) as Дата,
sum(profit)/count(distinct order_id) as Profit_per_order from orders 
group by 1
order by 1;


---Sales per Customer---
select customer_id, customer_name, sum(sales) as sales_per_customer
from orders o 
group by 1,2
order by 3;

---Avg. Discount---
select date(order_date) as Дата, avg(discount) as average_discount from orders
group by 1
order by 1;

---Monthly Sales by Segment---
select date_part('year', order_date) as Год, date_part('month', order_date) as Месяц, segment, sum(sales) as Продажи from orders
group by 1,2,3
order by 1, 2;

---Monthly Sales by Product Category---
select date_part('year', order_date) as Год, date_part('month', order_date) as Месяц, category, sum(sales) as Продажи from orders
group by 1,2,3
order by 1, 2;

---Sales and Profit by Customer---
select customer_id, customer_name, sum(sales) as Сумма_продаж, sum(profit) as Сумма_прибыли from orders o
group by 1,2
order by 3,4;

---Customer Ranking---
select customer_id, customer_name, sum(sales) as Сумма_продаж, sum(profit) as Сумма_прибыли from orders o
group by 1,2
order by 3,4;

---Sales per region---
select date(order_date) as Дата, region, sum(sales) from orders
group by 1,2
order by 1,2;

---Sales per Manager---
select date_part('year', order_date) as Год, date_part('month', order_date) as Месяц, person, sum(sales) from
orders inner join people on orders.region=people.region
group by 1,2,3;