DROP TABLE IF EXISTS medical_histories;

CREATE TABLE medical_histories(
    id INT PRIMARY KEY AUTO GENERATED AS IDENTITY,
    admitted_at TIMESTAMP DEFAULT NOW(),
    patient_id INT,
    status VARCHAR
);

DROP TABLE IF EXISTS patients;

CREATE TABLE patients(
    id INT PRIMARY KEY AUTO GENERATED AS IDENTITY,
    name VARCHAR,
    date_of_birth DATE
);
ALTER TABLE medical_histories ADD CONSTRAINT patient_id_fk FOREIGN KEY (patient_id) REFERENCES patients(id);

CREATE TABLE invoices(
    id INT,
    total_amount DECIMAL,
    generated_at TIMESTAMP DEFAULT NOW(),
    payed_at TIMESTAMP,
    medical_history_id INT
);

ALTER TABLE invoices ADD CONSTRAINT invoices_medical_fk FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)


-- ALTER TABLE invoices ADD CONSTRAINT invoices_fk FOREIGN KEY (id) REFERENCES invoice_items(id);
