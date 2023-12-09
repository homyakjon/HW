CREATE TABLE authors
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    year DATE         NOT NULL DEFAULT '1970-01-01'
);

CREATE TABLE genres
(
    id SERIAL PRIMARY KEY,
    genre VARCHAR(100) NOT NULL  DEFAULT 0
);

CREATE TABLE books
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    genre_id INT          NOT NULL REFERENCES genres (id)
);


CREATE TABLE authors_books
(
    id SERIAL PRIMARY KEY,
    author_id INT NOT NULL REFERENCES authors (id),
    book_id INT NOT NULL REFERENCES books (id)
);

INSERT INTO genres (genre) VALUES
	('SF'),
	('novel'),
	('story'),
	('horror');

INSERT INTO books(title, genre_id) VALUES
	('Майстер і Маргарита', 2),
	('Фауст', 0),
	('Білий клик', 3),
	('Дюна', 1),
	('Острів скарбів', 2),
	('Залізна п''ята', 3),
	('Дракон у морі', 1);

INSERT INTO authors (name) VALUES
	('Френк Герберт'),
	('Михайло Булгаков'),
	('Джек Лондон'),
	('Йоган Ґете'),
	('Роберт Хайнлайн');

INSERT INTO authors_books (author_id, book_id) VALUES
	(1, 4),
	(1, 7),
	(2, 1),
	(3, 3),
	(3, 6),
	(4, 2);

SELECT title, genre
FROM books
INNER JOIN genres ON (genres.id = books.genre_id);


SELECT title, genre
FROM books
LEFT JOIN genres ON (genres.id = books.genre_id)
UNION
SELECT title, genre
FROM books RIGHT JOIN genres ON (genres.id = books.genre_id);


SELECT name,
CASE
	WHEN COUNT(book_id) = 0 THEN 'None'
ELSE CAST(COUNT(book_id) as varchar)
END as book_count
FROM authors
LEFT JOIN authors_books ON (authors.id = authors_books.author_id)
GROUP BY name;