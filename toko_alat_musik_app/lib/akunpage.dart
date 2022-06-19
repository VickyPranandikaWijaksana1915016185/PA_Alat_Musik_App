// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toko_alat_musik_app/About.dart';
import 'package:toko_alat_musik_app/Sign_In_Page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'Item_Card_Profil.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({Key? key}) : super(key: key);

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String? uid = auth.currentUser!.uid.toString();
    CollectionReference users = firestore.collection("Users");
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: users.where('Uid', isEqualTo: uid).snapshots(),
          builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            if (snapshot.hasData) {
              return Column(
                  children: snapshot.data!.docs
                      .map(
                        (e) =>
                            ItemCardProfil(e['Nama'], e['NoTelp'], e['Alamat']),
                      )
                      .toList());
            } else {
              return Text("Barang Tidak Ada");
            }
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                "Toko Musik App",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("About"),
              onTap: () {
                Get.to(InfoTokoMusik());
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Exit"),
              onTap: () {
                Get.off(SignInScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
