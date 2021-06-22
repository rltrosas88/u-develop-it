DROP TABLE IF EXISTS votes;
DROP TABLE IF EXISTS candidates;
DROP TABLE IF EXISTS parties;
DROP TABLE IF EXISTS voters;

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

/*capture the date and time when the voter registered*/
CREATE TABLE voters (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  email VARCHAR(50) NOT NULL,
  /*with DEFAULT you can specify what the value should be if no value is provided or else
      a it could potentially be NULL if the that value isn't provided in an INSERT statement*/
  /* CURRENT_TIMESTAMP will return the current date and time in the same 2020-01-01 13:00:00 format*/
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE votes (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  voter_id INTEGER NOT NULL,
  candidate_id INTEGER NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  /*signifies that the values inserted into the voter_id field must be unique*/
  CONSTRAINT uc_voter UNIQUE (voter_id),
  /* with ON DELETE CASCADE, deleting the reference key will also delete the entire row from this table*/
  CONSTRAINT fk_voter FOREIGN KEY (voter_id) REFERENCES voters(id) ON DELETE CASCADE,
  CONSTRAINT fk_candidate FOREIGN KEY (candidate_id) REFERENCES candidates(id) ON DELETE CASCADE
);