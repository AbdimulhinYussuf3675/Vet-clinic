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

CREATE TABLE IF NOT EXISTS vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    age INTEGER,
    date_of_graduation DATE);

CREATE TABLE IF NOT EXISTS specializations (
    id SERIAL PRIMARY KEY,
    vet_id INT,
    species_id INT,
    CONSTRAINT fk_vets FOREIGN KEY (vet_id)
        REFERENCES vets(id),
    CONSTRAINT fk_species FOREIGN KEY (species_id)
        REFERENCES species(id));

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    vet_id INT,
    animal_id INT,
    date_of_visit DATE,
    CONSTRAINT fk_vets FOREIGN KEY (vet_id)
        REFERENCES vets(id),
    CONSTRAINT fk_animals FOREIGN KEY (animal_id)
        REFERENCES animals(id));

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

create index vet_id_asc ON visits(vet_id ASC);
create index animal_id_asc ON visits(animal_id ASC);
create index email_asc ON owners(email ASC);