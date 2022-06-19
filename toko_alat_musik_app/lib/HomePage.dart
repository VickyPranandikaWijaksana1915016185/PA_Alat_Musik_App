// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toko_alat_musik_app/Item_Card.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference alat = firestore.collection("Alat");
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            //// VIEW DATA HERE
            child: StreamBuilder<QuerySnapshot>(
              stream: alat.snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                if (snapshot.hasData) {
                  return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      children: snapshot.data!.docs
                          .map((e) => ItemCard(
                                e['Image'],
                                e['Barang'],
                                e['Harga'],
                                e['Deskripsi'],
                                e['Jenis'],
                              ))
                          .toList());
                } else {
                  return Text("Barang Habis");
                }
              },
            ),
          ),
        ]);
  }
}

class LauncherPage1 extends StatefulWidget {
  const LauncherPage1({Key? key}) : super(key: key);

  @override
  State<LauncherPage1> createState() => _LauncherPageState1();
}

class _LauncherPageState1 extends State<LauncherPage1> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference alat = firestore.collection("Alat");
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            //// VIEW DATA HERE
            child: StreamBuilder<QuerySnapshot>(
              stream: alat.where('Jenis', isEqualTo: 'Modern').snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                if (snapshot.hasData) {
                  return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      children: snapshot.data!.docs
                          .map((e) => ItemCard(e['Image'], e['Barang'],
                              e['Harga'], e['Deskripsi'], e['Jenis']))
                          .toList());
                } else {
                  return Text("Barang Habis");
                }
              },
            ),
          ),
        ]);
  }
}

class LauncherPage2 extends StatefulWidget {
  const LauncherPage2({Key? key}) : super(key: key);

  @override
  State<LauncherPage2> createState() => _LauncherPageState2();
}

class _LauncherPageState2 extends State<LauncherPage2> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference alat = firestore.collection("Alat");
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            //// VIEW DATA HERE
            child: StreamBuilder<QuerySnapshot>(
              stream: alat.where('Jenis', isEqualTo: 'Tradisional').snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                if (snapshot.hasData) {
                  return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      children: snapshot.data!.docs
                          .map((e) => ItemCard(e['Image'], e['Barang'],
                              e['Harga'], e['Deskripsi'], e['Jenis']))
                          .toList());
                } else {
                  return Text("Barang Habis");
                }
              },
            ),
          ),
        ]);
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 55,
      margin: EdgeInsets.only(top: 50),
      alignment: Alignment.center,
      child: ElevatedButton(
        child: Text("Pesan"),
        style: ElevatedButton.styleFrom(
            primary: Color(0xFF023E4A),
            onPrimary: Colors.white,
            padding: EdgeInsets.all(10.0),
            minimumSize: Size(200, 180)),
        onPressed: () {
          final mySnackBar = SnackBar(
            content: Text(
              "Berhasil Dimasukan di Keranjang",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            duration: Duration(seconds: 3),
            padding: EdgeInsets.all(10),
            backgroundColor: Colors.blue,
          );
          ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
        },
      ),
    );
  }
}
