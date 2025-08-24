-- Top 5 Customers by Sales by Segment
-- Which are the top 5 customers by Sales by Segment?


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

-- Customer Rankings View
CREATE OR REPLACE VIEW v_customer_ranking AS
WITH
    customer_sales AS (
        SELECT
            f.id_customer,
            customer_name AS customer,
            segment,
            country,
            SUM(sales) AS sales
        FROM v_figures f
        LEFT JOIN customers c
        ON f.id_customer = c.id_customer
        LEFT JOIN cities ci
        ON f.id_city = ci.id_city
        GROUP BY 1,2,3,4
    )

SELECT
    *,
    DENSE_RANK() OVER(PARTITION BY segment ORDER BY sales DESC) AS sales_rank
FROM customer_sales


-- Export Top 5 Customers by Sales by Segment
COPY (
    SELECT 
        segment,
        sales_rank,
        id_customer,
        customer,
        country,
        ROUND(sales,0) AS sales
    FROM v_customer_ranking
    WHERE sales_rank <= 5
    ORDER BY 1, 2 ASC
)
TO 'C:\temp\global_store\queries\top_customers_by_sales.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    ENCODING 'WIN1252'
);




