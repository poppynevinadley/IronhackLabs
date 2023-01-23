Use bank;

#1. Get the id values of the first 5 clients from district_id with a value equals to 1. 
SHOW TABLES FROM bank;
SHOW FULL TABLES FROM bank;
SELECT * FROM bank.district;
SELECT client_id FROM client WHERE district_id = 1 LIMIT 5;

#2. In the client table, get an id value of the last client where the district_id equals to 72. 
SELECT client_id
FROM client 
WHERE district_id = 72 
ORDER BY client_id DESC LIMIT 1;

#3. Get the 3 lowest amounts in the loan table.                                 
SELECT * FROM bank.loan;                                                   
SELECT * FROM bank.loan ORDER BY amount ASC LIMIT 3;

#4. What are the possible values for status, ordered alphabetically in ascending order in the loan table? 
SELECT distinct status FROM bank.loan ORDER BY status;

#5. What is the loan_id of the highest payment received in the loan table?         
SELECT loan_id FROM loan
WHERE payments = (SELECT max(payments) FROM loan);

#6. What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount.                                             
SELECT * FROM loan ORDER BY account_id ASC LIMIT 5;

#7. What are the top 5 account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?
SELECT * FROM loan 
WHERE duration = 60
ORDER BY amount ASC LIMIT 5;

#8. What are the unique values of k_symbol in the order table?                                               - TO CHECK
#Note: There shouldn't be a table name order, since order is reserved from the ORDER BY clause. 
#You have to use backticks to escape the order table name.
SELECT DISTINCT k_symbol FROM 'order'; 

#9. In the order table, what are the order_ids of the client with the account_id 34?						  - TO CHECK
SELECT order_id 
FROM 'order'
WHERE account_id = 34;

#10. In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)? --STILL TO FINISH
SELECT account_id
FROM 'order'
WHERE order id = order_id 29540 and order_id 29560;

#11.In the order table, what are the individual amounts that were sent to (account_to) id 30067122? - -STILL TO FINISH
SELECT amount
FROM 'order'
WHERE order_id = id 30067122;

#12. In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in 
#chronological order, from newest to oldest.                                                                     -STILL TO FINISH
SELECT trans_id, date, type, amount
FROM trans account_id 793
ORDER BY ASC LIMIT 10;










