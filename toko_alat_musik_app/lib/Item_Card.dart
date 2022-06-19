// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:toko_alat_musik_app/Detailpage.dart';

// ignore: must_be_immutable
class ItemCard extends StatelessWidget {
  final String image;
  final String barang;
  final int harga;
  final String deskripsi;
  final String jenis;

  int Jumlah = 1;

  //// Pointer to Update Function
  final Function? onUpdate;

  final Function? onUpdate2;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemCard(this.image, this.barang, this.harga, this.deskripsi, this.jenis,
      {this.onUpdate, this.onUpdate2, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      InkWell(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 180,
            width: 160,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(16)),
            child: Image.network(image),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              barang,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Text(
            "RP. $harga",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ]),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  (DetailScreen(image, barang, harga, deskripsi, jenis)),
            ),
          );
        },
      ),
    ]);
  }
}
