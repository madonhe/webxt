#!/usr/bin/python
#coding:utf-8

from flask import render_template,request,redirect,session
from app import app
from  dbutil import DB
import json

fields = ['ip','duankou','dfsize','dfused','dfavail','cpu','cpufz','ncsize','ncfz','slave','bf','data','wlj']
#服务器列表
@app.route('/dbjc')
def dbjc():
    if not session.get('username',None):
        return redirect("/login")
    jobs = DB().get_list('dbjcxx',fields)
    print jobs
    return render_template("/dbjc/dbinformation.html",jobs = jobs,info = session)

# 添加服务器
@app.route('/dbjcadd',methods = ['GET','POST'])
def dbjcadd():
   if not session.get('username',None):
        return redirect("/login")
   if request.method == 'POST':
       data = dict((k,v[0]) for k,v in dict(request.form).items())
       fields = ['ip']
       where = {"ip":data["ip"]}
       print where
       if  DB().check('dbjcxx',fields,where):
          return json.dumps({"code":1,"errmsg":"db ip is exist"})
       DB().create('dbjcxx',data)
       return json.dumps({"code":0,"result":"add db ip success"})

