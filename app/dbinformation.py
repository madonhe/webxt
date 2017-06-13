#!/usr/bin/python
#coding:utf-8

from flask import render_template,request,redirect,session
from app import app
from  dbutil import DB
import json

fields = ['id','jq','ip','fd_ip','yw','bz']
#服务器列表
@app.route('/dber')
def dber():
    if not session.get('username',None):
        return redirect("/login")
    jobs = DB().get_list('dbinformation',fields)
    return render_template("/dber/dbinformation.html",jobs = jobs,info = session)

# 添加服务器
@app.route('/dberadd',methods = ['GET','POST'])
def dberadd():
   if not session.get('username',None):
        return redirect("/login")
   if request.method == 'POST':
       data = dict((k,v[0]) for k,v in dict(request.form).items())
       fields = ['ip']
       where = {"ip":data["ip"]}
       print where
       if  DB().check('dbinformation',fields,where):
          return json.dumps({"code":1,"errmsg":"db ip is exist"})
       DB().create('dbinformation',data)
       return json.dumps({"code":0,"result":"add db ip success"})

