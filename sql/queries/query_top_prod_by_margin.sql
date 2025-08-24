-- Top Products by Profit Margin by Sub-Category
-- Which are the prdoducts with the best profit margin by Sub-Category?


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


-- Profit Margin by Category View
CREATE OR REPLACE VIEW v_product_profit_margin AS
SELECT 
    f.id_product,
    product_name AS product,
    subcategory,
    category,
    SUM(sales) AS sales,
    SUM(profit) AS profit,
    SUM(profit)/SUM(sales) AS profit_margin
FROM v_figures f
LEFT JOIN products p 
ON  f.id_product = p.id_product
GROUP BY 1,2,3,4;


-- Export Top Products by Profit Margin by Sub-Category
COPY(
    WITH max_profit_margin_products AS(
        SELECT
            *,
            MAX(profit_margin) OVER(PARTITION BY subcategory) AS max_pm
        FROM v_product_profit_margin
        ORDER BY max_pm
    )
    SELECT 
        category,
        subcategory,
        id_product,
        product,
        ROUND(profit_margin*100,2) AS profit_margin
    FROM max_profit_margin_products
    WHERE profit_margin = max_pm
    ORDER BY 1,2
)
TO 'C:\temp\global_store\queries\top_products_by_margin.csv'
WITH(
    FORMAT CSV,
    HEADER TRUE,
    ENCODING 'WIN1252'
);



