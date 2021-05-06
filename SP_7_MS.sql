USE cb;

DROP PROCEDURE IF EXISTS is_affordable;

DELIMITER //

CREATE PROCEDURE is_affordable
(
	IN	prebuilt_id_param	INT,
    IN	price_limit_param	DEC(9,2),
    OUT yes_no				VARCHAR(3)
)
BEGIN
    IF
    (
    SELECT SUM(part_price)
    FROM prebuilts pb
		JOIN parts_required preq
			ON pb.prebuilt_id = preq.prebuilt_id
		JOIN parts p
			ON preq.part_id = p.part_id
	WHERE pb.prebuilt_id = prebuilt_id_param
	GROUP BY preq.prebuilt_id
    ) > price_limit_param THEN
		SET yes_no = 'no';
	ELSE SET yes_no = 'yes';
    END IF;
END//

CALL is_affordable(1, 2300.00, @affordable);
CALL is_affordable(1, 2400.00, @affordable2);
SELECT @affordable AS is_affordable, @affordable2 AS is_affordable_2;