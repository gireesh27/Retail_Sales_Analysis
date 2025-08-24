-- Top 3 Cities by Market (Sales vs Profit)
-- Are the top cities by Sales the same as the top cities by profit?


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


-- Country Rankings View
CREATE OR REPLACE VIEW v_city_rankings AS
WITH
    city_figures AS(
        SELECT 
            city,
            country,
            market,
            ROUND(SUM(sales),0) AS sales,
            ROUND(SUM(profit),0) AS profit
        FROM v_figures f
        LEFT JOIN cities c
        ON f.id_city = c.id_city
        GROUP BY 1,2,3
    )

SELECT
    *,
    RANK() OVER(PARTITION BY market ORDER BY sales DESC) AS sales_rank,
    RANK() OVER(PARTITION BY market ORDER BY profit DESC) AS profit_rank
FROM city_figures;


-- Export Top 3 Cities by Sales by Market
COPY (
    SELECT
        market,
        sales_rank,
        city,
        country,
        sales
    FROM v_city_rankings
    WHERE sales_rank <= 3
    ORDER BY 1, 2 ASC
)
TO 'C:\temp\global_store\queries\top_cities_by_sales.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    ENCODING 'WIN1252'
);


-- Export Top 3 Cities by Profit by Market
COPY (
    SELECT
        market,
        profit_rank,
        city,
        country,
        profit
    FROM v_city_rankings
    WHERE profit_rank <= 3
    ORDER BY 1, 2 ASC
)
TO 'C:\temp\global_store\queries\top_cities_by_profit.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    ENCODING 'WIN1252'
);
