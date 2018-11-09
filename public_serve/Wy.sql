# 此表为新表，根据数据库 结构图2 在原有基础上修改
SET NAMES UTF8;
DROP DATABASE IF EXISTS wy;
CREATE DATABASE wy CHARSET=UTF8;
USE wy;
# 用户列表 wy_user	uid uname 	upwd	phone	email
Create TABLE wy_user(
    uid     INT PRIMARY KEY AUTO_INCREMENT,
    uname   VARCHAR(18),
    upwd    VARCHAR(18) ,
    phone   INT(11),
    email   VARCHAR(128)
);
INSERT INTO wy_user VALUES(101,"丁丁","123456",18812345678,"807131644@qq.com");
INSERT INTO wy_user VALUES(102,"叮当","123456",18812345677,"807231644@qq.com");
INSERT INTO wy_user VALUES(103,"当当","123456",18812345676,"807331644@qq.com");
INSERT INTO wy_user VALUES(104,"强强","123456",18812345675,"807431644@qq.com");
INSERT INTO wy_user VALUES(105,"壮壮","123456",18812345674,"807531644@qq.com");
INSERT INTO wy_user VALUES(106,"奎奎","123456",18812345673,"807631644@qq.com");
INSERT INTO wy_user VALUES(107,"鹏鹏","123456",18812345672,"807731644@qq.com");
INSERT INTO wy_user VALUES(108,"磊磊","123456",18812345671,"807831644@qq.com");

#用户收藏 	wy_userToCollect	  targetType	targetId	uid
Create TABLE wy_userToCollect(
    targetType  VARCHAR(32),
    targetId    INT,
    uid         INT,
    FOREIGN KEY(uid) REFERENCES wy_user(uid)
);
INSERT INTO wy_userToCollect VALUES("古典交响乐 徜徉在如梦交织的乐章里",1,101);
INSERT INTO wy_userToCollect VALUES("跟我告白，过时不候",2,102);
INSERT INTO wy_userToCollect VALUES("「少年音」清新爽朗 释放蓬勃朝气",3,103);
INSERT INTO wy_userToCollect VALUES("我知道这段感情你累了",4,104);
INSERT INTO wy_userToCollect VALUES("音乐时光机 I 搜寻远去的从前",5,105);
INSERT INTO wy_userToCollect VALUES("高质量英文歌和remix的碰撞",6,106);
INSERT INTO wy_userToCollect VALUES("你的青春里有没有属于你的一首歌？",7,107);
INSERT INTO wy_userToCollect VALUES("小众华语，寂夜里那颗最闪耀的星",8,108);


#个人详细信息表 wy_user_PersonalDetails	    uPId headUrl title   birthday  region  uid
CREATE TABLE wy_user_PersonalDetails(
    uPId        INT PRIMARY KEY AUTO_INCREMENT,
    headUrl     VARCHAR(128),
    title       VARCHAR(128),
    birthday    VARCHAR(32),
    region      VARCHAR(32),
    uid         INT,
    FOREIGN KEY(uid) REFERENCES wy_user(uid)
);
INSERT INTO wy_user_PersonalDetails VALUES(1,"http://127.0.0.1:7300/img/touxiang/tx-1.jpg","我是丁丁，我来自北京，我喜欢古典类型的音乐","1992-1-10","北京",101);
INSERT INTO wy_user_PersonalDetails VALUES(2,"http://127.0.0.1:7300/img/touxiang/tx-2.jpg","我是叮当，我来自上海，我喜欢摇滚类型的音乐","1993-2-10","上海",102);
INSERT INTO wy_user_PersonalDetails VALUES(3,"http://127.0.0.1:7300/img/touxiang/tx-3.jpg","我是当当，我来自天津，我喜欢民谣类型的音乐","1994-3-10","天津",103);
INSERT INTO wy_user_PersonalDetails VALUES(4,"http://127.0.0.1:7300/img/touxiang/tx-4.jpg","我是强强，我来自江苏南京，我喜欢放松类型的音乐","1995-4-10","江苏",104);
INSERT INTO wy_user_PersonalDetails VALUES(5,"http://127.0.0.1:7300/img/touxiang/tx-5.jpg","我是壮壮，我来自江苏南京，我喜欢安静类型的音乐","1996-5-10","江苏",105);
INSERT INTO wy_user_PersonalDetails VALUES(6,"http://127.0.0.1:7300/img/touxiang/tx-6.jpg","我是奎奎，我来自河南，我喜欢游戏类型的音乐","1997-6-10","河南",106);
INSERT INTO wy_user_PersonalDetails VALUES(7,"http://127.0.0.1:7300/img/touxiang/tx-7.jpg","我是鹏鹏，我来自河南，我喜欢运动类型的音乐","1998-7-10","河南",107);
INSERT INTO wy_user_PersonalDetails VALUES(8,"http://127.0.0.1:7300/img/touxiang/tx-8.jpg","我是磊磊，我来自江苏南京，我喜欢舒适类型的音乐","1999-8-10","江苏",108);

