USE FoodOrderingSystem;

INSERT INTO Restaurant (name, location, contact_number) VALUES
('Ambur Star Biryani', 'Ambur', '9123456789'),
('A2B Saravana Bhavan', 'Chennai', '9234567890'),
('Paradise Biryani', 'Virajpet', '9345678901');

INSERT INTO FoodItem (restaurant_id, item_name, price, category) VALUES
(1, 'Mutton Biryani', 320.00, 'Non-Veg'),
(1, 'Chicken 65', 180.00, 'Non-Veg'),
(2, 'Idli (2 Pcs)', 60.00, 'Veg'),
(2, 'Special Masala Dosa', 110.00, 'Veg'),
(3, 'Chicken Biryani', 250.00, 'Non-Veg');

INSERT INTO DeliveryAgent (name, phone) VALUES
('Ramesh Kumar', '8123456789'),
('Suresh Raina', '8234567890');

INSERT INTO Orders (customer_id, agent_id, order_date, total_amount, status) VALUES
(1, 1, '2026-06-10', 500.00, 'Delivered'),
(2, 2, '2026-06-11', 170.00, 'Delivered'),
(3, 1, '2026-06-12', 250.00, 'Pending'),
(4, 2, '2026-06-12', 320.00, 'Delivered');

INSERT INTO OrderDetails (order_id, item_id, quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1),
(2, 4, 1),
(3, 5, 1),
(4, 1, 1);

INSERT INTO Review (customer_id, restaurant_id, rating, comments) VALUES
(1, 1, 5, 'Awesome traditional taste!'),
(2, 2, 4, 'Good quality veg food.'),
(4, 1, 5, 'Biryani was top notch!');

INSERT INTO Offer (restaurant_id, item_id, discount_percent, valid_till) VALUES
(1, 1, 10.00, '2026-06-30'),
(2, 4, 15.00, '2026-06-25');