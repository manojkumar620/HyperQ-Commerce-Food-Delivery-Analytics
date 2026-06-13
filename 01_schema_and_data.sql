DROP DATABASE IF EXISTS FoodOrderingSystem;
CREATE DATABASE FoodOrderingSystem;
USE FoodOrderingSystem;

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE Restaurant (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE FoodItem (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(50),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id) ON DELETE CASCADE
);

CREATE TABLE DeliveryAgent (
    agent_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    agent_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (agent_id) REFERENCES DeliveryAgent(agent_id) ON DELETE CASCADE
);

CREATE TABLE OrderDetails (
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES FoodItem(item_id) ON DELETE CASCADE
);

CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comments VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id) ON DELETE CASCADE
);

CREATE TABLE Offer (
    offer_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    item_id INT NOT NULL,
    discount_percent DECIMAL(5,2) NOT NULL,
    valid_till DATE NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES FoodItem(item_id) ON DELETE CASCADE
);

INSERT INTO Customer (name, email, phone, address) VALUES
('Manojkumar', 'manojkumar@gmail.com', '9876543210', 'Ambur, Tamil Nadu'),
('Sandhiya', 'Sandhiya@gmail.com', '9876512345', 'Vellore, Tamil Nadu'),
('Rashmika', 'rashmika@gmail.com', '9876501234', 'Virajpet, Karnataka'),
('Vijay', 'vijay@gmail.com', '9876547890', 'Chennai, Tamil Nadu'),
('Silambarasan', 'silambarasan@gmail.com', '9876598765', 'Chennai, Tamil Nadu');