-- #歌单		wy_songBigList		sBLId  CreatName sBLName  sIdList  uid	
-- CREATE  TABLE wy_songBigList (
--     sBLId       INT PRIMARY KEY AUTO_INCREMENT,  
--     CreatName   VARCHAR(32),
--     sBLName     VARCHAR(32),
--     sIdList     TEXT,
--     uid         INT,
--     FOREIGN KEY(uid) REFERENCES wy_songBigList(uid)
-- )
-- INSERT INTO wy_songBigList VALUES(1,"");

#歌手		wy_songer		seId    seName  selfIntroduction  fansNumber uid
Create TABLE wy_songer(
    seId                INT PRIMARY KEY AUTO_INCREMENT,
    seName              VARCHAR(128) ,
    selfIntroduction    VARCHAR(128),
    fansNumber          INT,
    uid                 INT,
    FOREIGN KEY(uid) REFERENCES wy_user(uid)
);
INSERT INTO wy_songer VALUES(1,"薛之谦","这是歌手薛之谦",1234567,101);
INSERT INTO wy_songer VALUES(2,"邓紫棋","这是歌手邓紫棋",1334567,102);
INSERT INTO wy_songer VALUES(3,"周杰伦","这是歌手周杰伦",1434567,103);
INSERT INTO wy_songer VALUES(4,"李荣浩","这是歌手李荣浩",1534567,104);
INSERT INTO wy_songer VALUES(5,"周华健","这是歌手周华健",1624567,105);
INSERT INTO wy_songer VALUES(6,"张学友","这是歌手张学友",1534567,106);
INSERT INTO wy_songer VALUES(7,"刘德华","这是歌手刘德华",1534567,107);
INSERT INTO wy_songer VALUES(8,"周笔畅","这是歌手周笔畅",1534567,106);


#专辑		wy_special  	spId  spIntroduction seId
CREATE  TABLE wy_special (
   spId             INT PRIMARY KEY AUTO_INCREMENT,
   spIntroduction   VARCHAR(128),
   spPicUrl         VARCHAR(128),
   seId             INT,
   FOREIGN KEY(seId) REFERENCES wy_songer(seId)
);
INSERT INTO wy_special VALUES(
    1,"1st EP","http://127.0.0.1:7300/img/songer/1stEP.jpg",1);
INSERT INTO wy_special VALUES(
    2,"Get Everybody Moving Concert 2011","http://127.0.0.1:7300/img/songer/GetEverybodyMovingConcert2011.jpg",1);
INSERT INTO wy_special VALUES(
    3,"初学者","http://127.0.0.1:7300/img/songer/初学者.jpg",4);
INSERT INTO wy_special VALUES(
    4,"Greatest Hits 新曲+精选","http://127.0.0.1:7300/img/songer/GreatestHits新+精选.jpg",2);
INSERT INTO wy_special VALUES(
    5,"Love Best 最爱情歌集","http://127.0.0.1:7300/img/songer/LoveBest最爱情歌集(1).jpg",1);
INSERT INTO wy_special VALUES(
    6,"My Secret","http://127.0.0.1:7300/img/songer/MySecret.jpg",5);
INSERT INTO wy_special VALUES(
    7,"Unforgettable Concert 中国巡回演唱会2011","http://127.0.0.1:7300/img/songer/UnforgettableConcert中国巡回演唱会2011.jpg",3);
