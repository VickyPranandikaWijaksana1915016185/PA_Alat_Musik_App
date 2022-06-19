// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toko_alat_musik_app/halamanpage.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  final String image;
  final String barang;
  final int harga;
  final String deskripsi;
  final String jenis;

  int jumlah = 1;

  //// Pointer to Update Function
  final Function? onUpdate;

  final Function? onUpdate2;
  //// Pointer to Delete Function
  final Function? onDelete;

  DetailScreen(this.image, this.barang, this.harga, this.deskripsi, this.jenis,
      {this.onUpdate, this.onUpdate2, this.onDelete});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String? user = auth.currentUser!.email;
    String? uid = auth.currentUser!.uid;

    CollectionReference keranjang = firestore.collection("Keranjang");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        iconTheme: IconThemeData(opacity: 20, size: 30, color: Colors.white),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffacfff),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
                child: Image.network(image),
              ),
            ),
            Expanded(
                child: Container(
              color: Color.fromARGB(255, 255, 255, 255),
              child: ListTile(
                title: Column(
                  children: <Widget>[
                    Text(
                      barang,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "RP. $harga",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Text(
                      'Tentang Produk',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      deskripsi,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Container(
                        height: 58,
                        width: 200,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Color.fromARGB(255, 169, 213, 250),
                          onPressed: () {
                            Get.snackbar(
                              "Sukses",
                              "Barang Dimasukkan Ke Keranjang",
                              animationDuration: Duration(milliseconds: 200),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.blue,
                              borderColor: Colors.black,
                              borderWidth: 5,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                            keranjang.add({
                              'Image': image,
                              'Barang': barang,
                              'Jumlah': 1,
                              'Harga': harga,
                              'Deskripsi': deskripsi,
                              'Jenis': jenis,
                              'User': user,
                              'Id': uid,
                            });
                            Get.to(HalamanPage());
                          },
                          child: Text('Tambah ke Keranjang'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
