DROP TABLE IF EXISTS candidates;
DROP TABLE IF EXISTS parties;

/* TEXT data type can store much longer strings of varying length
    over use if TEXT fields can bloat the database because MySQL will allocate the maximum amount of space for a TEXT value
        no matter how long the value is*/
CREATE TABLE parties (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description TEXT
);

/* VARCHAR data typ myst declare a limit on the legnth*/
CREATE TABLE candidates (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  party_id INTEGER,
  industry_connected BOOLEAN NOT NULL,
  /* constraint allows us to flag the party_id field as an official foreign key and 
      tells SQL which table and field it references*/
 CONSTRAINT fk_party FOREIGN KEY (party_id) REFERENCES parties(id) ON DELETE SET NULL
);

