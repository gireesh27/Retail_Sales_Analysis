-- Import Tables

COPY products
FROM 'C:\temp\global_store\Products.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    ENCODING 'WIN1252'
);

COPY cities
FROM 'C:\temp\global_store\Cities.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    ENCODING 'WIN1252'
);

COPY customers
FROM 'C:\temp\global_store\Customers.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    ENCODING 'WIN1252'
);

COPY orders
FROM 'C:\temp\global_store\Orders.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    ENCODING 'WIN1252'
);