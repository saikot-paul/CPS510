INSERT INTO customer VALUES('0', 'John Smith', '125 Canada Rd', '0000'); 
INSERT INTO customer VALUES('1', 'John Doe', '235 Canada Rd', '0001'); 
INSERT INTO customer VALUES('2', 'Rick Paul', '100 Canada Rd', '0002'); 
--
INSERT INTO employee VALUES(1234567, 'Mohammed Ali', '222 Canada Rd', 'Loan Officer');
INSERT INTO employee VALUES(3333333, 'Bill Nye', '88 Canada Rd', 'Cashier');
INSERT INTO employee VALUES(2222222, 'Stephen Curry', '777 Canada Rd', 'Depart Supervisor');
INSERT INTO employee VALUES(1111111, 'Lebron Smith', '333 Canada Rd', 'Branch Manager');
INSERT INTO employee VALUES(4444444, 'Anthony Brown', '88 Canada Rd', 'Depart Supervisor');

INSERT INTO loan VALUES('12345', 'Car Loan', 11000, '0', 1234567);
INSERT INTO loan VALUES('33333', 'Personal', 2500, '1', 1234567);
INSERT INTO loan VALUES('22222', 'Mortgage', 100000, '2', 1234567);

INSERT INTO supervises VALUES(1234567, 1111111);
INSERT INTO supervises VALUES(3333333, 1111111);
INSERT INTO supervises VALUES(2222222, 4444444);
--
INSERT INTO branch VALUES(022, 1111111, '123 Alberta Rd', 'CIBC', '416-111-1111');
INSERT INTO branch VALUES(033, 1111111, '42 Rebbecca Rd', 'CIBC', '416-222-2222');
INSERT INTO branch VALUES(044, 1111111, '17 Toronto Rd', 'RBC', '416-333-3333');
--
INSERT INTO department VALUES('555', 'IT', 2222222);
INSERT INTO department VALUES('777', 'Sales', 4444444);
--
INSERT INTO branch_and_dept VALUES(022, '555');
INSERT INTO branch_and_dept VALUES(044, '777');

INSERT INTO ACCOUNT VALUES ('0', 3141.59); 
INSERT INTO ACCOUNT VALUES ('1', 27182.28);
INSERT INTO ACCOUNT VALUES ('2', 12345.67); 
INSERT INTO ACCOUNT VALUES ('3', 982000.0); 

INSERT INTO transaction VALUES('0', 'TFR20', 20.0, '0'); 
INSERT INTO transaction VALUES('1', 'TFR20', 20.0, '1');
INSERT INTO transaction VALUES('2', 'TFR40', 40.0, '2');
INSERT INTO transaction VALUES('3', 'TFR20', 2000.0, '1'); 
INSERT INTO transaction VALUES('4', 'TFR40', 3000.0, '2');
INSERT INTO transaction VALUES('5', 'TFR40', 450.0, '0');

INSERT INTO customer_and_accnts VALUES('0', '0'); 
INSERT INTO customer_and_accnts VALUES('1', '1');
INSERT INTO customer_and_accnts VALUES('2', '2'); 
INSERT INTO customer_and_accnts VALUES('0', '3'); 
--
--
--UPDATE customer SET address = '256 Canada Rd' where customer_id = '000000000' ; 
--SELECT * 
--    FROM customer; 
--    
--SELECT *
--    FROM customer 
--        where address = '235 Canada Rd'; 
--
--
/*Print customer_id in descending order of customers with loans greater than
$5,000*/
SELECT customer_id
    FROM loan
        WHERE amount > 5000
            ORDER BY amount DESC;

/*Prints how many employees work for a designated supervisor*/ 
SELECT count(supervisee_id), supervisor_id
    FROM supervises
            GROUP BY supervisor_id
                ORDER BY count(supervisee_id);
            

/*Prints the banks which have a branch number > 011 in ascending order*/
SELECT DISTINCT bank_name
    FROM branch
        WHERE branch_no > 011
            ORDER BY bank_name;

/*Print the branch number of the branch which do not have an IT department*/
SELECT DISTINCT branch_no
    FROM branch_and_dept bd
        WHERE NOT EXISTS 
            (SELECT *
             FROM department d
             WHERE d.department_no = bd.department_no
             AND d.dept_name = 'IT');
                    
-- Prints account numbers and balances that are greater than 4000                     
SELECT a.account_no, a.balance
    FROM account a
        WHERE a.balance>4000
        ORDER BY a.balance;
                
--Prints accounts who have made transactions greater than $2000                
SELECT t.account_no, t.amount
    FROM transaction t
        WHERE t.amount>=2000  
        ORDER BY t.amount DESC;
--Prints customer id and how many accounts they have       
SELECT customer_id, count(customer_id) cus
    FROM customer_and_accnts
    GROUP BY customer_id;
    
--Prints customer id and their name 
SELECT customer_id, customer_name 
    FROM customer; 
    
    



