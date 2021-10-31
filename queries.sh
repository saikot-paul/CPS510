#!/bin/sh
export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF


SELECT customer_id
    FROM loan
        WHERE amount > 5000
            ORDER BY amount DESC;


SELECT count(supervisee_id), supervisor_id
    FROM supervises
            GROUP BY supervisor_id
                ORDER BY count(supervisee_id);
            


SELECT DISTINCT bank_name
    FROM branch
        WHERE branch_no > 011
            ORDER BY bank_name;


SELECT DISTINCT branch_no
    FROM branch_and_dept bd
        WHERE NOT EXISTS 
            (SELECT *
             FROM department d
             WHERE d.department_no = bd.department_no
             AND d.dept_name = 'IT');
                    
                     
SELECT a.account_no, a.balance
    FROM account a
        WHERE a.balance>4000
        ORDER BY a.balance;
                
              
SELECT t.account_no, t.amount
    FROM transaction t
        WHERE t.amount>=2000  
        ORDER BY t.amount DESC;
        

SELECT customer_id, count(customer_id) cus
    FROM customer_and_accnts
    GROUP BY customer_id;
    

SELECT customer_id, customer_name 
    FROM customer; 
    
                  
SELECT DISTINCT emp_id, emp_role
    FROM employee 
        ORDER BY emp_role;


SELECT account_no, interest
    FROM savings_account 
      ORDER BY account_no;   
 
 
SELECT count(account_no), emp_id
    FROM accesses
    GROUP BY emp_id;

  
SELECT  department_no, dept_name
    FROM department
        WHERE department_no = '555'
            ORDER BY dept_name;
            

SELECT b.branch_no, COUNT(*) as Amount_Of_Departments
FROM branch_and_dept bd, branch b
WHERE bd.branch_no = b.branch_no
GROUP BY b.branch_no;


SELECT b.branch_no, b.bank_name, d.dept_name
FROM branch_and_dept bd, branch b, department d
WHERE bd.branch_no = b.branch_no
AND bd.department_no = d.department_no;


SELECT e.emp_name, AVG(l.amount)
FROM employee e, loan l
WHERE e.emp_id = l.employee_id
GROUP BY emp_name
ORDER BY AVG(l.amount) ASC;

 
CREATE view cust_and_accnt_balance(customer_name, account_no, balance) as 
(SELECT c.customer_name, a.account_no, a.balance
    FROM  account a, customer c, customer_and_accnts ca 
        WHERE (
            ca.customer_id = c.customer_id
        and ca.account_id = a.account_no
)); 
        
 
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

SELECT  account.account_no, account.balance, s.interest
    FROM  savings_account s
   INNER JOIN account 
    ON s.account_no = account.account_no;


CREATE view loan_officers AS 
    SELECT e.emp_id, e.emp_name, l.loan_no, l.loan_type, l.amount  
        FROM employee e, loan l
            WHERE (e.emp_role = 'Loan Officer'
           and l.employee_id = e.emp_id)
                ORDER BY e.emp_id;

exit;
EOF

