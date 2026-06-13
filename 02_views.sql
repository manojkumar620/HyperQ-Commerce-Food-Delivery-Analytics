USE FoodOrderingSystem;

CREATE OR REPLACE VIEW vw_DeliveryPerformance AS
SELECT 
    d.name AS agent_name,
    COUNT(o.order_id) AS total_assigned_orders,
    SUM(CASE WHEN o.status = 'Pending' THEN 1 ELSE 0 END) AS pending_orders,
    SUM(CASE WHEN o.status = 'Delivered' THEN 1 ELSE 0 END) AS delivered_orders
FROM DeliveryAgent d
LEFT JOIN Orders o ON d.agent_id = o.agent_id
GROUP BY d.agent_id, d.name;

CREATE OR REPLACE VIEW vw_FinancialPerformance AS
SELECT 
    o.order_date,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS transaction_revenue,
    ROUND(AVG(o.total_amount), 2) AS average_order_value
FROM Orders o
GROUP BY o.order_date;