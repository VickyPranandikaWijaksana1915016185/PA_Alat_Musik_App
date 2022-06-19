import 'package:flutter/material.dart';
import 'package:toko_alat_musik_app/Item_Card_Keranjang.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({Key? key}) : super(key: key);

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference keranjang = firestore.collection("Keranjang");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Expanded(
            //// VIEW DATA HERE
            child: StreamBuilder<QuerySnapshot>(
              stream: keranjang.where('Id', isEqualTo: uid).snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                if (snapshot.hasData) {
                  return GridView.count(
                      crossAxisCount: 1,
                      childAspectRatio: 3,
                      children: snapshot.data!.docs
                          .map(
                            (e) => ItemCardKeranjang(
                              e['Image'],
                              e['Barang'],
                              e['Harga'],
                              e['Jumlah'],
                              e['Deskripsi'],
                              e['Jenis'],
                              onUpdate: () {
                                keranjang.doc(e.id).update(
                                  {
                                    'Jumlah': e.get('Jumlah') + 1,
                                  },
                                );
                              },
                              onUpdate2: () {
                                keranjang.doc(e.id).update(
                                  {
                                    'Jumlah': e.get('Jumlah') - 1,
                                  },
                                );
                              },
                              onDelete: () {
                                keranjang.doc(e.id).delete();
                              },
                            ),
                          )
                          .toList());
                } else {
                  return Text("Barang Tidak Ada");
                }
              },
            ),
          ),
        ]),
      ]),
    );
  }
}
