CREATE TABLE accounts (
    user_id serial PRIMARY KEY,
    username character varying(12),
    city character varying(128),
    transactions_completed integer,
    transactions_attempted integer,
    account_balance numeric(12,2)
);

INSERT INTO accounts (username, city, transactions_completed, transactions_attempted, account_balance) VALUES ('shawn', 'chicago', 5, 10, 355.80),
('cherise', 'minneapolis', 9, 9, 4000.00),
('larry', 'minneapolis', 3, 4, 77.01),
('dallas', 'new york', 6, 12, 0.99),
('anthony', 'chicago', 0, 0, 0.00),
('travis', 'miami', 1, 100, 500000.34),
('davey', 'chicago', 9, 99, 98.04),
('ora', 'phoenix', 88, 90, 3.33),
('grace', 'miami', 7, 9100, 34.78),
('hope', 'phoenix', 4, 10, 50.17);


--	1.	Get all users from Chicago.

SELECT a.username
FROM accounts a
WHERE a.city = 'chicago';


--	2.	Get all users with usernames that contain the letter a.

SELECT a.username
FROM accounts a
WHERE a.username ILIKE '%a%';

--	3.	The bank is giving a new customer bonus! Update all records with an account balance of 0.00 and a transactions_attempted of 0. Give them a new account balance of 10.00.

UPDATE accounts a
SET account_balance = 10.00
--SELECT *
--FROM accounts a 
WHERE a.transactions_attempted = 0 
	AND a.account_balance = 0;

--	4.	Select all users that have attempted 9 or more transactions.

SELECT a.username
FROM accounts a 
WHERE a.transactions_attempted > 9;

--	5.	Get the username and account balance of the 3 users with the highest balances, sort highest to lowest balance. NOTE: Research LIMIT

SELECT a.username, a.account_balance
FROM accounts a
ORDER BY a.account_balance desc
LIMIT 3;

--	6.	Get the username and account balance of the 3 users with the lowest balances, sort lowest to highest balance.

SELECT a.username, a.account_balance 
FROM accounts a 
ORDER BY a.account_balance 
LIMIT 3;

--	7.	Get all users with account balances that are more than $100.

SELECT a.username
FROM accounts a 
WHERE a.account_balance > 100;

--	8.	Add a new record.

INSERT INTO accounts(username, 
					city, 
					transactions_completed, 
					transactions_attempted, 
					account_balance)
VALUES ('paige', 
		'minneapolis', 
		1, 
		1, 
		10000000);

--	9.	The bank is losing money in Miami and Phoenix and needs to unload low transaction customers: Delete users that reside in miami OR phoenix and have completed fewer than 5 transactions.

DELETE 
--SELECT *
FROM accounts a 
WHERE (a.city = 'miami' OR a.city = 'phoenix')
	AND a.transactions_completed < 5;
	
