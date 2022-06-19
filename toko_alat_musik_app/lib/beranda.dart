// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:toko_alat_musik_app/HomePage.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  static final List<Widget> tabBar = [
    Tab(text: "Semua"),
    Tab(text: "Modern"),
    Tab(text: "Tradisonal"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabBar.length,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            onTap: () {},
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search, color: Colors.blue),
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: new BorderSide(color: Colors.white),
                ),
                fillColor: Color(0xfff3f3f4),
                filled: true),
          ),
          backgroundColor: Colors.blue,
          bottom: TabBar(tabs: tabBar),
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(
          children: [
            LauncherPage(),
            LauncherPage1(),
            LauncherPage2(),
          ],
        ),
      ),
    );
  }
}
