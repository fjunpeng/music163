SET NAMES UTF8;
DROP DATABASE IF EXISTS wy;
CREATE DATABASE wy CHARSET=UTF8;
USE wy;
--
-- 用户列表 wy_user			uid uname 	upwd	phone	email avatarUrl userName gender
--
Create TABLE wy_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname   VARCHAR(18),
    upwd VARCHAR(18) ,
    phone INT(11),
    email VARCHAR(128),
    avatarUrl VARCHAR(128),
    userName   VARCHAR(32),
    gender  BOOLEAN
)
--INSERT INTO wy_user VALUES();

--
--用户收藏 	wy_userToCollect	uTCId targetType	targetId	uid
--
Create TABLE wy_userToCollect(
    uTCId INT PRIMARY KEY AUTO_INCREMENT,
    targetType VARCHAR(32),
    targetId  INT,
    uid INT,
    FOREIGN KEY(uid) REFERENCES wy_user(uid)
)
--INSERT INTO wy_user VALUES();
--
--个人详细信息表 wy_user_PersonalDetails	uPId  title   birthday  region  uid
--
CREATE TABLE wy_user_PersonalDetails(
    uPId INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(128),
    birthday    VARCHAR(32),
    region  VARCHAR(32),
    uid INT,
    FOREIGN KEY(uid) REFERENCES wy_user(uid)
)
--INSERT INTO wy_user VALUES();
--
--歌单		wy_songBigList		sBLId  headUrl  sBLName	sBName	uid	sIdList
--
CREATE  TABLE wy_songBigList (
    sBLId  INT PRIMARY KEY AUTO_INCREMENT,
    headUrl VARCHAR(128),
    sBLName VARCHAR(32),
    sIdList TEXT,
    uid INT,
    FOREIGN KEY(uid) REFERENCES wy_user(uid)
)
--INSERT INTO wy_user VALUES();
--
--歌手		wy_songer		seId    seName  selfIntroduction  fansNumber sAvatarUrl	uid
--
Create TABLE wy_songer(
    seId INT PRIMARY KEY AUTO_INCREMENT,
    seName VARCHAR(128) ,
    selfIntroduction VARCHAR(128),
    fansNumber INT,
    sAvatarUrl  VARCHAR(32),
    uid INT,
    FOREIGN KEY(uid) REFERENCES wy_user(uid)
)
--INSERT INTO wy_songer VALUES();
--
--专辑		wy_special  	spId  spName	 spPicUrl  spIntroduction seId
--
CREATE  TABLE wy_special (
   spId INT PRIMARY KEY AUTO_INCREMENT,
   spName VARCHAR(32),
   spPicUrl  VARCHAR(32),
   spIntroduction VARCHAR(128),
   seId INT,
   FOREIGN KEY(seId) REFERENCES wy_songer(seId)
)
--INSERT INTO wy_special VALUES();
--
--歌曲总汇 	wy_songList		sId	sName	sTitle	songUrl	  sTimeLong  spId  seId
--
CREATE  TABLE wy_songList (
   sId INT PRIMARY KEY AUTO_INCREMENT,
   sName VARCHAR(32),
   sTitle VARCHAR(32),
   songUrl VARCHAR(128),
   sTimeLong VARCHAR(8),
   spId INT,
   seId INT,
   constraint  foreign key(spId) references wy_special(spId),
   constraint  foreign key(seId) references wy_songer(seId)
)
--INSERT INTO wy_songList VALUES();
--
--评价单		wy_appraiseList		apId	targetType	targetId
--
CREATE  TABLE wy_appraiseList (
   apId INT PRIMARY KEY AUTO_INCREMENT,
   targetType VARCHAR(32),
   targetId   INT
)
--INSERT INTO wy_appraiseList VALUES();
--
--评价		wy_elaluates		elId	apId	eContent eTime  uid
--
CREATE  TABLE wy_elaluates (
    elId  INT PRIMARY KEY AUTO_INCREMENT,
    eContent VARCHAR(128),
    eTime   VARCHAR(32),
    apId    INT,
    uid     INT,
    constraint  foreign key(apId) references wy_appraiseList(apId),
    constraint  foreign key(uid) references wy_user(uid)
)
--INSERT INTO wy_elaluates VALUES();
--
--回复评价单	wy_callBackEleluate  	cBEId	elId	uid 	eContent
--
CREATE  TABLE wy_callBackEleluate (
   cBEId INT PRIMARY KEY AUTO_INCREMENT,
   eContent VARCHAR(128),
   elId INT,
   uid  INT,
   constraint  foreign key(elId) references wy_elaluates(elId),
  constraint FOREIGN KEY(uid) REFERENCES wy_user(uid)
)
--INSERT INTO wy_callBackEleluate VALUES();
--
--点赞		wy_likeList		likId	targetType	targetId	likeNumber
--
CREATE  TABLE wy_likeList (
   likId INT PRIMARY KEY AUTO_INCREMENT,
   targetType   VARCHAR(32),
   targetId     INT,
   likeNumber   INT
)
--INSERT INTO wy_likeList VALUES();
--
--点击次数表	wy_clickNumberList	cNLId	targetType	targetId	clickNumber
--
CREATE  TABLE wy_clickNumberList (
   cNLId INT PRIMARY KEY AUTO_INCREMENT,
   targetType VARCHAR(32),
   targetId   INT,
   clickNumber  INT
)
--INSERT INTO wy_user VALUES();
--
-- 表的结构 wy_veli
--
--
CREATE TABLE wy_veli (
  vid int(11) NOT NULL,
  uname varchar(64) DEFAULT NULL,
  value varchar(64) DEFAULT NULL
)
--
-- 转存表中的数据 `wy_veli`
--
INSERT INTO wy_veli VALUES(
    0, 'uname', '^[a-zA-Z0-9]{6,12}$'),
    (1, 'phone', '^[1][0-9]{10}$'),
    (2, 'email', '^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$'),
    (3, 'upwd', '^[a-zA-Z0-9]{6,16}$');