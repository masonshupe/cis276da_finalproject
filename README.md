# cis276da_finalproject
Computer building website database design with relevant queries

This is a project that I completed for my MySQL Database class at Scottsdale Community College (CIS276DA).
The attached PNG is a MySQL Workbench EER Model based on the computer builder database, "cb".
SP_1_MS.sql creates the database and its associated tables.

The database includes 4 tables: parts, prebuilts, parts_required, and orders
parts - tracks available parts inventory; primary key is part_id, includes product upc, price, name, and quantity in stock
prebuilts - tracks available prebuilt computers for sale, primary key is prebuilt_id, includes prebuilt upc and name
parts_required - linking table that tracks the parts needed for a particular prebuilt computer; primary key is preq_id, foreign keys are prebuilt_id and part_id
orders - tracks invoices for a specific customers ordered prebuilts; primary key is order_id, foreign key is prebuilt_id

