  
/* CREATE OR REPLACE VIEW new_table AS */
SELECT authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, titles.title AS TITLE, publishers.pub_name AS PUBLISHER
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id;

/* SELECT COUNT(*) FROM titles; */
/* SELECT COUNT(*) FROM titleauthor; */
/* SELECT COUNT(*) FROM new_table; */