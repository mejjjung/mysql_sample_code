
insert into size_tb(name)
values
	(215),
    (220),
    (225),
    (230),
    (235),
    (240),
    (245),
    (250),
    (255);
    
insert into brand_tb(name)
values
	('2000Archives'),
    ('디올'),
    ('구찌'),
    ('뉴발란스'),
    ('발렌시아가'),
    ('나이키');
    
insert into category_tb(name)
values
	('신발'),
    ('반팔'),
    ('버킷햇'),
    ('니트'),
    ('바지'),
    ('로퍼');

insert into product_tb(eng_name, kor_name, purchase, gender, model_number, release_date, color, release_price, img_route, brand_id, category_id, size_id)
values
	('aaaa', '가나다라', 100, 'M', 'ABC-123y72313', '1999-12-22', 'white', 300, 'img1.png', 1, 1, 2),
    ('abbbb', '가나다라', 100, 'M', 'ABC-123y72313', '1999-12-22', 'white', 300, 'img1.png', 2, 4, 1),
    ('vvvv', '가나다라', 100, 'M', 'ABC-123y72313', '1999-12-22', 'white', 300, 'img1.png', 3, 2, 3),
    ('ccc', '가나다라', 100, 'M', 'ABC-123y72313', '1999-12-22', 'white', 300, 'img1.png', 2, 3, 2),
    ('ddd', '가나다라', 100, 'M', 'ABC-123y72313', '1999-12-22', 'white', 300, 'img1.png', 1, 2, 4);

insert into user_tb(username, password, tel, address, email, role)
values
	('aaaa', '1234', '010-1234-1234', 'ccccc', 'a@naver.com', default),
    ('bbbb', '1234', '010-1234-1234', 'ddddd', 'b@naver.com', 'admin'),
    ('cccc', '1234', '010-1234-1234', 'sssss', 'c@naver.com', 'manager'),
    ('dddd', '1234', '010-1234-1234', 'eeeee', 'd@naver.com', default),
    ('eeee', '1234', '010-1234-1234', 'rrrrr', 'e@naver.com', default);
    

insert into board_tb(admin_name, title, content, admin_id)
values
	('admin', '안녕하세요', 'ㅎㅎ', 1),
    ('admin', '반갑습니다', 'ㅎㅎ', 2),
    ('manager', '귀찮네 진짜', 'ㅎㅎ', 1),
    ('manager', '후....', 'ㅎㅎ', 2);
    
insert into review_tb(content, review_img, user_id, prod_id)
values
	('신발이 좋아요', 'img1.png', 1, 2),
    ('모자가 좋아요', 'img2.png', 2, 1),
    ('좋아요', 'img3.png', 3, 4),
    ('그저그래요', 'img2.png', 4, 5),
    ('이뻐요', 'img1.png', 5, 1);

insert into question_tb(title, content, user_id)
values
	('사이즈 있나요?', '있냐고', 1),
    ('사이즈 있나요?', '있냐고', 2),
    ('사이즈 있나요?', '있냐고', 3),
    ('사이즈 있나요?', '있냐고', 4),
    ('사이즈 있나요?', '있냐고', 5);
    
insert into answer_tb(title, content, question_id, admin_id)
values
	('사이즈 없어요', '없다고', 1, 1),
    ('사이즈 없어요', '없다고', 2, 2),
    ('사이즈 없어요', '없다고', 3, 1),
    ('사이즈 없어요', '없다고', 4, 2),
    ('사이즈 없어요', '없다고', 5, 1);