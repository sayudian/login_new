import 'package:flutter/material.dart';
import './editdata.dart';
import 'package:http/http.dart' as http;
import 'AdminPage.dart';

class Detail extends StatefulWidget {
  //variabel sesuai nnti sama yg diklik
  final List list;
  final int index;
  Detail({this.index,this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  void deleteData(){
    var url="http://192.168.43.136/app_kedainanu/deletedata.php";
    http.post(url, body: {
      'id': widget.list[widget.index]['id']
    });
  }

  void confirm(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Yakin hapus '${widget.list[widget.index]['nama']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("DELETE", style: new TextStyle(color: Colors.black),),
          color: Colors.red,
          onPressed: (){
            deleteData();
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context){
                  var adminPage = new AdminPage();
                                    
                },
              )
            );
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL", style: new TextStyle(color: Colors.black),),
          color: Colors.green,
          onPressed: ()=>Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['nama']}")),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
              new Text(widget.list[widget.index]['nama'], style: new TextStyle(fontSize: 20.0),),
              new Text("Tempat : ${widget.list[widget.index]['tempat']}", style: new TextStyle(fontSize: 18.0),),
              new Text("Harga : ${widget.list[widget.index]['harga']}", style: new TextStyle(fontSize: 18.0),),
              new Text("Tanggal : ${widget.list[widget.index]['tanggal']}", style: new TextStyle(fontSize: 18.0),),
              new Padding(padding: const EdgeInsets.only(top: 30.0),),

              new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new RaisedButton(
                    child: new Text("EDIT"),
                    color: Colors.green,
                    onPressed: ()=>Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context)=>new EditData(list: widget.list, index: widget.index,),
                      )
                    ),
                  ),
                  new RaisedButton(
                    child: new Text("DELETE"),
                    color: Colors.red,
                    onPressed: ()=>confirm(),
                  ),
                ],
              )
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}