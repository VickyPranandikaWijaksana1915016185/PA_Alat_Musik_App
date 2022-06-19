// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:toko_alat_musik_app/beranda.dart';
import 'package:toko_alat_musik_app/keranjangpage.dart';
import 'package:toko_alat_musik_app/transaksipage.dart';
import 'package:toko_alat_musik_app/akunpage.dart';

class HalamanPage extends StatefulWidget {
  @override
  State<HalamanPage> createState() => _HalamanPageState();
}

class _HalamanPageState extends State<HalamanPage> {
  int _bottomNavCurrenntIndex = 0;
  List<Widget> _container = [
    Beranda(),
    KeranjangPage(),
    TransaksiPage(),
    AkunPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavCurrenntIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _bottomNavCurrenntIndex = index;
          });
        },
        currentIndex: _bottomNavCurrenntIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Keranjang",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz_sharp),
            label: "Transaki",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
