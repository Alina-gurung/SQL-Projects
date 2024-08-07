SQL Analysis of E-Commerce Sales Data

Objective
The goal of this project is to analyze e-commerce sales data to gain insights into sales performance, popular product categories, peak sales periods, and review metrics. This analysis provides valuable information for understanding sales patterns and making data-driven business decisions.

Analysis Objectives

1. Creating the sales_anlysis Table
Objective: Calculate the yearly total sales amount for each product for further analysis.
Key Techniques: Aggregation using SUM(), creating a new table with total sales.

2. Top 10 Selling Product Categories
Objective: Identify the top 10 selling product categories based on the total yearly sales.
Key Techniques: Aggregation with SUM(), grouping by category, and ordering by total sales.

3. Peak Sales Month for Clothing Category
Objective: Determine the peak sales month for the clothing category.
Key Techniques: Date grouping, aggregation with SUM(), ordering by sales.

4. Most Sold Product Category for Each Month
Objective: Identify the most sold product category for each month.
Key Techniques: Aggregation with SUM(), ranking with RANK(), using Common Table Expressions (CTEs).

5. Finding Products with Highest Sales but Low Reviews
Objective: Identify products with high sales but low review scores.
Key Techniques: Filtering with WHERE, ordering with ORDER BY.

6. Finding the Lowest Review Product in the Home & Kitchen Category
Objective: Identify the lowest review product in the Home & Kitchen category.
Key Techniques: Filtering with WHERE, ordering with ORDER BY, limiting results.
