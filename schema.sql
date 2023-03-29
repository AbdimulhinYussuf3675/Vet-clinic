/*Queries that provide answers to the questions from all projects.*/

CREATE TABLE IF NOT EXISTS animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    date_of_birth DATE,
    escape_attempts NUMERIC(5,2),
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL);

ALTER TABLE animals ADD COLUMN species VARCHAR(200);