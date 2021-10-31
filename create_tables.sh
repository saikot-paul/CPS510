#!/bin/sh
export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF


create table customer(
    customer_id varchar(10), 
    customer_name varchar(20),
    address varchar(20), 
    pin varchar(4) not null, 
    primary key (customer_id), 
    unique (pin)
); 


create table account(
    account_no varchar(10),
    balance float default 0, 
    primary key (account_no)
); 

create table savings_account( 
    account_no varchar(10), 
    parent_account_no varchar(10), 
    interest float,    
    foreign key (account_no) references account(account_no)
);


create table customer_and_accnts( 
    customer_id varchar(10), 
    account_id varchar(10),     
    foreign key (customer_id) references customer(customer_id), 
    foreign key (account_id) references account(account_no), 
    primary key(customer_id, account_id)
); 


create table transaction( 
    transaction_id varchar(10), 
    transaction_description varchar(20),  
    amount float, 
    account_no varchar(10),
    foreign key (account_no) references account(account_no), 
    primary key (transaction_id)
);


create table employee(
    emp_id integer, 
    emp_name varchar(20), 
    address varchar(20), 
    emp_role varchar(20), 
    primary key (emp_id) 
);



CREATE TABLE branch ( 
    branch_no INTEGER PRIMARY KEY,
    branch_manager_id INTEGER,
    address VARCHAR(20) NOT NULL,
    bank_name VARCHAR(20) NOT NULL,
    phone_no VARCHAR(12) NOT NULL,
    FOREIGN KEY (branch_manager_id) REFERENCES employee(emp_id)
);

CREATE TABLE department(
    department_no VARCHAR(5) PRIMARY KEY, 
    dept_name varchar(10), 
    dept_supervisor_id INTEGER,
    FOREIGN KEY (dept_supervisor_id) REFERENCES employee(emp_id)
);


CREATE TABLE branch_and_dept (
   branch_no INTEGER,
   department_no VARCHAR(5),
   FOREIGN KEY (branch_no) REFERENCES branch(branch_no),
   FOREIGN KEY (department_no) REFERENCES department(department_no),
   PRIMARY KEY (branch_no, department_no)
);


CREATE TABLE supervises (
    supervisee_id integer,
    supervisor_id integer, 
    FOREIGN KEY (supervisee_id) REFERENCES employee(emp_id), 
    FOREIGN KEY (supervisor_id) REFERENCES employee(emp_id), 
    primary key (supervisor_id, supervisee_id)
);


create table loan( 
    loan_no varchar(10), 
    loan_type varchar(10), 
    amount float, 
    customer_id varchar(10), 
    employee_id integer, 
    primary key (loan_no), 
    foreign key (customer_id) references customer(customer_id), 
    foreign key (employee_id) references employee(emp_id)
); 

 
create table accesses( 
    emp_id integer, 
    customer_id varchar(10), 
    account_no varchar(10),
    transaction_id varchar(10), 
    foreign key (emp_id) references employee(emp_id), 
    foreign key (customer_id) references customer(customer_id), 
    foreign key (account_no) references account(account_no), 
    foreign key (transaction_id) references transaction(transaction_id), 
    primary key (emp_id, customer_id, account_no)
);

exit;
EOF
