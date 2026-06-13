USE FoodOrderingSystem;

DELIMITER $$

CREATE PROCEDURE sp_PlaceOrder(
    IN p_customer_id INT,
    IN p_agent_id INT,
    IN p_item_id INT,
    IN p_quantity INT,
    IN p_order_date DATE,
    IN p_status VARCHAR(20)
)
BEGIN
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_total_amount DECIMAL(10,2);
    DECLARE v_new_order_id INT;

    SELECT price INTO v_price FROM FoodItem WHERE item_id = p_item_id;

    SET v_total_amount = v_price * p_quantity;

    INSERT INTO Orders (customer_id, agent_id, order_date, total_amount, status)
    VALUES (p_customer_id, p_agent_id, p_order_date, v_total_amount, p_status);

    SET v_new_order_id = LAST_INSERT_ID();
    
    INSERT INTO OrderDetails (order_id, item_id, quantity)
    VALUES (v_new_order_id, p_item_id, p_quantity);

    SELECT CONCAT('Order Placed Successfully! Order ID: ', v_new_order_id) AS Message;
END$$

DELIMITER ;

CALL sp_PlaceOrder(1, 2, 1, 3, '2026-06-12', 'Pending');