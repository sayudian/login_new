import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  //buat controller
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerTempat = new TextEditingController();
  TextEditingController controllerHarga = new TextEditingController();
  TextEditingController controllerTanggal = new TextEditingController();
  //panggil dimasing2 textfieldnya

  void addData() {
    var url = "http://192.168.43.136/app_kedainanu/adddata.php";

    http.post(url, body: {
      "nama": controllerNama.text,
      "tempat": controllerTempat.text,
      "harga": controllerHarga.text,
      "tanggal": controllerTanggal.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADD DATA"),
      ),
      //buat kolom
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration:
                      new InputDecoration(hintText: "nama", labelText: "nama"),
                ),

                new TextField(
                  controller: controllerTempat,
                  decoration: new InputDecoration(
                      hintText: "tempat", labelText: "tempat"),
                ),

                new TextField(
                  controller: controllerHarga,
                  decoration: new InputDecoration(
                      hintText: "harga", labelText: "harga"),
                ),

                new TextField(
                  controller: controllerTanggal,
                  decoration: new InputDecoration(
                      hintText: "tanggal", labelText: "tanggal"),
                ),

                //buat tombol untuk eksekusi

                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),

                new RaisedButton(
                  child: new Text("SIMPAN"),
                  color: Colors.blue,
                  onPressed: () {
                    addData();

                    //setelah add data kembali ke home

                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
