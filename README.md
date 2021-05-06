# cis276da_finalproject
Computer building website database design with relevant views

This is a project that I completed for my MySQL Database class at Scottsdale Community College (CIS276DA).
The attached PNG is a MySQL Workbench EER Model based on the computer builder database, "cb".
SP_1_MS.sql creates the database and its associated tables.

The database includes 4 tables: parts, prebuilts, parts_required, and orders

parts - tracks available parts inventory; primary key is part_id, includes product upc, price, name, and quantity in stock

prebuilts - tracks available prebuilt computers for sale, primary key is prebuilt_id, includes prebuilt upc and name

parts_required - linking table that tracks the parts needed for a particular prebuilt computer; primary key is preq_id, foreign keys are prebuilt_id and part_id

orders - tracks invoices for a specific customers ordered prebuilts; primary key is order_id, foreign key is prebuilt_id

relationship between tables: parts has a many to many relationship with prebuilts and vice versa; prebuilts has a one to many relationship with orders

SP_4_MS (socket_match) - view that joins prebuilts on parts_required using prebuilt_id and joins on parts using part_id; filters parts where prebuilt name matches the given name and part name matches given cpu manufacturer to present a list of prebuilts that use either an Intel or AMD socket

SP_5_MS (customer_lookup) - view that joins orders on prebuilts using prebuilt_id, then joins on parts_required using prebuilt_id, then joins on parts using part_id to find all orders and their required parts; a subquery is used within the where clause to select only orders from "customer name"; the results displayed include the customer's name, phone number, order number, and their prebuilt computer and its required parts for assembly

SP_6_MS (prebuilt_cost) - view that joins prebuilts on parts_required using prebuilt_id, then joins on parts using part_id; the results are then grouped by prebuilt_id to show a list of all prebuilt computers and their respective total part price, highest cost part, lowest cost part, and average cost per part

SP_7_MS (is_affordable) - procedure that takes in a prebuilt_id and a price_limit and outputs yes or no depending on if the prebuilt_id passed falls within the            
                          price_limit; if the sum of the part_id's of prebuilt_id is greater than price_limit, the prebuilt is not affordable
                          
SP_8a_MS (get_customer_phone) - function that takes in an order_num and returns the associate phone number for the order; select customer_phone and place it into 
                                customer_phone_var (output) where the order_num matches the input order_num
                                
SP_9_MS (correct_case_fn_ln) - trigger that corrects the case of customer first name and last name before they are updated to orders table
