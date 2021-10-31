#!/bin/sh
export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

INSERT INTO customer VALUES('0', 'John Smith', '125 Canada Rd', '0000'); 
INSERT INTO customer VALUES('1', 'John Doe', '235 Canada Rd', '0001'); 
INSERT INTO customer VALUES('2', 'Rick Paul', '100 Canada Rd', '0002');
INSERT INTO customer VALUES('3', 'James Albert', '44 Canada Rd', '0003'); 

INSERT INTO employee VALUES(1234567, 'Mohammed Ali', '222 Canada Rd', 'Loan Officer');
INSERT INTO employee VALUES(3333333, 'Bill Nye', '88 Canada Rd', 'Cashier');
INSERT INTO employee VALUES(2222222, 'Stephen Curry', '777 Canada Rd', 'Depart Supervisor');
INSERT INTO employee VALUES(1111111, 'Lebron Smith', '333 Canada Rd', 'Branch Manager');
INSERT INTO employee VALUES(4444444, 'Anthony Brown', '88 Canada Rd', 'Depart Supervisor');
INSERT INTO employee VALUES(5555555, 'Carmelo Anthony', '999 Canada Rd', 'Depart Supervisor');
INSERT INTO employee VALUES(7777777, 'Rick Smith', '11 Yukon Rd', 'Loan Officer');
INSERT INTO employee VALUES(8888888, 'Joe Steven', '44 Yukon Rd', 'Loan Officer');
INSERT INTO employee VALUES(9999999, 'Marcus Smart', '55 Yukon Rd', 'Branch Manager');

INSERT INTO loan VALUES('12345', 'Car Loan', 11000, '0', 1234567);
INSERT INTO loan VALUES('33333', 'Personal', 2500, '1', 1234567);
INSERT INTO loan VALUES('22222', 'Mortgage', 100000, '2', 1234567);
INSERT INTO loan VALUES('55555', 'Personal', 8000, '0', 8888888);
INSERT INTO loan VALUES('77777', 'Car Loan', 22000, '3', 8888888);

INSERT INTO loan VALUES('88888', 'Personal', 2000, '3', 7777777);
INSERT INTO loan VALUES('99999', 'Car Loan', 11000, '1', 7777777);


INSERT INTO supervises VALUES(1234567, 1111111);
INSERT INTO supervises VALUES(2222222, 1111111);
INSERT INTO supervises VALUES(3333333, 4444444);
INSERT INTO supervises VALUES(7777777, 9999999);
INSERT INTO supervises VALUES(8888888, 9999999);

INSERT INTO branch VALUES(022, 1111111, '123 Alberta Rd', 'CIBC', '416-111-1111');
INSERT INTO branch VALUES(033, 1111111, '42 Rebbecca Rd', 'CIBC', '416-222-2222');
INSERT INTO branch VALUES(044, 1111111, '17 Toronto Rd', 'RBC', '416-333-3333');
INSERT INTO branch VALUES(055, 9999999, '22 Toronto Rd', 'Scotiabank', '416-444-4444');

INSERT INTO department VALUES('555', 'IT', 2222222);
INSERT INTO department VALUES('777', 'Sales', 4444444);
INSERT INTO department VALUES('888', 'Marketing', 5555555);

INSERT INTO branch_and_dept VALUES(022, '555');
INSERT INTO branch_and_dept VALUES(022, '777');
INSERT INTO branch_and_dept VALUES(022, '888');
INSERT INTO branch_and_dept VALUES(044, '777');
INSERT INTO branch_and_dept VALUES(044, '555');

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

INSERT INTO savings_account VALUES('0', '0', 0.07);
INSERT INTO savings_account VALUES('2', '2', 0.03);

INSERT INTO accesses VALUES('3333333', '0', '0','0');
INSERT INTO accesses VALUES('3333333', '1', '1','1');
INSERT INTO accesses VALUES('3333333', '2', '2', '4');

exit;
EOF

