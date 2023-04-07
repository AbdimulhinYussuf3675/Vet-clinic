CREATE TABLE patient(
 id SERIAL PRIMARY KEY NOT NULL,
 name VARCHAR(60),
 date_of_birth DATE
);

CREATE TABLE medical_histories(
 id SERIAL PRIMARY KEY NOT NULL,
 admited_at TIMESTAMP,
 patient_id INT REFERENCES patient(id),
 status VARCHAR(60)
);

CREATE INDEX ON medical_histories (patient_id);

CREATE TABLE treatments (
  id SERIAL PRIMARY KEY NOT NULL,
  type VARCHAR(60),
  name VARCHAR(60)
);

CREATE TABLE medical_histories_treatments(
  id SERIAL PRIMARY KEY NOT NULL,
  medical_history_id INT REFERENCES medical_histories(id),
  treatment_id INT REFERENCES treatments(id)
);

CREATE INDEX ON medical_histories_treatments (medical_history_id);
CREATE INDEX ON medical_histories_treatments (treatment_id);

CREATE TABLE invoices (
  id SERIAL PRIMARY KEY NOT NULL,
  total_amount DECIMAL(12, 3),
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id)
);

CREATE INDEX ON invoices (medical_history_id);

CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY NOT NULL,
  unit_price DECIMAL(12, 3),
  quantity INT,
  total_price DECIMAL(12, 3),
  invoice_id INT REFERENCES invoices(id),
  treatment_id INT REFERENCES treatments(id)
);

CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);