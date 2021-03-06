                            --- SIMPLE QUERIES ---

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
    
 /*Prints the employee's role and their id in order of their roles*/                    
SELECT DISTINCT emp_id, emp_role
    FROM employee 
        ORDER BY emp_role;

/*Prints the accounts that have saving accounts*/
SELECT account_no, interest
    FROM savings_account 
      ORDER BY account_no;   
 
/*Prints the number of accounts a certain employee has access to */  
SELECT count(account_no), emp_id
    FROM accesses
    GROUP BY emp_id;

/*Prints the department with a number of 555*/   
SELECT  department_no, dept_name
    FROM department
        WHERE department_no = '555'
            ORDER BY dept_name;
            
            --- ASSIGNMENT 4B: ADVANCED QUERIES ---
            
/*Prints amount of departments each branch has*/
SELECT b.branch_no, COUNT(*) as Amount_Of_Departments
FROM branch_and_dept bd, branch b
WHERE bd.branch_no = b.branch_no
GROUP BY b.branch_no;

/*Prints branch number, bank name and department name for all branches which 
have at least 1 department*/
SELECT b.branch_no, b.bank_name, d.dept_name
FROM branch_and_dept bd, branch b, department d
WHERE bd.branch_no = b.branch_no
AND bd.department_no = d.department_no;

/*Print out emp name and average amount of loans they
approved*/
SELECT e.emp_name, AVG(l.amount)
FROM employee e, loan l
WHERE e.emp_id = l.employee_id
GROUP BY emp_name
ORDER BY AVG(l.amount) ASC;

/*Print out customer name account number and balance*/ 
CREATE view cust_and_accnt_balance(customer_name, account_no, balance) as 
(SELECT c.customer_name, a.account_no, a.balance
    FROM  account a, customer c, customer_and_accnts ca 
        WHERE (
            ca.customer_id = c.customer_id
        and ca.account_id = a.account_no
)); 
        
/*Create view of customer name, account number and the average transaction amount of the account associated with the customer*/ 
CREATE view cust_and_avg_transaction(customer_name, account_no, avg_transaction) as 
(SELECT c.customer_name, a.account_no, avg(t.amount) as average_transaction_amount
    FROM  account a, customer c, customer_and_accnts ca, transaction t 
        WHERE (
            ca.customer_id = c.customer_id
        and ca.account_id = a.account_no
        and ca.account_id = t.account_no
)
        group by c.customer_name, a.account_no, a.balance 
); 

/*Print out the account number and balance if they use a savings account*/
SELECT  account.account_no, account.balance, s.interest
    FROM  savings_account s
   INNER JOIN account 
    ON s.account_no = account.account_no;

/*Create a view of all the loan officers and the loan accounts they control*/
CREATE view loan_officers AS 
    SELECT e.emp_id, e.emp_name, l.loan_no, l.loan_type, l.amount  
        FROM employee e, loan l
            WHERE (e.emp_role = 'Loan Officer'
           and l.employee_id = e.emp_id)
                ORDER BY e.emp_id;
                
                        --- ASSIGNMENT 5 ---
                
/*Find customers who have more than 1 account and print out their name, customer id, and number of accounts they hold*/ 
SELECT c.customer_name, c.customer_id, cna.num_accnts 
FROM (
    SELECT ca.customer_id, count(ca.customer_id)as num_accnts
    FROM customer_and_accnts ca
    GROUP BY (ca.customer_id) 
    ORDER BY (ca.customer_id)) cna, customer c 
WHERE (cna.num_accnts>1
AND   cna.customer_id = c.customer_id
); 

/*Print out customer names and id who have made transactions greater than 1000 or none at all */ 
(SELECT c.customer_name, c.customer_id 
 FROM customer c, transaction t, customer_and_accnts ca, account a
    WHERE( 
        ca.customer_id = c.customer_id 
    and ca.account_id = a.account_no
    and t.account_no = a.account_no 
    and t.amount>1000))
UNION  
(SELECT customer_name, customer_id
FROM customer
WHERE 
    NOT EXISTS 
            (SELECT DISTINCT(c.customer_id), a.account_no    
            FROM customer c, transaction t, customer_and_accnts ca, account a
            WHERE( 
                ca.customer_id = c.customer_id 
            and ca.account_id = a.account_no
            and t.account_no = a.account_no
            ))
);        

/*Print out employee names, id and role who do not work in the customer service field*/ 
SELECT DISTINCT(e.emp_id), e.emp_name, e.emp_role
FROM accesses a, employee e 
WHERE e.emp_id NOT IN a.emp_id;

/*Prints the customers with greater than 10000 in their account*/
SELECT customer_name, customer_id
FROM customer c
WHERE EXISTS(SELECT a.balance FROM account a WHERE a.account_no = c.customer_id AND a.balance > 10000);

/*Prints out which branch is the only branch that has a marketing department */
SELECT b.branch_no, b.bank_name, d.dept_name
FROM branch_and_dept bd, branch b, department d
WHERE bd.branch_no = b.branch_no
AND bd.department_no = d.department_no
MINUS
SELECT b.branch_no, b.bank_name, d.dept_name
FROM branch_and_dept bd, branch b, department d
WHERE bd.branch_no = b.branch_no
AND bd.department_no = d.department_no
AND bd.department_no NOT IN('888')
;





