const express = require('express');
const pool = require('../pool.js');
var router = express.Router();
//1.用户登录
router.post('/login',(req,res)=>{
  var $uname=req.body.uname;
  if(!$uname){
    res.send({code:0,msg:"用户名不能为空"});
    return;
  }
  var $upwd=req.body.upwd;
  if(!$upwd){
    res.send({code:0,msg:"用户密码不能为空"});
    return;
  }
  var sql = 'SELECT * FROM wy_user WHERE uname=? AND upwd=?';
  pool.query(sql,[$uname,$upwd],(err,result)=>{
    if(err) throw error;
    if(result.length>0){
      res.send({code:1,msg:"登录成功!"});
    }else{
      res.send({code:-1,msg:"用户名或密码错误!"});
    }
  });
});
//2.验证用户名
router.get('/test',(req,res)=>{
  var $uname=req.query.uname;
  if(!$uname){
    res.send({code:0,msg:"用户名不能为空"});
    return;
  }
  var sql = 'SELECT * FROM wy_user WHERE uname=?';
  pool.query(sql,[$uname],(err,result)=>{
    if(err) throw error;
    if(result.length>0){
      res.send({code:1,msg:"用户已存在"});
    }else{
      res.send({code:-1,msg:"用户名可用"});
    }
  });
});

//3.注册
router.post('/register',(req,res)=>{
  var $uname=req.body.uname;
  if(!$uname){
    res.send({code:0,msg:"用户名不能为空"});
    return;
  }
  var $upwd=req.body.upwd;
  if(!$upwd){
    res.send({code:0,msg:"用户密码不能为空"});
    return;
  }
  var $phone=req.body.phone;
  if(!$phone){
	res.send({code:0,msg:"手机号不能为空"})
		return
  }
  var $email=req.body.email;
  if(!$email){
	res.send({code:0,msg:"邮箱不能为空"})
		return;
  }
  var sql = 'INSERT INTO wy_user VALUES(null,?,?,?,?)';
  pool.query(sql,[$uname,$upwd,$phone,$email],(err,result)=>{
    if(err) throw error;
      res.send({code:200,msg:"注册成功,可登录!"});
  });
});
//导出路由
module.exports=router;









