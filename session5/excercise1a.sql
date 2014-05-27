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
	FOREIGN KEY(isbn) REFERENCES Boek(isbn) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(isbn, volgnummer)
);