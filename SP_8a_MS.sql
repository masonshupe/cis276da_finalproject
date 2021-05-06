USE cb;

DROP FUNCTION IF EXISTS get_customer_phone;

DELIMITER //

CREATE FUNCTION get_customer_phone
(
	order_num_param	INT
)
RETURNS VARCHAR(15)
BEGIN
	DECLARE customer_phone_var VARCHAR(15);
    
    SELECT customer_phone
    INTO customer_phone_var
    FROM orders
    WHERE order_num = order_num_param;
    
    RETURN(customer_phone_var);
END//

SELECT CONCAT(customer_fn, ' ', customer_ln, ': ', customer_phone) AS info_by_order_num
FROM orders
WHERE customer_phone = get_customer_phone('27750')