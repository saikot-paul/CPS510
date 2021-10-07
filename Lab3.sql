--CREATE TABLE customer (
--    customer_id INTEGER PRIMARY KEY NOT NULL, 
--    customer_name VARCHAR(20), 
--    address VARCHAR(20), 
--    phone_no NUMBER(9), 
--    pin NUMBER(4), 
--    FOREIGN KEY (account_no) REFERENCES account(account_no)
--); 
--
--CREATE TABLE account(
--    account_no INTEGER PRIMARY KEY NOT NULL, 
--    balance FLOAT, 
--    transaction_history 
--); 
--
--CREATE TABLE savings_account (
--    interest FLOAT, 
--    FOREIGN KEY (account_no) REFERENCES account(account_no)
--); 
--
--CREATE TABLE transaction (
--    transaction_no INTEGER PRIMARY KEY, NOT NULL, 
--    amount FLOAT, 
--); 

CREATE TABLE employee (
    employee_id INTEGER PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    address VARCHAR(20) NOT NULL
);

CREATE TABLE supervises (
    employee_id INTEGER REFERENCES employee(employee_id)
);

CREATE TABLE branch ( 
    branch_no INTEGER PRIMARY KEY,
    employee_id INTEGER REFERENCES employee(employee_id)
    address VARCHAR(20) NOT NULL,
    bank_name VARCHAR(20) NOT NULL,
    phone_no NUMBER(9) NOT NULL,
    FOREIGN KEY (employee_id)
);

--CREATE TABLE has (
--    branch_no INTEGER REFERENCES branch(branch_no),
--    department_no INTEGER REFERENCES department(department_no)
--    FOREIGN KEY (branch_no, department_no)
--);


--CREATE TABLE loan(); 
--
--CREATE TABLE branch(); 
--
--CREATE TABLE department(); 

