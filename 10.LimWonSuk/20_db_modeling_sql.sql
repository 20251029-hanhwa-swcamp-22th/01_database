/*DROP TABLE IF EXISTS `tbl.hobby`;

CREATE TABLE `tbl.hobby` (
	`hobby_na`	INT	NOT NULL	COMMENT '취미번호',
	`hobby_name`	VARCHAR(200)	NOT NULL	COMMENT '취미명',
	`member_no`	INT	NOT NULL	COMMENT '회원번호'
);

ALTER TABLE `tbl.hobby` ADD CONSTRAINT `PK_TBL.HOBBY` PRIMARY KEY (
	`hobby_na`
);

ALTER TABLE `tbl.hobby` ADD CONSTRAINT `FK_tbl_member_TO_tbl.hobby_1` FOREIGN KEY (
	`member_no`
)
REFERENCES `tbl_member` (
	`member_no`
);*/


/*
 ERD CLOUDE에서 내보내기된 SQL 은
 AUTO_INCREMENT와 CHECK 제약조건이 없기 때문에
 별도로 추가를 해야만  한다!!!
 */

DROP TABLE IF EXISTS `tbl_member`;

CREATE TABLE `tbl_member` (
	`member_no`	INT	NOT NULL AUTO_INCREMENT	COMMENT '회원번호(자동증가)',
	`member_name`	VARCHAR(50)	NULL	COMMENT '회원이름'
);

DROP TABLE IF EXISTS `tbl.hobby`;

CREATE TABLE `tbl.hobby` (
	`hobby_na`	INT	NOT NULL AUTO_INCREMENT	COMMENT '취미번호',
	`hobby_name`	VARCHAR(200)	NOT NULL	COMMENT '취미명',
	`member_no`	INT	NOT NULL	COMMENT '회원번호'
);

ALTER TABLE `tbl_member` ADD CONSTRAINT `PK_TBL_MEMBER` PRIMARY KEY (
	`member_no`
);

ALTER TABLE `tbl.hobby` ADD CONSTRAINT `PK_TBL.HOBBY` PRIMARY KEY (
	`hobby_na`
);

ALTER TABLE `tbl.hobby` ADD CONSTRAINT `FK_tbl_member_TO_tbl.hobby_1` FOREIGN KEY (
	`member_no`
)
REFERENCES `tbl_member` (
	`member_no`
);

