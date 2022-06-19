// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ItemCardProfil extends StatelessWidget {
  final String nama;
  final String notelp;
  final String alamat;

  ItemCardProfil(
    this.nama,
    this.notelp,
    this.alamat,
  );

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String? user = auth.currentUser!.email.toString();
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Container(
              width: 500,
              height: 60,
              color: Color.fromARGB(255, 169, 213, 250),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "User : " + user,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 500,
              height: 60,
              color: Color.fromARGB(255, 169, 213, 250),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.left,
                "Nama : " + nama,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 500,
              height: 60,
              color: Color.fromARGB(255, 169, 213, 250),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Nomor Telepon : " + notelp,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 500,
              height: 60,
              color: Color.fromARGB(255, 169, 213, 250),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Alamat : " + alamat,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
