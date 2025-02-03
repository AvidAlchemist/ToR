DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS orders;

CREATE TABLE authors (
	author_id INT PRIMARY KEY,
	name varchar(100),
	birthdate date
);

CREATE TABLE books (
	book_id int PRIMARY KEY,
	title varchar(150),
	author_id int,
	price decimal(10,2),
	publication_date date,

	CONSTRAINT fk_books_author_id FOREIGN KEY(author_id)
	REFERENCES authors(author_id) 
);

CREATE TABLE orders (
	order_id int PRIMARY KEY,
	book_id int,
	quantity int,
	order_date date,

	CONSTRAINT fk_orders_book_id FOREIGN KEY(book_id)
	REFERENCES books(book_id)
);

INSERT INTO authors 
VALUES
(1, 'Leo Tolstoy', '1828-08-28'),
(2, 'Fyodor Dostoevsky', '1821-11-11'),
(3, 'Mikhail Bulgakov', '1891-05-03'),
(4, 'Good Author', '2024-12-31');


INSERT INTO books 
VALUES
(1, 'Anna Karenina ', 1, 125.5, '1878-01-01'),
(2, 'Crime and Punishment', 2, 99.5, '1866-12-01'),
(3, 'The Master and Margarita', 3, 89.99, '1967-01-01'),
(4, 'Some Bestseller', 4, 25.49, '2025-01-01');

INSERT INTO orders 
VALUES
(1, 1, 10, '2025-01-01'),
(2, 2, 5, '2024-12-12'),
(3, 3, 25, '2025-01-25'),
(4, 4, 100, '2025-02-03');

--1
SELECT title, authors.name
FROM books
LEFT JOIN authors USING(author_id);

--2
SELECT *
FROM books
WHERE publication_date > '2020-01-01';

--3
SELECT SUM(quantity)
FROM orders;

--4
SELECT *
FROM books
ORDER BY price DESC
LIMIT 3;

--5
SELECT authors.name
FROM authors
JOIN books USING(author_id)
JOIN orders USING(book_id)
GROUP BY authors.name
HAVING SUM(quantity) > 10;


