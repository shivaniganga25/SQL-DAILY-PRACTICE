use cdg_hyd_jfs_058;

CREATE TABLE book(
    book_id INT NOT NULL AUTO_INCREMENT,
    isbn CHAR(13) NOT NULL,
    title VARCHAR(200) NOT NULL,
    author_name VARCHAR(120) NOT NULL,
    genre VARCHAR(60) NOT NULL,
    publisher VARCHAR(120),
    publication_year SMALLINT NOT NULL,
    page_count SMALLINT NOT NULL,
    book_format VARCHAR(20) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    copies_available INT NOT NULL,
    language VARCHAR(40) NOT NULL DEFAULT 'English',
    added_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT `pk_book_id` PRIMARY KEY (book_id),
    CONSTRAINT `uq_isbn` UNIQUE (isbn),
    CONSTRAINT `chk_publication_year_should_be_between_1000_and_2100` CHECK (publication_year BETWEEN 100 AND 2100),
    CONSTRAINT `chk_page_count_should_be_greater_than_0` CHECK (page_count > 0),
    CONSTRAINT `chk_price_should_not_be_negative` CHECK (price >= 0),
    CONSTRAINT `chk_copies_available_should_not_be_negative` CHECK (price >= 0)
    
);

ALTER TABLE book AUTO_INCREMENT=001;
DROP TABLE book;
SELECT * FROM book;

INSERT INTO book (isbn , title , author_name , genre , publisher, publication_year , page_count , book_format , price , copies_available , language )
VALUES ('STUDB12345678' , 'The Girl inm Room 105' , 'Chetan Baghat' , 'non-fiction' , 'Rupa publisher' , 2019 , 359 , 'Paper Back' , 399.00 , 5 , 'English');


INSERT INTO book (isbn , title , author_name , genre , publisher, publication_year , page_count , book_format , price , copies_available , language )
VALUES ('STUOB12345678' , '400 DAYS' , 'Chetan Baghat' , 'non-fiction' , 'Rupa publisher' , 2024 , 406 , 'Hard Cover' , 499.00 , 10 , 'English');


INSERT INTO book (isbn , title , author_name , genre , publisher, publication_year , page_count , book_format , price , copies_available  )
VALUES ('STUEB12345678' , 'One Arranged Murder' , 'Chetan Baghat' , 'non-fiction' , 'K&P publisher' , 2022 , 380 , 'EBook' , 459.50 , 15 );