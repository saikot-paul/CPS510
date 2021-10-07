--/*Customer Table with its attributes*/ 
--create table customer(
--    customer_id varchar(10), 
--    customer_name varchar(20),
--    address varchar(20), 
--    pin varchar(4) not null, 
--    primary key (customer_id), 
--    unique (customer_id, pin)
--); 

/*Account table with attributes*/ 
create table account(
    account_no varchar(10),
    balance float default 0, 
    primary key (account_no)
); 

create table savings_account( 
    account_no varchar(10) references account(account_no), 
    balance float default 0 references account(balance),  
    interest float,
    
    foreign key (account_no)
);

/*Customer and accounts table - shows the M-N relationship between the two entities*/ 
create table customer_and_accnts( 
    customer_id varchar(10), 
    account_id varchar(10), 
    
    foreign key (customer_id) references customer(customer_id), 
    foreign key (account_id) references account(account_no), 
    
    primary key(customer_id, account_id)
); 

/*Transaction table - the 1:M relationship between transaction and account
        - The transactions are linked to an account shown through the account_no foreign key attribute*/ 
create table transaction( 
    transaction_id varchar(10), 
    transaction_description varchar(20),  
    amount float, 
    account_no varchar(10),
    primary key (transaction_id), 
    
    foreign key (account_no) references account(account_no)
);

/*Employee table with attributes no relationships shown in table*/ 
create table employee(
    emp_id INTEGER, 
    emp_name varchar(20), 
    address varchar(20), 
    primary key (emp_id) 
);

create table branch_manager(
    emp_id varchar(10) references employee(emp_id), 
    
    primary key (emp_id)
); 

create table department_supervisor(
    emp_id varchar(10) references employee(emp_id), 
    
    primary key (emp_id)
);

/*Branch table with attributes*/ 
create table branch(
    branch_no varchar(5), 
    address varchar(20), 
    bank_name varchar(20), 
    
    primary key (branch_no)
); 

/*Department table with attributes*/ 
create table department( 
    department_no varchar(5), 
    deparment_name varchar(10), 
    
    primary key (department_no)
);

/*Supervises table shows which employees are being supervised by who*/ 
CREATE TABLE supervises (
    emp_id INTEGER,
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

/*Manages table shows which branches are being managed by which employee*/ 
create table manages(
    branch_no varchar(5) references branch(branch_no), 
    emp_id varchar(10) references branch_manager(emp_id),
    
    primary key (branch_no, emp_id)
); 

/*Works for table shows what department each employee is working under*/ 
create table works_for( 
    department_no varchar(5) references department(department_no), 
    emp_id varchar(10) references employee(emp_id),

    primary key (department_no, emp_id)
); 

/*Loan table - customer_id and employee_id in this table used to show who requested and who approved the loan respectively*/ 
create table loan( 
    loan_no varchar(10), 
    loan_type varchar(10), 
    amount float, 
    customer_id varchar(10), 
    employee_id varchar(10), 
    
    foreign key (customer_id) references customer(customer_id), 
    foreign key (employee_id) references employee(emp_id)
); 

/*Accesses table - shows the aggregate relationship between the employee, customer, account and transaction entities*/ 
create table accesses( 
    emp_id varchar(10), 
    customer_id varchar(10), 
    account_no varchar(10),
    transaction_id varchar(10), 
    
    foreign key (emp_id) references employee(emp_id), 
    foreign key (customer_id) references customer(customer_id), 
    foreign key (account_no) references account(account_no), 
    foreign key (transaction_id) references transaction(transaction_id), 
    
    primary key (emp_id, customer_id, account_no)
);