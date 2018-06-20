
DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE owners (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL8 PRIMARY KEY,
  image_url VARCHAR(255),
  name VARCHAR(255),
  species VARCHAR(255),
  age INT8,
  adoptable VARCHAR(255),
  owner_id INT8 REFERENCES owners(id) ON DELETE CASCADE
);
