//使用express构建web服务器 --11:25
const express = require('express');
const mysql=require("mysql");
const pool=require("./pool")
// 2.创建服务器
var app=express();
// 3.绑定监听端口
app.listen(7200);
app.use(express.static(__dirname+"/public"));

