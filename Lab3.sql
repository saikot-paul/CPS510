CREATE TABLE customer(
    customer_id INTEGER PRIMARY KEY NOT NULL, 
    customer_name VARCHAR(20), 
    address VARCHAR(20), 
    phone_no NUMBER(9), 
    pin NUMBER(4), 
    FOREIGN KEY (account_no) REFERENCES account(account_no)
); 

CREATE TABLE account(
    account_no INTEGER PRIMARY KEY NOT NULL, 
    balance FLOAT, 
    transaction_history 
); 

CREATE TABLE savings_account(
    interest FLOAT, 
    FOREIGN KEY (account_no) REFERENCES account(account_no)
); 

CREATE TABLE transaction(
    transaction_no INTEGER PRIMARY KEY, NOT NULL, 
    amount FLOAT, 
); 

CREATE TABLE employee(); 

CREATE TABLE loan(); 

CREATE TABLE branch(); 

CREATE TABLE department(); 

