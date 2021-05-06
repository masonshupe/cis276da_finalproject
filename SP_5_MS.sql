USE cb;

CREATE OR REPLACE VIEW customer_lookup AS
	SELECT CONCAT(customer_fn, ' ', customer_ln, ':'), customer_phone, order_num, prebuilt_name, part_name
    FROM orders o
		JOIN prebuilts pb
			ON o.prebuilt_id = pb.prebuilt_id
		JOIN parts_required preq 
			ON pb.prebuilt_id = preq.prebuilt_id
		JOIN parts p
			ON preq.part_id = p.part_id
	WHERE order_id IN
		(
        SELECT order_id
        FROM orders
		WHERE customer_fn LIKE 'Bob' AND customer_ln LIKE 'Bobertino'
        );

SELECT * FROM customer_lookup