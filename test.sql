
CREATE TABLE student(
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) NOT NULL
);

CREATE TABLE product(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    description VARCHAR(50)
);

INSERT INTO product(product_id, product_name, price, description)
VALUES
		(1,'아이폰',1100000,'Apple 스마트폰'),
        (2,'아이패드',800000,'Apple 태블릿'),
		(3,'맥북',1600000,'Apple 노트북'),
		(4,'애플워치',300000,'Apple 애플워치');
        
        
SELECT * FROM product;

CREATE TABLE product_buy(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY(id) REFERENCES product(product_id)
);

INSERT INTO product_buy(id, name, amount)
VALUES
		(1,'김미정',1),
        (2,'짱구',1),
		(3,'훈이',2);
	
SELECT * FROM product_buy;
        
SELECT *
FROM product as p
INNER JOIN product_buy as b
ON p.product_id = b.id;
        