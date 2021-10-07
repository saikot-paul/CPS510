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

alter table customer add constraint fk_customer_acc 
    foreign key (account_no) references account(account_no); 
alter table account add constraint fk_customer_id
    foreign key (customer_id) references customer(customer_id); 
    
/*I got the customer and account foreign keys to refer to each other, runs fine but still need to work on rest of the relationships as well as entities*/ 
drop table customer; 
drop table account;

create table savings_account(); 

create table chequings_account(); 

create table transaction(
    transaction_id varchar(10) not null unique, 
    transaction_description(20), 
    amount float, 
    primary key (transaction_id)
); 

create table employee(
    emp_id varchar (15), not null unique,
    emp_name varchar(20), 
    address varchar(20), 
    primary key (emp_id)
); 

create table loan(
    loan_id varchar(10) not null unique, 
    amoount float, 
    loan_type varchar(5), 
    primary key (loan_id)
); 

create table branch(); 

create table department(); 

