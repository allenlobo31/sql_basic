CREATE TABLE categories(
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE products(
    product_id SERIAL PRIMARY KEY,
    category_id INT NOT NULL REFERENCES categories(category_id),
    product_name VARCHAR(50) NOT NULL,
    price NUMERIC(10, 2) NOT NULL CHECK(price > 0),
    stock_quantity INT NOT NULL CHECK(stock_quantity >= 0),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    city VARCHAR(50),
    country VARCHAR(50) NOT NULL DEFAULT 'INDIA',
    signedup_date DATE NOT NULL DEFAULT CURRENT_DATE,
    loyalty_points INT NOT NULL DEFAULT 0,
    referred_by INT REFERENCES customers(customer_id)
);

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(customer_id),
    employee_id INT REFERENCES employees(employee_id),
    order_date DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'Pending' CHECK(status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled')),
    shipping_city VARCHAR(255),
    notes TEXT
);

CREATE TABLE order_items(
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id INT NOT NULL REFERENCES products(product_id),
    quantity INT NOT NULL CHECK(quantity > 0),
    unit_price NUMERIC(10, 2) NOT NULL CHECK(unit_price > 0)
);

CREATE TABLE payments(
    payment_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    payment_date DATE NOT NULL,
    amount NUMERIC(10, 2) NOT NULL CHECK(amount > 0),
    payment_method VARCHAR(20) NOT NULL CHECK(payment_method IN ('Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer', 'Cash')),
    status VARCHAR(20) NOT NULL DEFAULT 'Pending' CHECK(status IN ('success', 'refunded', 'failed'))
);



--DDL data definition language
CREATE TABLE mobile(
    mobile_id SERIAL PRIMARY KEY,
    mobile_name VARCHAR(100) NOT NULL UNIQUE
);

ALTER TABLE mobile
ADD COLUMN price NUMERIC(10, 2) NOT NULL CHECK(price > 0);

ALTER TABLE mobile
RENAME COLUMN mobile_name TO model_name;

ALTER TABLE mobile
DROP COLUMN price;

select * from mobile;



--DML data manipulation language

select * from categories;
select * from products;
select * from customers;
select * from employees;    
select * from orders;
select * from order_items;
select * from payments;



INSERT INTO categories (category_id, category_name) VALUES
    (1, 'Electronics'),
    (2, 'Home & Kitchen'),
    (3, 'Books'),
    (4, 'Clothing'),
    (5, 'Sports & Outdoors'),
    (6, 'Beauty & Personal Care');

select * from categories;

UPDATE categories 
SET category_name = 'Electronics & Gadgets' 
WHERE category_id = 1;

DELETE FROM categories 
WHERE category_id = 6;


