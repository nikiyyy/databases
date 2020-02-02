ALTER TABLE taking ADD CONSTRAINT taking_bbq UNIQUE (book_id_book);

INSERT INTO book VALUES( bookseq.nextval, '&book_name' , '&book_date' ,&book_publication_id,&book_author_id,&book_genre_id); --id/name/date/publication/author/genre
INSERT INTO reader VALUES(READERSEQ.nextval,'&reader_name','&reader_telephone'); --id/name/phone
INSERT INTO worker VALUES(WORKERSEQ.nextval,'&worker_name','&worker_telephone',&worker_position); --id/name/phone/ pozition(1-3)
INSERT INTO publication VALUES(PUBLICATIONSEQ.nextval,'&publication'); --id/publicationName
INSERT INTO position_ VALUES(POSITIONSEQ.nextval,'&position'); --id/positionName
INSERT INTO genre VALUES(GENRESEQ.nextval,'&genre'); --id/genreName
INSERT INTO author VALUES(AUTHORSEQ.nextval,'&author'); 
--zaemane
INSERT INTO taking VALUES( &transation_id, '&taking_date' , '&return_date' ,&worker_id,&reader_id,&book_idf);

--procedutra

UPDATE book SET name = '&name' WHERE id_book = &selected_id;
UPDATE reader SET name = '&name' WHERE id_reader = &selected_id;
UPDATE worker SET name = '&name' WHERE id_worker = &selected_id;
UPDATE publication SET publication_name = '&name' WHERE id_publication = &selected_id;
UPDATE author SET author = '&name' WHERE id_author = &selected_id;
UPDATE genre SET genre = '&genre' WHERE id_genre = &selected_id;
UPDATE position_ set position = '&position' WHERE id_position = &selected_id;

--SELECT * FROM BOOK WHERE BOOK.NAME LIKE '%&selected%'; --tursene po ime na knigata
--SELECT * FROM BOOK WHERE genre_id_genre = &Genre_ID; --tursene po genre na knigata
--SELECT * FROM BOOK WHERE author_author_id = &Author_ID;

SELECT BOOK.name , BOOK.year ,publication.publication_name  ,AUTHOR.AUTHOR ,genre.genre FROM BOOK
INNER JOIN GENRE
ON book.genre_id_genre = genre.id_genre 
INNER JOIN AUTHOR 
ON book.AUTHOR_AUTHOR_ID = AUTHOR.id_author
INNER JOIN PUBLICATION 
ON book.PUBLICATION_ID_PUBLICATION = publication.id_publication 
WHERE BOOK.NAME LIKE '%&selected%';

SELECT BOOK.name , BOOK.year ,publication.publication_name  ,AUTHOR.AUTHOR ,genre.genre FROM BOOK
INNER JOIN GENRE
ON book.genre_id_genre = genre.id_genre 
INNER JOIN AUTHOR 
ON book.AUTHOR_AUTHOR_ID = AUTHOR.id_author
INNER JOIN PUBLICATION 
ON book.PUBLICATION_ID_PUBLICATION = publication.id_publication 
WHERE genre_id_genre = &Genre_ID;

SELECT BOOK.name , BOOK.year ,publication.publication_name  ,AUTHOR.AUTHOR ,genre.genre FROM BOOK
INNER JOIN GENRE
ON book.genre_id_genre = genre.id_genre 
INNER JOIN AUTHOR 
ON book.AUTHOR_AUTHOR_ID = AUTHOR.id_author
INNER JOIN PUBLICATION 
ON book.PUBLICATION_ID_PUBLICATION = publication.id_publication 
WHERE author_author_id = &Author_ID;


SELECT taking.book_id_book, book.name FROM taking
INNER JOIN book
ON taking.book_id_book = book.id_book 
WHERE taking.reader_id_reader = &reader_ID;

--nevurnati knigi
SELECT * FROM taking ORDER BY return_date;