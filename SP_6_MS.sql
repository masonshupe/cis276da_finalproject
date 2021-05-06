USE cb;

CREATE OR REPLACE VIEW prebuilt_cost AS
	SELECT prebuilt_name, SUM(part_price), MIN(part_price), MAX(part_price), AVG(part_price)
    FROM prebuilts pb
		JOIN parts_required preq
			ON pb.prebuilt_id = preq.prebuilt_id
		JOIN parts p
			ON preq.part_id = p.part_id
	GROUP BY preq.prebuilt_id;
    
SELECT * FROM prebuilt_cost