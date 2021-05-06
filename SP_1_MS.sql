CREATE DATABASE IF NOT EXISTS cb;
USE cb;

CREATE TABLE parts
(
part_id			INT				NOT NULL	AUTO_INCREMENT,
part_upc		INT				NOT NULL,
part_price		DECIMAL(7,2)	NOT NULL,
part_name		VARCHAR(200)	NOT NULL,
part_quantity	INT				NOT NULL,
CONSTRAINT parts_pk 
	PRIMARY KEY(part_id)
);
CREATE TABLE prebuilts
(
prebuilt_id		INT				NOT NULL	AUTO_INCREMENT,
prebuilt_upc	INT				NOT NULL,
prebuilt_name	VARCHAR(200)	NOT NULL,
CONSTRAINT prebuilts_pk
	PRIMARY KEY(prebuilt_id)
);
CREATE TABLE parts_required
(
preq_id			INT				NOT NULL	AUTO_INCREMENT,
prebuilt_id		INT,
part_id			INT,
CONSTRAINT parts_required_pk
	PRIMARY KEY(preq_id),
CONSTRAINT preq_fk_prebuilts
	FOREIGN KEY(prebuilt_id) REFERENCES prebuilts(prebuilt_id),
CONSTRAINT preq_fk_parts
	FOREIGN KEY(part_id) REFERENCES parts(part_id)
);
CREATE TABLE orders
(
order_id		INT				NOT NULL	AUTO_INCREMENT,
customer_fn		VARCHAR(20)		NOT NULL,
customer_ln		VARCHAR(25)		NOT NULL,
customer_phone	VARCHAR(15)		NOT NULL,
order_num		INT				NOT NULL,
prebuilt_id		INT,
CONSTRAINT orders_pk
	PRIMARY KEY(order_id),
CONSTRAINT orders_fk_prebuilts
	FOREIGN KEY(prebuilt_id) REFERENCES prebuilts(prebuilt_id)
);
