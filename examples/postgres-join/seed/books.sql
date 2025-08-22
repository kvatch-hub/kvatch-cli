-- books.sql
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  name TEXT,
  author TEXT,
  review TEXT
);

INSERT INTO books (name, author, review) VALUES
('Go in Action', 'adam-stuart', 'Great Go book'),
('Clean Code', 'robert-martin', 'A must read');
