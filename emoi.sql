SET NAMES utf8;
DROP DATABASE  if EXISTS emoi;
CREATE database emoi charset=utf8;
USE emoi;
/*用户*/
CREATE TABLE user_mes(                      
    uid INT PRIMARY KEY AUTO_INCREMENT ,    /*用户ID*/
    uname VARCHAR(32) ,    /*用户名*/
    upwd VARCHAR(32)             /*密码*/
);
insert into user_mes values(null,'zs','123456');

/*地址*/
CREATE TABLE user_address(
	aid INT PRIMARY KEY AUTO_INCREMENT ,
    aname VARCHAR(32),                      /*收件人姓名*/
    aphone VARCHAR(32),                     /*收件人手机号*/
    province varchar(32),                   /*省*/
    town VARCHAR(64),                       /*市*/
    county VARCHAR(64),                     /*县*/
    xtown VARCHAR(64),                       /*镇*/
    street VARCHAR(64),                     /*街道*/
    details varchar(128),                   /*具体*/
    uid int,                                /*具体账户的地址*/
	FOREIGN KEY(uid) REFERENCES user_mes(uid) 
);
/*订单*/
CREATE TABLE user_order(
    oid INT PRIMARY KEY AUTO_INCREMENT ,
    num VARCHAR(32),                        /*订单编号*/
    deal VARCHAR(32),                       /*交易编号*/
    aid INT,                                /*地址id*/
    FOREIGN KEY(aid) REFERENCES user_address(aid)
);
/*购物车*/
CREATE TABLE user_shop(
    sid INT PRIMARY KEY AUTO_INCREMENT ,
    stit varchar(256) ,                     /*标题*/
    pnum int                               /*产品数量*/
);

/**********************************************************************/

/*产品大类*/
CREATE TABLE bkind(
    kid int PRIMARY KEY  AUTO_INCREMENT ,
    kname VARCHAR(64)                     /*类型*/
);
insert into bkind values(null,'香薰生活');
insert into bkind values(null,'智能生活');
insert into bkind values(null,'居家生活');
insert into bkind values(null,'个人随身');

/*产品小类*/
CREATE TABLE skind(
    sid int PRIMARY KEY AUTO_INCREMENT,
    simg VARCHAR(64),                       /*图片地址*/
    kid INT ,                               /*连接类型*/
    FOREIGN KEY(kid) REFERENCES bkind(kid)
);
-- insert into skind values(null,'香薰生活');
/*产品*/
CREATE TABLE product(
    pid INT PRIMARY KEY  AUTO_INCREMENT,
    pric DECIMAL(6,2),
    sid INT ,
    FOREIGN KEY(sid) REFERENCES skind(sid)
);
/*产品图片*/
CREATE table proimg(
    iid int PRIMARY KEY AUTO_INCREMENT,
    iurl1 VARCHAR(64),
    iurl2 VARCHAR(64),
    iurl3 VARCHAR(64),
    iurl4 VARCHAR(64), 
    iurl5 VARCHAR(64),
    pid int,
    FOREIGN KEY(pid) REFERENCES product(pid)
);
/*首页轮播图*/
CREATE TABLE home(                          
    kid int PRIMARY KEY AUTO_INCREMENT,     /*ID*/
    kname varchar(256),                     /*标题*/
    klink VARCHAR(64),                      /*链接*/
    pic VARCHAR(64)                         /*图片*/
);