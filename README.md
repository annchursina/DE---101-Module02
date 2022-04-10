# DE---101-Module02
## Лабораторные работы по Модулю 2

 1. Файлы [orders.sql](https://github.com/annchursina/DE---101-Module02/blob/main/orders.sql), [people.sql](https://github.com/annchursina/DE---101-Module02/blob/main/people.sql), [returns.sql](https://github.com/annchursina/DE---101-Module02/blob/main/returns.sql) содержат скрипты для загрузки данных с трех листов с соответствующими названиями из файла [Sample_Superstore.xls](https://github.com/annchursina/DE---101-Module02/blob/main/Sample%20-%20Superstore%20%281%29.xls)
 2. Файл [metrics.sql](https://github.com/annchursina/DE---101-Module02/blob/main/metrics.sql)  содержит запросы для получения следующих метрик:
 
  **Overview (обзор ключевых метрик)**

-   Total Sales
-   Total Profit
-   Profit Ratio
-   Profit per Order
-   Sales per Customer
-   Avg. Discount
-   Monthly Sales by Segment ( табличка и график)
-   Monthly Sales by Product Category (табличка и график)

**Product Dashboard (Продуктовые метрики)**

-   Sales by Product Category over time (Продажи по категориям)

**Customer Analysis**

-   Sales and Profit by Customer
-   Customer Ranking
-   Sales per region


## Концептуальная модель данных для файла [Superstore.xls](https://github.com/annchursina/DE---101-Module02/blob/main/Sample%20-%20Superstore%20%281%29.xls)
![Концептуальная модель данных](https://github.com/annchursina/DE---101-Module02/blob/main/%D0%9A%D0%BE%D0%BD%D1%86%D0%B5%D0%BF%D1%82%D1%83%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F%20%D0%BC%D0%BE%D0%B4%D0%B5%D0%BB%D1%8C.PNG)

## Логическая модель данных для файла [Superstore.xls](https://github.com/annchursina/DE---101-Module02/blob/main/Sample%20-%20Superstore%20%281%29.xls)
![Логическая модель](https://github.com/annchursina/DE---101-Module02/blob/main/%D0%9B%D0%BE%D0%B3%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F%20%D0%BC%D0%BE%D0%B4%D0%B5%D0%BB%D1%8C.PNG)

## Физическая модель данных для файла [Superstore.xls](https://github.com/annchursina/DE---101-Module02/blob/main/Sample%20-%20Superstore%20%281%29.xls)
![Физическая модель](https://github.com/annchursina/DE---101-Module02/blob/main/%D0%A4%D0%B8%D0%B7%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F%20%D0%BC%D0%BE%D0%B4%D0%B5%D0%BB%D1%8C.PNG)

## В файле [sales_fact.sql](https://github.com/annchursina/DE---101-Module02/blob/main/sales_fact.sql) содержится скрипт для создания главных таблиц (customer, calendar, geography, product) и зависимой таблицы sales_fact, а также скрипт для ее наполнения на основе данных из таблицы orders.

