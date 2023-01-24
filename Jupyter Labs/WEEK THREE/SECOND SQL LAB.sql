Use bank;

#1. Get the id values of the first 5 clients from district_id with a value equals to 1. 
SHOW TABLES FROM bank;
SHOW FULL TABLES FROM bank;
SELECT 
    *
FROM
    bank.district;
SELECT 
    client_id
FROM
    client
WHERE
    district_id = 1
LIMIT 5;

SELECT 
    client_id
FROM
    client
WHERE
    district_id = 72
ORDER BY client_id DESC
LIMIT 1;

SELECT 
    *
FROM
    bank.loan;
SELECT 
    *
FROM
    bank.loan
ORDER BY amount ASC
LIMIT 3;

SELECT DISTINCT
    status
FROM
    bank.loan
ORDER BY status;

SELECT 
    loan_id
FROM
    loan
WHERE
    payments = (SELECT 
            MAX(payments)
        FROM
            loan);

SELECT 
    *
FROM
    loan
ORDER BY account_id ASC
LIMIT 5;

SELECT 
    *
FROM
    loan
WHERE
    duration = 60
ORDER BY amount ASC
LIMIT 5;

SELECT 
    *
FROM
    bank.order;
SELECT DISTINCT
    k_symbol
FROM
    bank.order
ORDER BY k_symbol;

SELECT 
    order_id
FROM
    bank.order
WHERE
    account_id = 34;

SELECT DISTINCT
    account_id
FROM
    bank.order
WHERE
    order_id BETWEEN 29540 AND 29560;SELECT 
    amount
FROM
    bank.order
WHERE
    account_to = 30067122;          #check whether have backticks                                  #strings need quotes

#12. In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in 
#chronological order, from newest to oldest.                                                                     -STILL TO FINISH
SELECT trans_id, date, type, amount FROM trans account_id 793
ORDER BY ASC LIMIT 10;

#13.
SELECT district_id, count(client_id) FROM client WHERE district_id <10 GROUP BY district_id
ORDER BY 

#17
SELECT date, duration, count(load_id) FROM loan WHERE date between 971201 AND 971231
GROUP BY date, duration GROUP BY date, duration; # some duplicates in there? 
#like is string comparison, makes sure same i believe 

#18.
SELECT 'account_id', 'type', SUM('amount') AS 'total_amount' 
FROM
'trans'
WHERE 'account_id' = 396
GROUP 












