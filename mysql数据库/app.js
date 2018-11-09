//使用express构建web服务器
const express = require('express');
const user = require("./routes/user.js");
//引入第三方中间件
const bodyParser = require('body-parser');
// 2.创建服务器
var app=express();
// 3.绑定监听端口//配置中间件body-parser
app.use(bodyParser.urlencoded({extended:false}));
// 3.绑定监听端口
app.listen(7300);
//加载处理跨域模块
const cors=require("cors");
//允许哪个地址跨域模块
app.use(cors({
    origin:["http://127.0.0.1:8080"],
    credentials:true
}));
app.use(express.static(__dirname+"/public"));

app.use("/user",user);

