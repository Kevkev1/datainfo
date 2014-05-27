
BEGIN READ COMMITTED
--read1(x):  
SELECT titel FROM Boek WHERE isbn = '0136067018';

--read1(y):  
SELECT titel FROM Boek WHERE isbn = '0321228383';

--write1(x): 
UPDATE Boek SET titel = titel || ' deel 1' WHERE isbn = '0136067018';

--write1(y): 
UPDATE Boek SET titel = titel || ' deel 1' WHERE isbn = '0321228383';
EN