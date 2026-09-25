
CREATE TABLE movies(
   id VARCHAR(10) PRIMARY KEY NOT NULL,
   title VARCHAR(100) NOT NULL,
   year INTEGER NOT NULL,
   director VARCHAR(100) NOT NULL
);

CREATE TABLE stars(
    id VARCHAR(10) PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    birth_year INTEGER
);

CREATE TABLE stars_in_movies(
    star_id VARCHAR(10) NOT NULL,
    movie_id VARCHAR(10) NOT NULL,

    PRIMARY KEY (star_id, movie_id),

    FOREIGN KEY (star_id) REFERENCES stars(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

CREATE TABLE genres(
    id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(32) NOT NULL
);

CREATE TABLE genres_in_movies(
    genre_id INTEGER NOT NULL,
    movie_id VARCHAR(10) NOT NULL,

    PRIMARY KEY (genre_id, movie_id),

    FOREIGN KEY (genre_id) REFERENCES genres(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

CREATE TABLE customers(
    id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    credit_card_id VARCHAR(20) NOT NULL,
    address VARCHAR(200) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(20) NOT NULL
);

CREATE TABLE sales(
    id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    customer_id INTEGER NOT NULL,
    movie_id VARCHAR(10) NOT NULL,
    sale_date DATE NOT NULL,

    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

CREATE TABLE credit_cards(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    expiration DATE NOT NULL
);

CREATE TABLE ratings(
    movie_id VARCHAR(10) NOT NULL,
    rating FLOAT NOT NULL,
    vote_count INTEGER NOT NULL,

    PRIMARY KEY (movie_id),

    FOREIGN KEY (movie_id) REFERENCES movies(id)
);
