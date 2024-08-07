use ecommerce;
-- creating sales_anlysis table that calculates the yearly total sale amount for each product for further analysis 
Create Table sales_anlysis(
SELECT * ,
    (sales_month_1 + sales_month_2 + sales_month_3 + sales_month_4 + sales_month_5 + 
     sales_month_6 + sales_month_7 + sales_month_8 + sales_month_9 + sales_month_10 + 
     sales_month_11 + sales_month_12) AS total_sales
FROM ecommerce_sales_analysis);

-- Top 10 selling product category 
Select
	category,
    Sum(total_sales) as total_yearly_sales
From sales_anlysis 
Group BY category 
Order BY total_yearly_sales DESC
Limit 10;

-- Checking the peak sales month for clothing category 
WITH clothing_sales AS (
    SELECT 
        'January' AS month, SUM(sales_month_1) AS total_sales FROM sales_anlysis WHERE category = 'clothing'
    UNION ALL
    SELECT 
        'February' AS month, SUM(sales_month_2) FROM sales_anlysis WHERE category = 'clothing'
    UNION ALL
    SELECT 
        'March' AS month, SUM(sales_month_3) FROM sales_anlysis WHERE category = 'clothing'
    UNION ALL
    SELECT 
        'April' AS month, SUM(sales_month_4) FROM sales_anlysis WHERE category = 'clothing'
    UNION ALL
    SELECT 
        'May' AS month, SUM(sales_month_5) FROM sales_anlysis WHERE category = 'clothing'
    UNION ALL
    SELECT 
        'June' AS month, SUM(sales_month_6) FROM sales_anlysis WHERE category = 'clothing'
    UNION ALL
    SELECT 
        'July' AS month, SUM(sales_month_7) FROM sales_anlysis WHERE category = 'clothing'
    UNION ALL
    SELECT 
        'August' AS month, SUM(sales_month_8) FROM sales_anlysis WHERE category = 'clothing'
    UNION ALL
    SELECT 
        'September' AS month, SUM(sales_month_9) FROM sales_anlysis WHERE category = 'clothing'
    UNION ALL
    SELECT 
        'October' AS month, SUM(sales_month_10) FROM sales_anlysis WHERE category = 'clothing'
    UNION ALL
    SELECT 
        'November' AS month, SUM(sales_month_11) FROM sales_anlysis WHERE category = 'clothing'
    UNION ALL
    SELECT 
        'December' AS month, SUM(sales_month_12) FROM sales_anlysis WHERE category = 'clothing'
)

SELECT 
    month, 
    total_sales
FROM clothing_sales
ORDER BY total_sales DESC
Limit 1;

-- Checking most sold product category for each month 
WITH monthly_sales AS (
    SELECT 
       category, 'January' AS month, SUM(sales_month_1) AS total_sales FROM sales_anlysis Group By category
    UNION ALL
    SELECT 
        category, 'February' AS month, SUM(sales_month_2) AS total_sales FROM sales_anlysis Group By category
    UNION ALL
    SELECT 
        category, 'March' AS month, SUM(sales_month_3)  AS total_sales FROM sales_anlysis Group By category
    UNION ALL
    SELECT 
        category, 'April' AS month, SUM(sales_month_4)  AS total_sales FROM sales_anlysis Group By category
    UNION ALL
    SELECT 
      category,  'May' AS month, SUM(sales_month_5)  AS total_sales FROM  sales_anlysis Group By category
    UNION ALL
    SELECT 
        category, 'June' AS month, SUM(sales_month_6)  AS total_sales FROM sales_anlysis Group By category
    UNION ALL
    SELECT 
        category, 'July' AS month, SUM(sales_month_7)  AS total_sales FROM sales_anlysis Group By category
    UNION ALL
    SELECT 
        category, 'August' AS month, SUM(sales_month_8)  AS total_sales FROM sales_anlysis Group By category
    UNION ALL
    SELECT 
        category, 'September' AS month, SUM(sales_month_9)  AS total_sales FROM sales_anlysis Group By category
    UNION ALL
    SELECT 
       category,  'October' AS month, SUM(sales_month_10)  AS total_sales FROM sales_anlysis Group By category
    UNION ALL
    SELECT 
        category, 'November' AS month, SUM(sales_month_11)  AS total_sales FROM sales_anlysis Group By category
    UNION ALL
    SELECT 
       category,  'December' AS month, SUM(sales_month_12)  AS total_sales FROM sales_anlysis Group By category
        ),

ranked_sales AS (
Select 
	category,
    month,
    total_sales,
    RANK() OVER (PARTITION BY month ORDER BY total_sales DESC) AS sales_rank
    FROM monthly_sales
)

select 
	category,
    month, 
    total_sales
FROM ranked_sales 
WHERE sales_rank=1
ORDER BY FIELD(month, 'January', 'February', 'March', 'April', 'May', 'June', 
                       'July', 'August', 'September', 'October', 'November', 'December');
                       
                       
-- Finding the products with highest sale but low review 
Select 
	product_id,
    product_name,
    category,
    total_sales,
    review_score,
    review_count
From sales_anlysis
Where review_score < 3
order by total_sales DESC;

-- Finding lowest review product in home and kitchen category 
Select 
	product_id,
    product_name,
    review_score,
    total_sales
From sales_anlysis
Where category='Home & kitchen' AND review_score < 3
ORDER BY review_score ASC
LIMIT 1;


