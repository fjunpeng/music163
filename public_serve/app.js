//使用express构建web服务器 --11:25
const express = require('express');
const mysql=require("mysql");
const pool=require("./pool")
// 2.创建服务器
var app=express();
// 3.绑定监听端口
app.listen(7200);
app.use(express.static(__dirname+"/public"));

app.get("/imagelist",(req,res)=>{
  var sql="SELECT id,img_url as pic from xz_imagelist";
  pool.query(sql,[],(err,result)=>{
    if(err)thorw(error);
    res.send(result);
  })
})
app.get("/messagelist",(req,res)=>{
result=[
	{ id: 1, name: "手机年底大促", date: "2018-11-11", pic:"http://127.0.0.1:3000/img/index/banner1.png",desc:"越努力越幸运"},
	{ id: 2, name: "服装年底大促", date: "2018-11-11", pic: "http://127.0.0.1:3000/img/index/banner2.png", desc: "越努力越幸运" },
	{ id: 3, name: "游戏币年底大促", date: "2018-11-11", pic: "http://127.0.0.1:3000/img/index/banner3.png", desc: "越努力越幸运" },
	{ id: 4, name: "游戏道具年底大促", date: "2018-11-11", pic: "http://127.0.0.1:3000/img/index/banner4.png", desc: "越努力越幸运" },
	]
    res.send(result);
})

//测试
//http:localhost:3000/details/?lid=3;