INSERT INTO wy_special VALUES(
    8,"光年之外","http://127.0.0.1:7300/img/songer/光年之外.jpg",6);
INSERT INTO wy_special VALUES(
    9,"那么喜欢你","http://127.0.0.1:7300/img/songer/那么喜欢你.jpg",1);
INSERT INTO wy_special VALUES(
    10,"你过得好吗","http://127.0.0.1:7300/img/songer/你过得好吗",3);
INSERT INTO wy_special VALUES(
    11,"朋友","http://127.0.0.1:7300/img/songer/朋友.jpg",4);
INSERT INTO wy_special VALUES(
    12,"七里香","http://127.0.0.1:7300/img/songer/七里香.jpg",2);
INSERT INTO wy_special VALUES(
    13,"未完成的歌","http://127.0.0.1:7300/img/songer/未完成的歌.jpg",3);
INSERT INTO wy_special VALUES(
    14,"薛之谦","http://127.0.0.1:7300/img/songer/薛之谦.jpg",7);
INSERT INTO wy_special VALUES(
    15,"中国新歌声 第二季 第1期","http://127.0.0.1:7300/img/songer/中国新歌声第二季第1期.jpg",3);
INSERT INTO wy_special VALUES(
    16,"周杰伦的床边故事","http://127.0.0.1:7300/img/songer/周杰伦的床边故事.jpg",6);

#歌曲总汇 	wy_songList		sId	sName	sTitle	songUrl	  sTimeLong  spId  seId
CREATE  TABLE wy_songList (
   sId          INT PRIMARY KEY AUTO_INCREMENT,
   sNameTitle   VARCHAR(32),
   songUrl      VARCHAR(128),
   sTimeLong    INT, 
   spId         INT,
   constraint  foreign key(spId) references wy_special(spId),
   seId         INT,
   constraint  foreign key(seId) references wy_songer(seId)
);
INSERT INTO wy_songList VALUES("1stEP","","",2500,1,6);

#评价单		wy_appraiseList		apId	targetType	targetId
CREATE  TABLE wy_appraiseList (
   apId         INT PRIMARY KEY AUTO_INCREMENT,
   targetType   VARCHAR(32),
   targetId     INT
);
#INSERT INTO wy_appraiseList VALUES();

#评价		wy_elaluates		elId	apId	eContent  uid
CREATE  TABLE wy_elaluates (
    elId        INT PRIMARY KEY AUTO_INCREMENT,
    eContent    VARCHAR(128),
    apId        INT,
    uid         INT,
    constraint  foreign key(apId) references wy_appraiseList(apId),
    constraint  foreign key(uid) references wy_user(uid)
);
#INSERT INTO wy_elaluates VALUES();

#回复评价单	wy_callBackEleluate  	cBEId	elId	uid 	eContent
CREATE  TABLE wy_callBackEleluate (
   cBEId    INT PRIMARY KEY AUTO_INCREMENT,
   eContent VARCHAR(128),
   elId     INT,
   uid      INT,
   constraint  foreign key(elId) references wy_elaluates(elId),
  constraint FOREIGN KEY(uid) REFERENCES wy_user(uid)
);
#INSERT INTO wy_callBackEleluate VALUES();

#点赞		wy_likeList		likId	targetType	targetId	likeNumber
CREATE  TABLE wy_likeList (
   likId        INT PRIMARY KEY AUTO_INCREMENT,
   targetType   VARCHAR(32),
   targetId     INT,
   likeNumber   INT
);
#INSERT INTO wy_likeList VALUES();

#表的结构 wy_veli
CREATE TABLE wy_veli (
  vid       int(11) NOT NULL,
  uname     varchar(64) DEFAULT NULL,
  value     varchar(64) DEFAULT NULL
);
#转存表中的数据 `wy_veli`
INSERT INTO wy_veli VALUES(0, 'uname', '^[a-zA-Z0-9]{6,12}$'),(1, 'phone', '^[1][0-9]{10}$'),(2, 'email', '^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$'),(3, 'upwd', '^[a-zA-Z0-9]{6,16}$');