---Total Sales---

select date(order_date) as ����, sum(sales) as Total_Sales from orders 
group by date(order_date)
order by 1;

---Total Profit---

select date(order_date) as ����, sum(profit) as Total_Profit from orders 
group by date(order_date)
order by 1;


---Profit Ratio---
select date(order_date) as ����, sum(profit)/sum(sales) as Profit_Ratio from orders 
group by date(order_date)
order by 1;

---Profit per Order---
select date(order_date) as ����,
sum(profit)/count(distinct order_id) as Profit_per_order from orders 
group by 1
order by 1;


---Sales per Customer---
select customer_id, customer_name, sum(sales) as sales_per_customer
from orders o 
group by 1,2
order by 3;

---Avg. Discount---
select date(order_date) as ����, avg(discount) as average_discount from orders
group by 1
order by 1;

---Monthly Sales by Segment---
select date_part('year', order_date) as ���, date_part('month', order_date) as �����, segment, sum(sales) as ������� from orders
group by 1,2,3
order by 1, 2;

---Monthly Sales by Product Category---
select date_part('year', order_date) as ���, date_part('month', order_date) as �����, category, sum(sales) as ������� from orders
group by 1,2,3
order by 1, 2;

---Sales and Profit by Customer---
select customer_id, customer_name, sum(sales) as �����_������, sum(profit) as �����_������� from orders o
group by 1,2
order by 3,4;

---Customer Ranking---
select customer_id, customer_name, sum(sales) as �����_������, sum(profit) as �����_������� from orders o
group by 1,2
order by 3,4;

---Sales per region---
select date(order_date) as ����, region, sum(sales) from orders
group by 1,2
order by 1,2;

---Sales per Manager---
select date_part('year', order_date) as ���, date_part('month', order_date) as �����, person, sum(sales) from
orders inner join people on orders.region=people.region
group by 1,2,3;