-- Top 5 Products by Category (Sales vs Profit)
-- Are the top prducts by Sales the same as the top products by profit?


-- Sales & Profit Figures for 2023 S2 View
CREATE OR REPLACE VIEW v_figures AS
SELECT 
    id_row,
    order_date,
    id_customer,
    id_city,
    id_product,
    unit_price * (1 - COALESCE(discount,0)) * quantity AS sales,
    unit_price * (1 - COALESCE(discount,0)) * quantity - unit_cost * quantity AS profit
FROM orders
WHERE order_date BETWEEN '2023-07-01' AND '2023-12-31';


-- Product Rankings View
CREATE OR REPLACE VIEW v_product_rankings AS
WITH
    product_figures AS(
        SELECT 
            product_name AS product,
            category,
            ROUND(SUM(sales),0) AS sales,
            ROUND(SUM(profit),0) AS profit
        FROM v_figures f
        LEFT JOIN products p
        ON f.id_product = p.id_product
        GROUP BY 1,2
    )

SELECT
    *,
    RANK() OVER(PARTITION BY category ORDER BY sales DESC) AS sales_rank,
    RANK() OVER(PARTITION BY category ORDER BY profit DESC) AS profit_rank
FROM product_figures;


-- Export Top 3 Products by Sales by Category
COPY (
    SELECT
        category,
        sales_rank,
        product,
        sales
    FROM v_product_rankings
    WHERE sales_rank <= 3
    ORDER BY 1, 2 ASC
)
TO 'C:\temp\global_store\queries\top_products_by_sales.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    ENCODING 'WIN1252'
);


-- Export Top 3 Products by Profit by Category
COPY (
    SELECT
        category,
        profit_rank,
        product,
        profit
    FROM v_product_rankings
    WHERE profit_rank <= 3
    ORDER BY 1, 2 ASC
)
TO 'C:\temp\global_store\queries\top_products_by_profit.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    ENCODING 'WIN1252'
);
