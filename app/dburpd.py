#!/usr/bin/python
#coding:utf-8

from flask import render_template,request,redirect,session
from app import app
from  dbutil import DB
import json

fields = ['ip','root_sys_password','root_db_password','jq_position','code_person_in_charge','jq_person_in_charge','bz']
#服务器账号密码
@app.route('/dburpd')
def dburpd():
    if not session.get('username',None):
        return redirect("/login")
    jobs = DB().get_list('dbuserpd',fields)
    return render_template("/dburpd/dbinformation.html",jobs = jobs,info = session)

# 添加服务器
@app.route('/dburpdadd',methods = ['GET','POST'])
def dburpdadd():
   if not session.get('username',None):
        return redirect("/login")
   if request.method == 'POST':
       data = dict((k,v[0]) for k,v in dict(request.form).items())
       fields = ['ip']
       where = {"ip":data["ip"]}
       print where
       if  DB().check('dbuserpd',fields,where):
          return json.dumps({"code":1,"errmsg":"db ip is exist"})
       DB().create('dbinformation',data)
       return json.dumps({"code":0,"result":"add db ip success"})

