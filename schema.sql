/*Queries that provide answers to the questions from all projects.*/

CREATE TABLE IF NOT EXISTS animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    date_of_birth DATE,
    escape_attempts NUMERIC(5,2),
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL);

ALTER TABLE animals ADD COLUMN species VARCHAR(200);

CREATE TABLE IF NOT EXISTS owners(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(25),
    age INTEGER
    );
CREATE TABLE IF NOT EXISTS species(
    id SERIAL PRIMARY KEY,
    name VARCHAR(25)
    ),

ALTER TABLE animals
    DROP COLUMN species,
    ADD COLUMN species_id INTEGER,
    ADD COLUMN owners_id INTEGER,
    ADD CONSTRAINT fk_species FOREIGN KEY (species_id)
        REFERENCES species(id),
    ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id)
        REFERENCES owners(id);