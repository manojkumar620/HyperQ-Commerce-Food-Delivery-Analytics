USE FoodOrderingSystem;

CREATE INDEX idx_customer_email ON Customer(email);
CREATE INDEX idx_customer_phone ON Customer(phone);
CREATE INDEX idx_fooditem_restaurant ON FoodItem(restaurant_id);
CREATE INDEX idx_orders_customer ON Orders(customer_id);