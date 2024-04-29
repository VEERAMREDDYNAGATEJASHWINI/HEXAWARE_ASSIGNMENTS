-- TASK1 --------------------------------------------------------------
create database HMBank;
use HMBank;

create table Customers(
	customer_id int primary key,
    first_name varchar(30),
	last_name varchar(30),
    DOB date,
	email varchar(100),
	phone_number varchar(20),
	address varchar(255)
);

create table Accounts(
	account_id int primary key,
    customer_id int,
    account_type  varchar(20),
    balance decimal(20,2),
	foreign key(customer_id) references Customers(customer_id)
);

create table Transactions(
	transaction_id int primary key,
    account_id int,
    transaction_type varchar(20),
    amount decimal(10,2),
    transaction_date date,
    foreign key(account_id) references Accounts(account_id)
);

-- 1. Insert at least 10 sample records into each of the following tables. 
insert into Customers(customer_id,first_name,last_name,DOB,email,phone_number,address)
values
(1, 'John', 'Doe', '1990-03-23','john.doe@gmail.com', '1234567890', '123 Main St'),
(2, 'Jane', 'Smith','1993-09-02', 'jane.smith@mail.com', '9876543210', '456 Elm St'),
(3, 'Alice', 'Johnson', '2000-11-07','alice.johnson@mail.com', '5551234567', '789 Oak St'),
(4, 'Bob', 'Williams', '1899-09-24','bob.williams@mail.com', '9876543210', '321 Pine St'),
(5, 'Emily', 'Brown', '2002-09-07','emily.brown@mail.com', '5559876543', '654 Maple St'),
(6, 'Jhansi','Lakshmi','2001-12-30','jhansilakshmi@gmail.com','9999888877','67 gandhi road'),
(7, 'Shankar','Dada','1999-04-19','shankardada@gmail.com','6574655623','45/3 rayachoty'),
(8, 'Kusuma','Anjali','2001-03-31','kusumanjali@gmail.com','1234509876','767 kt road'),
(9, 'Om','Parkash','2004-09-06','omprakash@gmail,com','9987654321','SKD Nagar'),
(10,'Garuda','Reddy','1970-01-31','garudareddy@gmail.com','8467767667','78/2 Tirupati');

select* from customers;
insert into Accounts(account_id,customer_id,account_type,balance)
values
(11,3,'savings',100000.00),
(12 ,2,'current' ,25399.59),
(13 ,8, 'zero_balance',20050.64),
(14,5,'zero_balance' , 3000.90),
(15,7 ,'savings',138000.00),
(16, 10 ,'current',324938.00),
(17, 6 ,'current',34567.50),
(18, 9 ,'savings',23000.49),
(19, 4 ,'savings',100000.70),
(20, 1 ,'zero_balance',49500.30);
select* from accounts;
insert into Transactions(transaction_id ,account_id,transaction_type,amount,transaction_date)
values
(1001,11,'deposit',1000.00,'2024-04-11'),
(1002,12,'withdrawal',500.00,'2024-04-03'),
(1003,13,'deposit',	2000.00,'2024-04-05'),
(1004,14,'withdrawal',1000.00,'2024-04-08'),
(1005,15,'transfer',300.00,'2024-04-10'),
(1006,16,'deposit',	2500.00,'2024-04-05'),
(1007,16,'withdrawal',5000,'2024-04-03'),
(1008,18,'transfer',1300,'2024-04-08'),
(1009,19,'deposit',12000,'2024-04-06'),
(1010,20,'withdrawal',2000,'2024-04-23');
select * from transactions;
-----------------------------------------
-- TASK2 --------------------------------------------------------------
-- 1.Write a SQL query to retrieve the name, account type and email of all customers.

select customers.first_name,customers.last_name,accounts.account_type,customers.email
from customers
inner join accounts on  accounts.customer_id=customers.customer_id;

-- 2. Write a SQL query to list all transaction corresponding customer
select customers.customer_id,customers.first_name,customers.last_name,accounts.account_id,transactions.transaction_id,transactions.transaction_type,
transactions.transaction_date
from customers
join accounts on customers.customer_id=accounts.customer_id
join transactions on accounts.account_id=transactions.account_id;

-- 3. Write a SQL query to increase the balance of a specific account by a certain amount.

update accounts set balance= balance+500.00 where account_id=11;

-- 4. Write a SQL query to Combine first and last names of customers as a full_name.
select concat(first_name,' ',last_name) as Name from customers;

-- 5. Write a SQL query to remove accounts with a balance of zero where the account type is savings.
delete from accounts where balance=0 and account_type='savings';

-- 6. Write a SQL query to Find customers living in a specific city
select * from customers where address like '%Tirupati%';

-- 7. Write a SQL query to Get the account balance for a specific account.
select balance from accounts where account_id=15;

-- 8. Write a SQL query to List all current accounts with a balance greater than $1,000
select * from accounts where balance > 1000;

-- 9. Write a SQL query to Retrieve all transactions for a specific account
select * from transactions where account_id=13;

-- 10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.
select account_id,balance*1.2 as Interest_Rate from accounts
where account_type='savings';

-- 11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit
select * from accounts where balance < 50000;

-- 12. Write a SQL query to Find customers not living in a specific city
select concat(first_name,' ',last_name) as Name from customers where address not like '%USA%';

