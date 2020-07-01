import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_login/editdata.dart';
import 'package:http/http.dart' as http;

import 'AdminPage.dart';
import 'UserPage.dart';

void main() => runApp(new MyApp());

String username='';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: new MyHomePage(),
      routes: <String,WidgetBuilder>{
        '/AdminPage': (BuildContext context){
          var adminPage = new AdminPage();
        '/UserPage': (BuildContext context){
        '/MyHomePage': (BuildContext context)=> new MyHomePage(),

          },
      },
        },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();

  String msg='';

  Future<List> _login() async{
    final response = await http.post("http://192.168.43.136/app_kedainanu/login.php", body: {
      "username": user.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);

    if(datauser.length==0){
      setState(() {
        msg="Login Failed";
      });
    }else{
      if(datauser[0]['level']=='admin'){
        Navigator.pushReplacementNamed(context, '/AdminPage');
      }else if(datauser[0]['level']=='user'){
        Navigator.pushReplacementNamed(context, '/UserPage');
      }

      setState(() {
        username= datauser[0]['username'];
      });
    }
  return datauser;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Username",style: TextStyle(fontSize: 18.0),),
              TextField(
                controller: user,
                decoration: InputDecoration(
                  hintText: 'Username'
                ),
              ),

              Text("Password", style: TextStyle(fontSize: 18.0),),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password'
                ),
              ),

              RaisedButton(
              child: Text("Login"),
              onPressed: (){
              _login();
                },
              ),

              Text(msg, style: TextStyle(fontSize:20.0,color: Colors.red),)


            ],
          ),
        ),
      ),
      
    );
  }
}