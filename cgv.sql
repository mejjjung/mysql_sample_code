CREATE DATABASE cgv;
USE cgv;
SELECT * FROM user;

CREATE TABLE user(
	id INT PRIMARY KEY AUTO_INCREMENT,
    userid VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

SELECT * FROM movie;
DESC user;

INSERT INTO user(userid, password, username, phone, email)
VALUES('jjangu','1234','신짱구','010-1111-2222','jjangu@nate.com');

INSERT INTO user(userid, password, username, phone, email)
VALUES('jjanga','4321','신짱아','010-2222-1111','jjanga@nate.com');

create table movie(
	id INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(300),
	movieName VARCHAR(200) NOT NULL
);
drop table movie;
SELECT * FROM movie;
SELECT * FROM movie WHERE movieName LIKE '스즈메%';

INSERT INTO movie(movieName)
VALUES ('리바운드'),
	   ('스즈메의 문단속'),
       ('에어'),
       ('더퍼스트 슬램덩크'),
       ('라이스보이 슬립스'),
       ('던전 앤 드래곤:도적들의 명예'),
       ('[시네도슨트 - 그리스 신화] 신화시대의 시작'),
       ('패왕별희 디 오리지널'),
       ('위대한 쇼맨'),
       ('해피 투게더 리마스터링'),
       ('존 윅 4'),
       ('[유럽 클래식 투어] 뮌헨 오데온스 광장 콘서트'),
       ('[시네도슨트 - 그리스 신화] 일리아드와 오디세이'),
       ('[사건 읽는 영화관] 대한민국 강력사건 : 연쇄살인사건'),
       ('[유럽 클래식 투어] 프라하 블타바 강변 콘서트'),
	   ('파벨만스'),
       ('소울메이트'),
       ('[오페라] 라 트라비아타 @The Met2023'),
       ('오토라는 남자'),
       ('여덟 번째 감각');
       
INSERT INTO movie(img,movieName)
VALUES ('megaBox/movie/movie1.jpg','리바운드'),
	   ('megaBox/movie/movie2.jpg','스즈메의 문단속'),
       ('megaBox/movie/movie3.jpg','에어'),
       ('megaBox/movie/movie4.jpg','더퍼스트 슬램덩크'),
       ('megaBox/movie/movie5.jpg','라이스보이 슬립스'),
       ('megaBox/movie/movie6.jpg','던전 앤 드래곤:도적들의 명예'),
       ('megaBox/movie/movie7.jpg','[시네도슨트 - 그리스 신화] 신화시대의 시작'),
       ('megaBox/movie/movie8.jpg','패왕별희 디 오리지널'),
       ('megaBox/movie/movie9.jpg','위대한 쇼맨'),
       ('megaBox/movie/movie10.jpg','해피 투게더 리마스터링'),
       ('megaBox/movie/movie11.jpg','존 윅 4'),
       ('megaBox/movie/movie12.jpg','[유럽 클래식 투어] 뮌헨 오데온스 광장 콘서트'),
       ('megaBox/movie/movie13.jpg','[시네도슨트 - 그리스 신화] 일리아드와 오디세이'),
       ('megaBox/movie/movie14.jpg','[사건 읽는 영화관] 대한민국 강력사건 : 연쇄살인사건'),
       ('megaBox/movie/movie15.jpg','[유럽 클래식 투어] 프라하 블타바 강변 콘서트'),
	   ('megaBox/movie/movie16.jpg','파벨만스'),
       ('megaBox/movie/movie17.jpg','소울메이트'),
       ('megaBox/movie/movie18.jpg','[오페라] 라 트라비아타 @The Met2023'),
       ('megaBox/movie/movie19.jpg','오토라는 남자'),
       ('megaBox/movie/movie20.jpg','여덟 번째 감각');