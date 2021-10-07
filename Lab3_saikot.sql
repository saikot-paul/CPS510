CREATE TABLE customer(
    customer_id varchar(10) not null, 
    customer_name varchar(20),
    account_no varchar(10) not null, 
    address varchar(20), 
    pin varchar(4) not null, 
    primary key (customer_id), 
    unique (customer_id, pin)
); 

CREATE TABLE account(
    account_no varchar(10) not null,
    customer_id varchar(10) not null, 
    balance float default 0, 
    primary key (account_no)
); 
    
create table savings_account(
    account_no varchar(10) references account(account_no), 
    interest float, 
    primary key (account_no)
); 

create table employee(
    emp_id varchar (10), not null unique,
    emp_name varchar(20), 
    address varchar(20), 
    primary key (emp_id)
); 

create table transaction(
    transaction_id varchar(10) not null, 
    transaction_description varchar(20) not null, 
    amount float, 
    primary key (transaction_id), 
    unique(transaction_id)
); 

create table loan(
    loan_id varchar(10) not null unique, 
    amoount float, 
    loan_type varchar(5), 
    primary key (loan_id)
    emp_id varchar(10), 
    customer_id varchar(10),
    primary key (loan_id)
); 

create table branch(
    branch_no varchar(5) not null, 
    bank_name varchar(10) not null, 
    phone_no varchar(10), 
    address varchar(20), 
    primary key (branch_no)
); 

create table department(
    department_no varchar(10) not null, 
    department_name varchar(10), 
    primary key (department_no) 
); 

alter table loan add  constraint (approved_by)
        foreign key (emp_id) references employee(emp_id)
alter table loan add constraint (requested_by) 
        foreign key (customer_id) references customer(customer_id) 
        
alter table customer add constraint fk_customer_acc 
    foreign key (account_no) references account(account_no); 
alter table account add constraint fk_customer_id
    foreign key (customer_id) references customer(customer_id); 