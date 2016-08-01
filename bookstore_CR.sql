SELECT ISBN
FROM editions AS e
	JOIN publishers AS p 
	ON e.publisher_id = p.id
WHERE p.name = 'Random House';

SELECT ISBN, title
FROM editions AS e
	JOIN publishers AS p
	ON e.publisher_id = p.id
	JOIN books AS b
	ON e.book_id = b.id
WHERE p.name = 'Random House';

SELECT e.isbn, title, stock, retail
FROM editions AS e
	JOIN publishers AS p
	ON e.publisher_id = p.id
	JOIN books AS b
	ON e.book_id = b.id
	JOIN stock AS s
	ON e.isbn = s.isbn
WHERE p.name = 'Random House';

SELECT e.isbn, title, stock, retail
FROM editions AS e
	JOIN publishers AS p
	ON e.publisher_id = p.id
	JOIN books AS b
	ON e.book_id = b.id
	JOIN stock AS s
	ON e.isbn = s.isbn
WHERE p.name = 'Random House' AND s.stock > 0;

SELECT e.isbn, title, stock, retail, CASE WHEN e.type = 'h' THEN 'Hardcover' ELSE 'Paperback' END AS "Book Type"
FROM editions AS e
	JOIN publishers AS p
	ON e.publisher_id = p.id
	JOIN books AS b
	ON e.book_id = b.id
	JOIN stock AS s
	ON e.isbn = s.isbn
WHERE p.name = 'Random House' AND s.stock > 0;

SELECT b.title, e.publication
FROM books AS b
	LEFT OUTER JOIN editions AS e
	ON b.id = e.book_id;
	
SELECT AVG(s.cost) AS "Average Cost", AVG(s.retail) AS "Average Retail", AVG(s.retail) - AVG(s.cost) AS "Average Profit"
FROM stock AS s;

SELECT e.book_id, s.stock
FROM editions AS e
	JOIN stock AS s
	ON e.isbn = s.isbn
ORDER BY s.stock DESC
LIMIT 1;

SELECT a.id, a.first_name || ' ' || a.last_name AS "Full Name", count(b.id) AS "Number Of Books" 
FROM authors AS a
	LEFT JOIN books AS b
	ON a.id = b.author_id
GROUP BY a.id;

SELECT a.id, a.first_name || ' ' || a.last_name AS "Full Name", count(b.id) AS "Number Of Books" 
FROM authors AS a
	LEFT JOIN books AS b
	ON a.id = b.author_id
GROUP BY a.id
ORDER BY count(b.id) DESC;

	
	
	
	