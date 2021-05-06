USE cb;

CREATE OR REPLACE VIEW socket_match AS
	SELECT prebuilt_name, part_name
    FROM prebuilts pb
		JOIN parts_required preq
			ON pb.prebuilt_id = preq.prebuilt_id
		JOIN parts p
			ON preq.part_id = p.part_id
	WHERE pb.prebuilt_name LIKE "hyper gamer max" AND p.part_name LIKE "%Intel%";

SELECT * FROM socket_match