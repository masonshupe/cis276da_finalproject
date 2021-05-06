USE cb;

DROP TRIGGER IF EXISTS correct_case_fn_ln;

DELIMITER //

CREATE TRIGGER correct_case_fn_ln
	BEFORE UPDATE ON orders
    FOR EACH ROW
BEGIN
	SET NEW.customer_fn = CONCAT(UPPER(LEFT(NEW.customer_fn, 1)), LOWER(SUBSTRING(NEW.customer_fn, 2, LENGTH(NEW.customer_fn))));
    SET NEW.customer_ln = CONCAT(UPPER(LEFT(NEW.customer_ln, 1)), LOWER(SUBSTRING(NEW.customer_ln, 2, LENGTH(NEW.customer_ln))));
END//

UPDATE orders
SET customer_fn = 'bOB', customer_ln = 'bobeRtINo'
WHERE order_id = '1'