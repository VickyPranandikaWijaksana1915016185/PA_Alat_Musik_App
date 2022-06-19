// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ItemCardTransaksi extends StatelessWidget {
  final String image;
  final String user;
  final String barang;
  final int harga;
  final int jumlah;
  final String deskripsi;
  final String jenis;

  //// Pointer to Update Function
  final Function? onUpdate;
  final Function? onUpdate2;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemCardTransaksi(this.image, this.user, this.barang, this.harga, this.jumlah,
      this.deskripsi, this.jenis,
      {this.onUpdate, this.onUpdate2, this.onDelete});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String user = auth.currentUser!.email.toString();
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              height: 120,
              width: 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 169, 213, 250),
                  border: Border.all(width: 2, color: Colors.black)),
              child: Image.network(image),
            ),
            Column(children: [
              Container(
                width: 250,
                height: 30,
                color: Color.fromARGB(255, 169, 213, 250),
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "User : " + user,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                width: 250,
                height: 25,
                color: Color.fromARGB(255, 169, 213, 250),
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "Barang : " + barang,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                width: 250,
                height: 25,
                color: Color.fromARGB(255, 169, 213, 250),
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "RP. $harga",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 250,
                height: 40,
                color: Color.fromARGB(255, 169, 213, 250),
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "Jumlah : $jumlah",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
