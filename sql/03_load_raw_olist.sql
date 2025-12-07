-- sql/03_load_raw_olist.sql
-- Olist の生データ CSV を raw スキーマのテーブルにロードする


------------------------------------------------------------
-- 1. orders
------------------------------------------------------------

TRUNCATE TABLE raw.olist_orders;

COPY raw.olist_orders (
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
)
FROM '/data/olist/olist_orders_dataset.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

------------------------------------------------------------
-- 2. customers
------------------------------------------------------------

TRUNCATE TABLE raw.olist_customers;

COPY raw.olist_customers (
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
)
FROM '/data/olist/olist_customers_dataset.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

------------------------------------------------------------
-- 3. order_items
------------------------------------------------------------

TRUNCATE TABLE raw.olist_order_items;

COPY raw.olist_order_items (
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value
)
FROM '/data/olist/olist_order_items_dataset.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

------------------------------------------------------------
-- 4. order_payments
------------------------------------------------------------

TRUNCATE TABLE raw.olist_order_payments;

COPY raw.olist_order_payments (
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
)
FROM '/data/olist/olist_order_payments_dataset.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

------------------------------------------------------------
-- 5. products
------------------------------------------------------------

TRUNCATE TABLE raw.olist_products;

COPY raw.olist_products (
    product_id,
    product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
)
FROM '/data/olist/olist_products_dataset.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

------------------------------------------------------------
-- 6. sellers
------------------------------------------------------------

TRUNCATE TABLE raw.olist_sellers;

COPY raw.olist_sellers (
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
)
FROM '/data/olist/olist_sellers_dataset.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

