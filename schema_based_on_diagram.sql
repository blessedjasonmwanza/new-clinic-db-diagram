DROP TABLE IF EXISTS medical_histories CASCADE;
DROP TABLE  IF EXISTS  invoices CASCADE;
DROP TABLE  IF EXISTS  patients CASCADE;
DROP TABLE  IF EXISTS  treatments CASCADE;
DROP TABLE  IF EXISTS  invoice_items CASCADE;

CREATE TABLE patients(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR,
    date_of_birth DATE
);

CREATE TABLE treatments(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type VARCHAR,
    name VARCHAR
);

CREATE TABLE medical_histories(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP DEFAULT NOW(),
    patient_id INT,
    status VARCHAR
);
ALTER TABLE medical_histories ADD CONSTRAINT patient_id_fk FOREIGN KEY (patient_id) REFERENCES patients(id);

CREATE TABLE invoices(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP DEFAULT NOW(),
    payed_at TIMESTAMP,
    medical_history_id INT
);
ALTER TABLE invoices ADD CONSTRAINT invoices_medical_fk FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id);

CREATE TABLE invoice_items(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT
);
ALTER TABLE invoice_items ADD CONSTRAINT invoice_id_fk FOREIGN KEY (invoice_id) REFERENCES invoices(id);
ALTER TABLE invoice_items ADD CONSTRAINT treatment_id_fk FOREIGN KEY (treatment_id) REFERENCES treatments(id);