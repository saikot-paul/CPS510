INSERT INTO customer VALUES('000000000', 'John Smith', '125 Canada Rd', '0000'); 
INSERT INTO customer VALUES('00000001', 'John Doe', '235 Canada Rd', '0001'); 
INSERT INTO customer VALUES('00000001', 'John Paul', '145 Canada Rd', '0002'); 


UPDATE customer SET address = '256 Canada Rd' where customer_id = '000000000' ; 
SELECT * 
    FROM customer; 
    
SELECT *
    FROM customer 
        where address = '235 Canada Rd'; 

 