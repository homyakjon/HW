CREATE DATABASE my_films;

\c my_films;

CREATE TABLE films (
    id SERIAL PRIMARY KEY,
    film_title VARCHAR(255) NOT NULL,
    release_year INTEGER NOT NULL
);

CREATE TABLE actors (
    id SERIAL PRIMARY KEY,
    actor_name VARCHAR(100) NOT NULL
);

CREATE TABLE film_actors (
    film_id INT,
    actor_id INT,
    PRIMARY KEY (film_id, actor_id),
    FOREIGN KEY (film_id) REFERENCES films (id),
    FOREIGN KEY (actor_id) REFERENCES actors (id)
);

CREATE TABLE directors (
    id SERIAL PRIMARY KEY,
    director_name VARCHAR(100) NOT NULL
);

CREATE TABLE film_directors (
    film_id INT,
    director_id INT,
    PRIMARY KEY (film_id, director_id),
    FOREIGN KEY (film_id) REFERENCES films (id),
    FOREIGN KEY (director_id) REFERENCES directors (id)
);

INSERT INTO films (film_title, release_year) VALUES
    ('Inception', 2010),
    ('The Dark Knight', 2008),
    ('Pulp Fiction', 1994),
    ('The Bruce omnipotent', 2005);

INSERT INTO actors (actor_name) VALUES
    ('Leonardo DiCaprio'),
    ('Christian Bale'),
    ('John Travolta'),
    ('Morgan Freeman');

INSERT INTO directors (director_name) VALUES
    ('Christopher Nolan'),
    ('Quentin Tarantino'),
    ('Steven Spielberg'),
    ('Frank Darabont');

UPDATE actors SET actor_name = 'Bruce Li' WHERE id = 1;
UPDATE directors SET director_name = 'Kristofer Nolan' WHERE id = 1;
UPDATE films SET film_title = 'Dragon Exit' WHERE id = 1;

DELETE FROM actors WHERE id = 1;
DELETE FROM directors WHERE id = 1;
DELETE FROM films WHERE id = 1;


CREATE DATABASE university;

\c university;

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments (id)
);

CREATE TABLE groups (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments (id)
);

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    group_id INT,
    FOREIGN KEY (group_id) REFERENCES groups (id)
);

INSERT INTO departments (name) VALUES
    ('Computer Science'),
    ('Mathematics'),
    ('Physics');

INSERT INTO teachers (first_name, last_name, department_id) VALUES
    ('John', 'Doe', 1),
    ('Jane', 'Smith', 2),
    ('Robert', 'Johnson', 3),
    ('Emily', 'Williams', 1),
    ('Michael', 'Brown', 2);

INSERT INTO groups (name, department_id) VALUES
    ('CS50', 1),
    ('Math101', 2),
    ('Phys101', 3),
    ('CS101', 1);

INSERT INTO students (first_name, last_name, group_id) VALUES
    ('Alice', 'Johnson', 1),
    ('Bob', 'Smith', 2),
    ('Charlie', 'Williams', 3),
    ('David', 'Brown', 1),
    ('Eva', 'Davis', 2),
    ('Frank', 'Miller', 3),
    ('Grace', 'Jones', 4),
    ('Henry', 'Anderson', 1),
    ('Ivy', 'Moore', 2),
    ('Jack', 'Taylor', 3),
    ('Kate', 'White', 4),
    ('Leo', 'Martin', 1),
    ('Mia', 'Young', 2),
    ('Noah', 'Lee', 3),
    ('Olivia', 'Harris', 4),
    ('Paul', 'Clark', 1),
    ('Quinn', 'Evans', 2),
    ('Ryan', 'Wright', 3),
    ('Sophia', 'Walker', 4),
    ('Tyler', 'Hill', 1);




