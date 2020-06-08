import 'package:flutter/material.dart';
//untuk datepicker


//untuk http package
import 'package:http/http.dart' as http;
import './home.dart';
import 'dart:async';

class InputPenjualan extends StatelessWidget {
  //membuat variabel untuk menampung list data penjualan
  //membuat variabel index dari list data
  final list;
  final index;
  //class constructor
  InputPenjualan({this.list, this.index});
  @override
  Widget build(BuildContext context) {
    //membuat material app
    return MaterialApp(
      //menampilkan judul transaksi baru jika index null
      title: index == null ? "Transaksi Baru" : "Update Transaksi",
      home: Scaffold(
        appBar: AppBar(
          title:
              index == null ? Text("Transaksi Baru") : Text("Update Transaksi"),
        ),
        //membuat body dalamsebuah class dengan parameter list dan index
        body: MyCustomForm(
          list: list,
          index: index,
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  final list;
  final index;
  MyCustomForm({this.list, this.index});
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  //membuat variabel untuk menampung validasi
  final _formKey = GlobalKey<FormState>();
  //membaca inputan dari textfield
  TextEditingController namaController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  //format datepicker
  final format = DateFormat('yyyy-MM-dd');
    //class future untuk membuat fungsi adddata sekaligus update data
    Future<http.Response> adddata(index) async {
      //jika index yang diterima bernilai null
      //dianggap data baru
      if (index == null) {
        //mengirim data ke web services
        //karena menggunakan class future, maka wajib mengembalikan nilai
        final http.Response response = await http.post("http://192.168.43.136/apiflutter/api/Penjualan/save", body: {
          //isian data dikirim dalam body
          //key disesuaiakn dengan parameter $_POST dalam web services
          //value diambil dari text dalam controller
          'nama': namaController.text,
          'keterangan': keteranganController.text,
          'jumlah': jumlahController.text,
          'tanggal': tanggalController.text,
        });
        return response;
      } else {
        final http.Response response = await http.post(
            "http://192.168.43.136/apiflutter/api/Penjualan/save_update",
            body: {
              'id': widget.list['id'],
              'nama': namaController.text,
              'keterangan': keteranganController.text,
              'jumlah': jumlahController.text,
              'tanggal': tanggalController.text,
            });
        return response;
      }
    }
  
    @override
  //untuk load pertama kali form dijalankan
    void initState() {
  //jika index null makan controller diisi dengan nilai kosong
      if (widget.index == null) {
        namaController = TextEditingController();
        keteranganController = TextEditingController();
        jumlahController = TextEditingController();
        tanggalController = TextEditingController();
      } else {
  //jika index tidak null
  //maka controller diisi dengan nilai dari variabel list sesuai dengan index dan name variabel
        namaController = TextEditingController(text: widget.list['nama']);
        keteranganController =
            TextEditingController(text: widget.list['keterangan']);
        jumlahController = TextEditingController(text: widget.list['jumlah']);
        tanggalController = TextEditingController(text: widget.list['tanggal']);
      }
      super.initState();
    }
  
    @override
    Widget build(BuildContext context) {
      //membuat form sesuai _formkey
      var dateTimeField = DateTimeField;
                  var dateTimeField2 = dateTimeField;
                                    return Form(
                                      key: _formKey,
                                      child: ListView(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                                //menggunakan validator, jika nilai kosong
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'Mohon isi Nama Lengkap';
                                                  }
                                                  return null;
                                                },
                                                //menampilkan controller dalam textfield
                                                controller: namaController,
                                                decoration: InputDecoration(
                                                  labelText: "Nama",
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(3.0)),
                                                )),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: TextFormField(
                                              controller: jumlahController,
                                              //textfield type number
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(
                                                labelText: "Jumlah",
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(3.0)),
                                              ),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Mohon diisi';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: TextFormField(
                                              controller: keteranganController,
                                              //textfield type number
                                              decoration: InputDecoration(
                                                labelText: "Keterangan",
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(3.0)),
                                              ),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Mohon isi Keterangan';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              children: <Widget>[
                                                //widget DateTimeField terdapat pada package datetime_picker_formfield
                                            //dateTimeField2
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          //tombol penyimpanan
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text("Simpan", textScaleFactor: 1.5),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                //jika lolos validator maka data dikirim ke fungsi adddata
                                adddata(widget.index);
                                //keluar form, kembali ke halaman home
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => new Home()));
                              }
                            },
                          ),
                        ),
                        Container(
                          width: 5.0,
                        ),
                        Expanded(
                          //untuk batal
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text("Batal", textScaleFactor: 1.5),
                            onPressed: () {
                              //batal, kembali ke halaman home
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => new Home()));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        }
      
      class DateTimeField {
}
  
  DateFormat(String s) {
}
