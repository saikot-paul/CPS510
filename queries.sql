--INSERT INTO customer VALUES('000000000', 'John Smith', '125 Canada Rd', '0000'); 
--INSERT INTO customer VALUES('00000001', 'John Doe', '235 Canada Rd', '0001'); 
--INSERT INTO customer VALUES('00000002', 'Rick Paul', '100 Canada Rd', '0002'); 
--
--INSERT INTO employee VALUES(1234567, 'Mohammed Ali', '222 Canada Rd', 'Loan Officer');
--INSERT INTO employee VALUES(3333333, 'Bill Nye', '88 Canada Rd', 'Cashier');
--INSERT INTO employee VALUES(2222222, 'Stephen Curry', '777 Canada Rd', 'Depart Supervisor');
--INSERT INTO employee VALUES(1111111, 'Lebron Smith', '333 Canada Rd', 'Branch Manager');
--INSERT INTO employee VALUES(4444444, 'Anthony Brown', '88 Canada Rd', 'Depart Supervisor');
--
--INSERT INTO loan VALUES('12345', 'Car Loan', 11000, '000000000', 1234567);
--INSERT INTO loan VALUES('33333', 'Personal', 2500, '00000001', 1234567);
--INSERT INTO loan VALUES('22222', 'Mortgage', 100000, '00000002', 1234567);
--
--INSERT INTO supervises VALUES(1234567, 1111111);
--INSERT INTO supervises VALUES(3333333, 1111111);
--INSERT INTO supervises VALUES(2222222, 4444444);
--
--INSERT INTO branch VALUES(022, 1111111, '123 Alberta Rd', 'CIBC', '416-111-1111');
--INSERT INTO branch VALUES(033, 1111111, '42 Rebbecca Rd', 'CIBC', '416-222-2222');
--INSERT INTO branch VALUES(044, 1111111, '17 Toronto Rd', 'RBC', '416-333-3333');
--
--INSERT INTO department VALUES('555', 'IT', 2222222);
--INSERT INTO department VALUES('777', 'Sales', 4444444);
--
--INSERT INTO branch_and_dept VALUES(022, '555');
--INSERT INTO branch_and_dept VALUES(044, '777');
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

/*Prints employee id's of all employees Lebron Smith supervises in ascending
order of supervisee_id*/
SELECT supervisee_id
    FROM supervises
        WHERE supervisor_id = 1111111
            ORDER BY supervisee_id;
            
/*Prints out the amount of employees under each supervisor*/            
SELECT COUNT(supervisee_id), supervisor_id
    FROM supervises
        GROUP BY supervisor_id
            ORDER BY COUNT(supervisee_id);
            

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
                    





