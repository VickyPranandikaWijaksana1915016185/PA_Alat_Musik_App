// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ItemCardKeranjang extends StatelessWidget {
  final String image;
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

  ItemCardKeranjang(this.image, this.barang, this.harga, this.jumlah,
      this.deskripsi, this.jenis,
      {this.onUpdate, this.onUpdate2, this.onDelete});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String? user = auth.currentUser!.email;
    String? uid = auth.currentUser!.uid;
    CollectionReference transaksi = firestore.collection("Transaksi");
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(image),
            ),
            Column(children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  barang,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                child: Text(
                  "RP. $harga",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            SizedBox(
              width: 30,
              height: 80,
            ),
            Column(children: [
              Row(children: [
                SizedBox(
                  height: 40,
                  width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary: Colors.white,
                      ),
                      child: Center(
                          child: Icon(
                        Icons.remove,
                        color: Colors.black,
                      )),
                      onPressed: () {
                        if (onUpdate2 != null) onUpdate2!();
                      }),
                ),
                new Container(
                  padding: EdgeInsets.all(10),
                  height: 35,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 199, 191, 191),
                  ),
                  child: Text(
                    '$jumlah',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary: Colors.white,
                      ),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        color: Colors.black,
                      )),
                      onPressed: () {
                        if (onUpdate != null) onUpdate!();
                      }),
                ),
              ]),
              SizedBox(
                width: 30,
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: Colors.white,
                        ),
                        child: Center(
                            child: Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        )),
                        onPressed: () {
                          Get.snackbar(
                            "Sukses",
                            "Data Dimasukkan Ke Transaksi",
                            animationDuration: Duration(milliseconds: 200),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.blue,
                            borderColor: Colors.black,
                            borderWidth: 5,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          transaksi.add({
                            'Image': image,
                            'Barang': barang,
                            'Jumlah': jumlah,
                            'Harga': harga * jumlah,
                            'Deskripsi': deskripsi,
                            'Jenis': jenis,
                            'User': user,
                            'Id': uid,
                          });
                          if (onDelete != null) onDelete!();
                        }),
                  ),
                  SizedBox(
                    height: 40,
                    width: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: Colors.white,
                        ),
                        child: Center(
                            child: Icon(
                          Icons.cancel,
                          color: Colors.black,
                        )),
                        onPressed: () {
                          Get.snackbar(
                            "Sukses",
                            "Data Dihapus Dari Keranjang",
                            animationDuration: Duration(milliseconds: 200),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.blue,
                            borderColor: Colors.black,
                            borderWidth: 5,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          if (onDelete != null) onDelete!();
                        }),
                  )
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }
}