-----------------------------------------
-- TASK3 --------------------------------------------------------------
use hmbank;
-- 1. Write a SQL query to Find the average account balance for all customers.
select avg(balance) as Average_bal from accounts;

 -- 2. Write a SQL query to Retrieve the top 10 highest account balances.
 select customer_id,balance from accounts
 order by balance desc
 limit 10;
 
 -- 3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.
 select sum(amount)  as total_deposit from Transactions
 where transaction_type='deposit'
 and Transaction_date ='2024-04-11';
 
 -- 4. Write a SQL query to Find the Oldest and Newest Customers.
 select customer_id,first_name,last_name,DOB from customers
 order by DOB asc
 limit 1;
 
 select customer_id,first_name,last_name,DOB from customers 
 order by DOB desc
 limit 1;
 
 -- 5. Write a SQL query to Retrieve transaction details along with the account type.
select transactions.transaction_id,transactions.account_id,accounts.account_type,transactions.transaction_type,transactions.transaction_date,transactions.amount
from transactions
join accounts on transactions.account_id=accounts.account_id;

-- 6. Write a SQL query to Get a list of customers along with their account details
select accounts.account_id,concat(customers.first_name,' ',customers.last_name) as Name,accounts.account_type,accounts.balance
from accounts
join customers on customers.customer_id=accounts.customer_id;

-- 7. Write a SQL query to Retrieve transaction details along with customer information for a specific account
use hmbank;
select t.transaction_id, t.account_id, a.customer_id, c.first_name, c.last_name,  t.transaction_type, t.amount, t.transaction_date,c.DOB, c.email, c.phone_number, c.address from transactions t
join accounts a on t.account_id=a.account_id
join customers c on c.customer_id=a.customer_id
where a.account_id=19;

-- 8. Write a SQL query to Identify customers who have more than one account.
select c.customer_id, c.first_name, c.last_name, count(a.account_id) from customers c
join accounts a on c.customer_id=a.customer_id
group by c.customer_id, c.first_name, c.last_name
having count(a.account_id)>1 ;

-- 9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals.
select ((select sum(amount) from transactions where transaction_type='deposit')-(select sum(amount) from transactions where transaction_type='withdrawal'))
as difference;

-- 10. Write a SQL query to Calculate the average daily balance for each account over a specified period
SELECT account_id, AVG(balance) AS average_daily_balance
FROM (
    SELECT account_id, transaction_date, 
           SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE -amount END) AS balance
    FROM Transactions
    WHERE transaction_date BETWEEN '2024-04-02' AND '2024-04-30'
    GROUP BY account_id, transaction_date
) AS daily_balances
GROUP BY account_id;

-- 11. Calculate the total balance for each account type.
select account_type,sum(balance)
from accounts
group by account_type;

-- 12. Identify accounts with the highest number of transactions order by descending order
select a.account_id,count(t.transaction_type) as transaction_count
from accounts a
inner join transactions t on a.account_id=t.account_id
group by a.account_id
order by transaction_count desc;

-- 13. List customers with high aggregate account balances, along with their account types
select c.customer_id,c.first_name,c.last_name,a.account_type,sum(a.balance) as tot_balance
from customers as c
inner join accounts as a on a.customer_id=c.customer_id
group by c.customer_id, c.first_name, c.last_name, a.account_type
order by tot_balance desc;

-- 14. Identify and list duplicate transactions based on transaction amount, date, and account.
select transaction_id,account_id,transaction_type,amount,transaction_date,count(*) as duplicate_count
from transactions
group by transaction_id, account_id, transaction_type, amount, transaction_date
having count(*)>1;

-----------------------------------------
-- TASK4 --------------------------------------------------------------
-- 1. Retrieve the customer(s) with the highest account balance.
select  c.customer_id,c.first_name,c.last_name,a.balance from customers c 
join accounts a on a.customer_id=c.customer_id where a.balance=(select max(balance) from accounts);

-- 2. Calculate the average account balance for customers who have more than one account
select avg(total_balance) as avg_account_balance from(select avg(balance) as total_balance from accounts
where customer_id in(select customer_id from accounts group by customer_id having count(*)>1)group by customer_id)as subquery;

-- 3. Retrieve accounts with transactions whose amounts exceed the average transaction amount
select a.account_id, a.customer_id, a.account_type, a.balance, t.transaction_id, t.transaction_type, t.amount, t.transaction_date
from accounts a
join Transactions t on a.account_id = t.account_id where t.amount > (select avg(amount) from Transactions);

-- 4. Identify customers who have no recorded transactions
select c.customer_id, c.first_name, c.last_name
from Customers c
left join Accounts a on c.customer_id = a.customer_id
left join Transactions t on a.account_id = t.account_id
where t.transaction_id is null;

-- 5. Calculate the total balance of accounts with no recorded transactions.
select sum(a.balance) as total_balance_no_transactions
from Accounts a left join Transactions t on a.account_id = t.account_id where t.transaction_id is null;

-- 6. Retrieve transactions for accounts with the lowest balance.
select t.* from Transactions t join (select a.account_id from Accounts a
where a.balance = (select MIN(balance)from Accounts)) lowest_balance_accounts on t.account_id = lowest_balance_accounts.account_id;

-- 7. Identify customers who have accounts of multiple types
select customer_id from Accounts group by customer_id having count(distinct account_type) > 0;

-- 8. Calculate the percentage of each account type out of the total number of accounts
select account_type, count(*) * 100.0 / (select count(*) from Accounts) as percentage
from Accounts group by account_type;

-- 9. Retrieve all transactions for a customer with a given customer_id.
select t.* from Transactions t join Accounts a on t.account_id = a.account_id where a.customer_id = '10';

-- 10. Calculate the total balance for each account type, including a subquery within the SELECT clause
select account_type, (select sum(balance) from Accounts a where a.account_type = outer_query.account_type) as total_balance
from (select distinct account_type from Accounts) as outer_query;
