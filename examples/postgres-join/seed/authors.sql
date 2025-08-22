-- authors.sql
CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  slug TEXT,
  name TEXT,
  bio TEXT
);

INSERT INTO authors (slug, name, bio) VALUES
('adam-stuart', 'Adam Stuart', 'Go developer and writer'),
('robert-martin', 'Robert Martin', 'Uncle Bob');