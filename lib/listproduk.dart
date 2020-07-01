import  'package:flutter/material.dart';
//import  terlebih  dahulu  halaman  yang  diperlukan 
import  './detail_produk.dart';
//Top  Level/Root
void  main()  =>  runApp(MyApp());


class  MyApp  extends  StatelessWidget  {
@override

Widget  build(BuildContext  context)  {

return  MaterialApp(
title:  'First  App',

home:  MyHomePage(),
);
}
}

class  MyHomePage  extends  StatelessWidget  { @override
Widget  build(BuildContext  context)  {
return  Scaffold(

appBar:  AppBar(title:  Text("Product  Listing")),

body:  ListView(
shrinkWrap:  true,

padding:  const  EdgeInsets.fromLTRB(2.0,  10.0,  2.0,  10.0),

children:  <Widget>[

new  GestureDetector(

onTap:  ()  {

Navigator.of(context).push(new  MaterialPageRoute(

builder:  (BuildContext  context)  =>  DetailProduk(
name:  "Kedai Nanu",
description:  "Kedai Nanu adalah sebuah tempat Makanan yang terletak pada Kota Badung, sebelah selatan Kota Denpasar, Bali, Indonesia. Daerah ini merupakan sebuah tujuan Tempat makan bagi suka nongkrong mancanegara dan telah menjadi objek wisata andalan Pulau Bali sejak awal tahun 1970-an",
price:  1000,
image:  "nanu.jpg", star:  1,
),
));
},

child:  ProductBox(

name:  "Kedai Nanu",
description:  "Kedai Nanu terletak di....", 
price:  1000,
image:  "nanu1.jpg",),
),


new  GestureDetector( 
  onTap:  ()  {
Navigator.of(context).push(new  MaterialPageRoute( 
  builder:  (BuildContext  context)  =>  DetailProduk(
name:  "Pizza Hot",
description:  "Pizza adalah makanan khas populer yang gurih, adonan yang bundar, dan pipih dipanggang,dan siap di sajikan.",

price:  800,
image:  "pizza.jpg", star:  4,
),
));
},
child:  ProductBox( 
name:  "Rujak Gula",
description:  "Rujak gula adalah buah yang berjenis asam, ",  
price:  800,
image:  "rujak.jpg",)),



new  GestureDetector( 
  onTap:  ()  {
Navigator.of(context).push(
  new  MaterialPageRoute( 
    builder:  (BuildContext  context)  =>  DetailProduk(
name:  "Mozito",
description:  "Mozito adalah minuman yang bersoda, dan banyak parian rasa juga. ",

price:  2000,
image:  "mozito.jpg", star:  3,
),
));
},

child:  ProductBox( name:  "ice elemon tea",
description:  "ice elemon tea adalah minuman yang manis", price:  2000,
image:  "ice.jpg",),
),


new  GestureDetector( onTap:  ()  {
Navigator.of(context).push(new  MaterialPageRoute( builder:  (BuildContext  context)  =>  DetailProduk(
name:  "ayam bakar",
description:  "ayam bakar adalah, daging yang di panggang, dan siap di makan.",

price:  1500,
image:  "ayam.jpg", star:  3,
),
));
},
child:  ProductBox( 
name:  "Ayam Gprek",
description:"Ayam Gprek adalah, ayam yg di goreng dan berisi sambel mentah", 
price:  1500,
image:  "gprek.jpg",),
),


new  GestureDetector( onTap:  ()  {
Navigator.of(context).push(new  MaterialPageRoute( builder:  (BuildContext  context)  =>  DetailProduk(
name:  "Burger",
description:  "Burger adalah, makan roti yg di panggang, dan siap di makan, di dalamnya berisi sayur mentah dan daging yg di panggang.",
price:  100,
image:  "burger.jpg", star:  5,
),
));
},

child:  ProductBox( name:  "Burger",
description:  "Burger adalah makanan...", 
price:  100,
image:  "burger.jpg",
),	),
],
));
}}

//menggunakan  widget  StatelessWidget
class  ProductBox  extends  StatelessWidget  {
//deklarasi  variabel  yang  diterima  dari  MyHomePage
ProductBox({Key  key,  this.name,  this.description,  this.price,  this.image})
:  super(key:  key);
//menampung  variabel  yang  diterima  untuk  dapat  digunakan  pada  class  ini
final  String  name;
final  String  description; 
final  int  price;
final  String  image;

Widget  build(BuildContext  context)  {
//menggunakan  widget  container 
return  Container(
//padding
      padding:  EdgeInsets.all(2),
      //  height:  120,
      //menggunakan  widget  card 
      child:  Card(
      //membuat  tampilan  secara  horisontal  antar  image  dan  deskripsi 
      child:  Row(mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
      //children  digunakan  untuk  menampung  banyak  widget 
      children:  <Widget>[
      Image.asset( "assets/appimages/"  +  image, width:  150,
      ),
      Expanded(
      //child  digunakan  untuk  menampung  satu  widget 
      child:  Container(
      padding:  EdgeInsets.all(5),
      //membuat  tampilan  secara  vertikal 
      child:  Column(
      mainAxisAlignment:  MainAxisAlignment.start,
      //ini  isi  tampilan  vertikal  tersebut 
      children:  <Widget>[
      //menampilkan  variabel  menggunakan  widget  text 
      Text(this.name,
      style:  TextStyle(fontWeight:  FontWeight.bold,)), Text(this.description),
      Text(
      "Price:  "  +  this.price.toString(), style:  TextStyle(color:  Colors.red),
      ),
      //menampilkan  widget  icon    dibungkus  dengan  row 
      Row(
      children:  <Widget>[ Row(
      children:  <Widget>[
      Icon(Icons.star,  size:  10,  color:  Colors.deepOrange,),
      Icon(Icons.star,  size:  10,  color:  Colors.deepOrange,), 
      Icon(Icons.star,  size:  10,  color:  Colors.deepOrange,), 
      Icon(Icons.star,  size:  10,  color:  Colors.orange),
              ],
             )
           ],
          )
        ],
      )))
    ])));
  }
}