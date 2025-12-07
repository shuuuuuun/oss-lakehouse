-- orders
CREATE TABLE IF NOT EXISTS raw.olist_orders (
    order_id                       VARCHAR PRIMARY KEY,
    customer_id                    VARCHAR NOT NULL,
    order_status                   VARCHAR,
    order_purchase_timestamp       TIMESTAMP,
    order_approved_at              TIMESTAMP,
    order_delivered_carrier_date   TIMESTAMP,
    order_delivered_customer_date  TIMESTAMP,
    order_estimated_delivery_date  TIMESTAMP
);

-- customers
CREATE TABLE IF NOT EXISTS raw.olist_customers (
    customer_id              VARCHAR PRIMARY KEY,
    customer_unique_id       VARCHAR,
    customer_zip_code_prefix INTEGER,
    customer_city            VARCHAR,
    customer_state           VARCHAR(2)
);

-- order_items
CREATE TABLE IF NOT EXISTS raw.olist_order_items (
    order_id            VARCHAR,
    order_item_id       INTEGER,
    product_id          VARCHAR,
    seller_id           VARCHAR,
    shipping_limit_date TIMESTAMP,
    price               NUMERIC(10,2),
    freight_value       NUMERIC(10,2),
    PRIMARY KEY (order_id, order_item_id)
);

-- order_payments
CREATE TABLE IF NOT EXISTS raw.olist_order_payments (
    order_id            VARCHAR,
    payment_sequential  INTEGER,
    payment_type        VARCHAR,
    payment_installments INTEGER,
    payment_value       NUMERIC(10,2),
    PRIMARY KEY (order_id, payment_sequential)
);

-- products
CREATE TABLE IF NOT EXISTS raw.olist_products (
    product_id                  VARCHAR PRIMARY KEY,
    product_category_name       VARCHAR,
    product_name_lenght         INTEGER,
    product_description_lenght  INTEGER,
    product_photos_qty          INTEGER,
    product_weight_g            INTEGER,
    product_length_cm           INTEGER,
    product_height_cm           INTEGER,
    product_width_cm            INTEGER
);

-- sellers
CREATE TABLE IF NOT EXISTS raw.olist_sellers (
    seller_id              VARCHAR PRIMARY KEY,
    seller_zip_code_prefix INTEGER,
    seller_city            VARCHAR,
    seller_state           VARCHAR(2)
);
