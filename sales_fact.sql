---создаем главные таблицы
drop table calendar cascade;
CREATE TABLE calendar
(
 date_date date NOT NULL,
 year     int NOT NULL,
 quarter  varchar(8) NOT NULL,
 month    int NOT NULL,
 week     int NOT NULL,
 weekday  int NOT NULL,
 CONSTRAINT PK_5 PRIMARY KEY ( date_date )
);

drop table customer cascade;
CREATE TABLE customer
(
 customer_id   serial NOT NULL,
 customer_name varchar(22) NOT NULL,
 segment       varchar(11) NOT NULL,
 CONSTRAINT PK_52 PRIMARY KEY ( customer_id )
);

drop table geography cascade;
CREATE TABLE geography
(
 postal_code int NOT NULL,
 country     varchar(13) NOT NULL,
 city        varchar(17) NOT NULL,
 "state"       varchar(20) NOT NULL,
 region      varchar(7) NOT NULL,
 CONSTRAINT PK_39 PRIMARY KEY ( postal_code )
);

drop table product cascade;
CREATE TABLE product
(
 product_id   serial NOT NULL,
 category     varchar(15) NOT NULL,
 subcategory  varchar(11) NOT NULL,
 product_name varchar(127) NOT NULL,
 CONSTRAINT PK_26 PRIMARY KEY ( product_id )
);

--создаем таблицу фактов

drop table sales_fact cascade;
CREATE TABLE sales_fact
(
 row_id       int NOT NULL,
 order_id     varchar(14) NOT NULL,
 customer_id  serial NOT NULL,
 postal_code  int NOT NULL,
 product_id   serial NOT NULL,
 date_date     date NOT NULL,
 sales_amount numeric(9,4) NOT NULL,
 profit       numeric(21,16) NOT NULL,
 quantity     int4 NOT NULL,
 discount     numeric(4,2) NOT NULL,
 ship_mode    varchar(14) NOT NULL,
 CONSTRAINT PK_17 PRIMARY KEY ( row_id ),
 CONSTRAINT FK_21 FOREIGN KEY ( date_date ) REFERENCES calendar ( date_date ),
 CONSTRAINT FK_33 FOREIGN KEY ( product_id ) REFERENCES product ( product_id ),
 CONSTRAINT FK_44 FOREIGN KEY ( postal_code ) REFERENCES geography ( postal_code ),
 CONSTRAINT FK_55 FOREIGN KEY ( customer_id ) REFERENCES customer ( customer_id )
);

CREATE INDEX FK_23 ON sales_fact
(
 date_date
);

CREATE INDEX FK_35 ON sales_fact
(
 product_id
);

CREATE INDEX FK_46 ON sales_fact
(
 postal_code
);

CREATE INDEX FK_57 ON sales_fact
(
 customer_id
);

-- заполняем таблицу customer
insert into customer (customer_name, segment)
(select distinct customer_name, segment from orders);
select * from customer;

--- вставляем уникальные почтовые индексы в таблицу geography
truncate geography;
insert into geography (postal_code, country, city, region, state)
select distinct postal_code, 0, 0, 0, 0 from orders where postal_code is not null;
select * from geography;

--- дополняем таблицу geography атрибутами полей страна, город, штат, регион из таблицы orders
update geography as g
set country=o.country, state=o.state, city=o.city, region=o.region from orders as o where g.postal_code=o.postal_code;
select * from geography;

--заполняем таблицу product
insert into product (category, subcategory, product_name)
select distinct category, subcategory, product_name from orders;
select * from product;


-- заполняем таблицу calendar
insert into calendar (date_date, year, quarter, month, week, weekday)
select distinct order_date, extract('year' from order_date), EXTRACT(QUARTER from order_date), extract('month' from order_date), EXTRACT(WEEK from order_date), extract(dow from order_date) from orders;
select * from calendar;

--- заполняем таблицу sales_fact
insert into sales_fact (row_id, order_id, customer_id, postal_code, product_id, date_date, sales_amount, profit, quantity, discount, ship_mode)
select row_id, order_id, 1, 42420, 1, order_date, sales, profit, quantity, discount, ship_mode from orders;
select * from sales_fact;

update sales_fact s
set customer_id=c.customer_id from
customer c inner join orders o on o.customer_name=c.customer_name
where s.order_id=o.order_id;

update sales_fact s
set postal_code=g.postal_code from
geography g inner join orders o on o.postal_code=g.postal_code
where s.order_id=o.order_id;

update sales_fact s
set product_id=p.product_id from
product p inner join orders o on o.product_name=p.product_name
where s.order_id=o.order_id;




