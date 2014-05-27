CREATE TABLE Boek (
	isbn BIGINT UNIQUE,
	titel VARCHAR(100),
	auteur VARCHAR(100),
	PRIMARY KEY(isbn)
);

CREATE TABLE Exemplaar (
	isbn BIGINT,
	volgnummer BIGINT,
	gewicht FLOAT,
	kast INT,
	FOREIGN KEY(isbn) REFERENCES Boek(isbn),
	PRIMARY KEY(isbn, volgnummer)
);

CREATE OR REPLACE FUNCTION verwijderISBN() 
RETURNS TRIGGER
AS $$ BEGIN
	DELETE FROM Exemplaar e WHERE e.isbn = OLD.isbn;
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER VerwijderBoek AFTER DELETE ON Boek
FOR EACH ROW EXECUTE PROCEDURE verwijderISBN();