USE FoodOrderingSystem;

SELECT SUM(total_amount) AS total_platform_revenue FROM Orders;

SELECT f.item_name, f.category, 
       SUM(od.quantity) AS total_units_sold,
       SUM(od.quantity * f.price) AS total_revenue
FROM OrderDetails od
JOIN FoodItem f ON od.item_id = f.item_id
GROUP BY f.item_name, f.category
ORDER BY total_revenue DESC;

SELECT c.name AS customer_name, c.address, 
       SUM(o.total_amount) AS total_spent
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.address
ORDER BY total_spent DESC;

SELECT r.name AS restaurant_name, 
       ROUND(AVG(rv.rating), 1) AS avg_rating,
       COUNT(rv.review_id) AS total_reviews
FROM Restaurant r
LEFT JOIN Review rv ON r.restaurant_id = rv.restaurant_id
GROUP BY r.restaurant_id, r.name
ORDER BY avg_rating DESC;

SELECT d.name AS agent_name, 
       COUNT(o.order_id) AS total_orders_delivered
FROM DeliveryAgent d
LEFT JOIN Orders o ON d.agent_id = o.agent_id
GROUP BY d.agent_id, d.name
ORDER BY total_orders_delivered DESC;