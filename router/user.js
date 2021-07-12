const express=require('express');
const pool=require('../pool.js');
const r=express.Router();

/*用户模块*/

//注册
r.post('/register',(req,res)=>{
    var obj=req.body;
    // console.log(obj);
    pool.query("select * from user_mes where uname=?",[obj.uname],(err,result)=>{
        if(err) throw err;
        // console.log(result)
        if(result.length>0){
            res.send({
                code:301,
                msg:"用户名已存在"
            });
        }else{
            pool.query("insert into user_mes set ?",[obj],(err,result)=>{
                console.log(result.affectedRows);
                if(err) throw err;
                if(result.affectedRows>0){
                    res.send({
                        code:200,
                        msg:"注册成功"
                    });
                }else{
                    res.send({
                        code:201,
                        msg:"注册失败"
                    })
                }
            });        
        }

    })
    
});

// 登录
r.post('/login',(req,res)=>{
    let obj=req.body;
    // console.log(obj);
    pool.query('select uid from user_mes where uname=? and upwd=?',[obj.uname,obj.upwd],(err,result)=>{
        if(err) throw err;
        // console.log(result);
        if(result.length>0){
            res.send({
                code:204,
                msg:"登陆成功"
            })
        }else{
            res.send({
                code:203,
                msg:"登陆失败"
            })
        }
    })
});

// 修改密码
r.post('/update',(req,res)=>{
    let obj=req.body;
    // console.log(obj);
    pool.query('update user_mes set upwd=? where uname=? and upwd=?',[obj.reupwd,obj.uname,obj.upwd],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({
                code:206,
                msg:"修改成功"
            });
        }else{
            res.send({
                code:205,
                msg:"账号密码错误"
            });
        }
    })
});

// 注销账号
r.post('/delete',(req,res)=>{
    let obj=req.body;
    // console.log(obj);
    pool.query('delete from user_mes where uname=? and upwd=?',[obj.uname,obj.upwd],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({
                code:208,
                msg:"删除成功"
            });
        }else{
            res.send({
                code:207,
                msg:"账号或密码不正确"
            });
        }
    })
});

module.exports=r;