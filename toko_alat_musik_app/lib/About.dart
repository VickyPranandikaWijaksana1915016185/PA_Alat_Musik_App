import 'package:flutter/material.dart';

class InfoTokoMusik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 260,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage('assets/Music_Logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Informasi Toko Alat Musik',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  subtitle: Text(
                    '\nToko Alat Musik merupakan merupakan sebuah aplikasi yang menjual berbagai alat musik',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on),
                    Text('Jalan Jaksa Mamahit')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add_call),
                    Text('081251836533')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.mail_outline),
                    Text('vickypranandika@gmail.com')
                  ],
                ),
                SizedBox(
                  width: 30,
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.person),
                    Column(children: <Widget>[
                      Text('Nur Saputri Mine (1915016159)'),
                      Text('Muhammad Zidani Putra (1915016168)'),
                      Text('Fadil Hutomo Putra (1915016171)'),
                      Text('Vicky Pranandika Wijaksana (1915016185)'),
                    ]),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
