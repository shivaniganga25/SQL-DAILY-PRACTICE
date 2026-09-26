USE cdg_hyd_jfs_058;

CREATE TABLE movies(
    movie_id INT NOT NULL AUTO_INCREMENT,
    movie_code VARCHAR(12) NOT NULL,
    title VARCHAR(200) NOT NULL,
    genre VARCHAR(60) NOT NULL,
    original_language VARCHAR(40) NOT NULL,
    release_date DATE,
    duration_minutes SMALLINT NOT NULL,
    director_name VARCHAR(120) NOT NULL,
    age_certification VARCHAR(20) NOT NULL DEFAULT 'UNRATED',
    audience_rating DECIMAL(3,1),
    production_budget DECIMAL(15, 2),
    catalog_status VARCHAR(20) NOT NULL DEFAULT 'UPCOMING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT `pk_movie_id` PRIMARY KEY (movie_id),
    CONSTRAINT `uk_movie_code` UNIQUE (movie_code),
    CONSTRAINT `chk_duration_minutes_should_be_greater_than_0` CHECK (duration_minutes > 0),
    CONSTRAINT `chk_rating_should_be_null_or_btw_0.00_and_10.0` CHECK (audience_rating BETWEEN 0.0 AND 10.0),
    CONSTRAINT `chk_budget_should_be_null_or_non_negative` CHECK (production_budget > 0)
);

ALTER TABLE movies AUTO_INCREMENT=001;
DROP TABLE movies;
SELECT * FROM movies;


INSERT INTO movies 
(movie_code, title, genre, original_language, release_date, duration_minutes, director_name, age_certification, audience_rating, production_budget, catalog_status)
VALUES
('MOV-0001', 'The Silent Horizon', 'Sci-Fi', 'English', '2025-06-12', 142, 'Christopher Nolan', 'PG-13', 8.4, 185000000.00, 'RELEASED');

INSERT INTO movies 
(movie_code, title, genre, original_language, release_date, duration_minutes, director_name, age_certification, audience_rating, production_budget, catalog_status)
VALUES
('MOV-0002', 'Monsoon Melody', 'Romance', 'Hindi', '2026-02-14', 128, 'Zoya Akhtar', 'U', 7.2, 25000000.00, 'RELEASED');

INSERT INTO movies 
(movie_code, title, genre, original_language, release_date, duration_minutes, director_name, age_certification, audience_rating, production_budget, catalog_status)
VALUES
('MOV-0003', 'Shadow Protocol', 'Action', 'English', NULL, 118, 'Kathryn Bigelow', 'R', NULL, NULL, 'UPCOMING');

-- Updating audience_rating and catalog_status for a movie by movie_code
UPDATE movies SET audience_rating = 8.6, catalog_status = 'RELEASED', updated_at = CURRENT_TIMESTAMP WHERE movie_code = 'MOV-0001';

-- Removing all movies with catalog_status = 'UPCOMING'
DELETE FROM movies WHERE catalog_status = 'UPCOMING';