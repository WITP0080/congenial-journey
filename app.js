const express=require('express');
const bodyParser=require('body-parser');
const app=express();

/*路由地址*/
const user=require('./router/user.js');
const commodity=require('./router/commodity.js');

app.listen(3000);

app.use(express.static("public"));


// 跨域管理模块
const cors=require('cors');
// 配置跨域白名单
app.use(cors({
    origin:["http://localhost:8080","http://192.0.0.1:8080"]
}));

//使用bodyparser中间件
app.use(bodyParser.urlencoded({
    extended:false
}));

/*路由挂载*/ 
app.use('/pro',user);
app.use('/pro1/',commodity);