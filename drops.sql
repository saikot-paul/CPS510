-- Tables -- 

DROP TABLE accesses CASCADE CONSTRAINTS;
DROP TABLE branch CASCADE CONSTRAINTS;
DROP TABLE branch_and_dept CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;
DROP TABLE customer_and_accnts CASCADE CONSTRAINTS;
DROP TABLE department CASCADE CONSTRAINTS;
DROP TABLE employee CASCADE CONSTRAINTS;
DROP TABLE loan CASCADE CONSTRAINTS;
DROP TABLE supervises CASCADE CONSTRAINTS;
DROP TABLE transaction CASCADE CONSTRAINTS;
DROP TABLE account CASCADE CONSTRAINTS;
DROP TABLE chequings_account CASCADE CONSTRAINTS; 
DROP TABLE savings_account CASCADE CONSTRAINTS; 

-- Views -- 
DROP VIEW cust_and_avg_transaction;
DROP VIEW cust_and_accnt_balance; 
DROP VIEW loan_officers;