-- Which country generates the most revenue

select customer.Country, sum(sales.Revenue) as Total_revenue from `bq-learning-497909.retail_data.dim_customer` as customer
inner join `bq-learning-497909.retail_data.fact_sales` as sales ON
customer.CustomerID = sales.CustomerID
group by customer.Country
order by sum(sales.Revenue) desc

-- What are the top 10 best selling products by revenue?

select product.StockCode, product.Description ,sum(sales.Revenue) Total_Revenue from `bq-learning-497909.retail_data.dim_product` as product
inner join `bq-learning-497909.retail_data.fact_sales` as sales ON
product.StockCode = sales.StockCode
group by product.StockCode, product.Description
order by sum(sales.Revenue) desc
limit 10;

-- What is the total revenue per month?

select Order_date.month, Order_date.year, SUM(sales.Revenue) as Net_sales from `bq-learning-497909.retail_data.dim_date` as Order_date
inner join `bq-learning-497909.retail_data.fact_sales` as sales ON
Order_date.DateID = sales.DateID
group by Order_date.month, Order_date.year
order by Order_date.year, Order_date.month

-- Which day of the week has the highest total revenue?

select Order_date.day, SUM(sales.Revenue) as Net_sales from `bq-learning-497909.retail_data.dim_date` as Order_date
inner join `bq-learning-497909.retail_data.fact_sales` as sales ON
Order_date.DateID = sales.DateID
group by Order_date.day
order by SUM(sales.Revenue) desc