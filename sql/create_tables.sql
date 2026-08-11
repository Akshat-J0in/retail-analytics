create table dim_customer(
	CustomerID varchar(20) primary key,
	Country varchar(100)
);

create table dim_product(
	StockCode varchar(20) primary key,
	Description varchar(255)
);

create table dim_date(
	DateID int primary key,
	InvoiceDate datetime,
	year int,
	month int,
	hour int,
	day varchar(20)
);

create table fact_sales(
	InvoiceNo varchar(20),
	CustomerID varchar(20) references dim_customer(CustomerID),
	StockCode varchar(20) references dim_product(StockCode),
	DateID int references dim_date(DateID),
	Quantity int,
	Price decimal(10,2),
	Revenue decimal(10,2)
)
select * from dim_customer;
select * from dim_product;
select * from dim_date;

