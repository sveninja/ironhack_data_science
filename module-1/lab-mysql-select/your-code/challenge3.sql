  
CREATE OR REPLACE VIEW new_table3 AS
SELECT authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, titles.title AS TITLE, publishers.pub_name AS PUBLISHER, sales.qty AS BOOKS_SOLD
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
INNER JOIN sales ON titleauthor.title_id = sales.title_id;

/* SELECT AUTHOR_ID, FIRST_NAME, LAST_NAME, PUBLISHER, COUNT(*) FROM new_table GROUP BY AUTHOR_ID, PUBLISHER; */

/* SELECT AUTHOR_ID, FIRST_NAME, LAST_NAME, COUNT(*) FROM new_table3 GROUP BY AUTHOR_ID, TITLE; */

/* SELECT 
    orderNumber,
    FORMAT(SUM(quantityOrdered * priceEach),
        2) total
FROM
    orderdetails
GROUP BY orderNumber
ORDER BY SUM(quantityOrdered * priceEach) DESC; */

SELECT 
    AUTHOR_ID,
    LAST_NAME,
    FIRST_NAME,
    FORMAT(SUM(BOOKS_SOLD),
        2) total
FROM
    new_table3
GROUP BY AUTHOR_ID
ORDER BY SUM(BOOKS_SOLD) DESC;