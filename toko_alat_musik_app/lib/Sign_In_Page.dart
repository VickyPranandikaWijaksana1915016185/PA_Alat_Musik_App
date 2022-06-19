// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toko_alat_musik_app/auth_services.dart';
import 'package:toko_alat_musik_app/Sign_Up_Page.dart';
import 'package:toko_alat_musik_app/halamanpage.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/sign_in";
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPassHidden = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  //firestore
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference login = firestore.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset(
              "assets/Music_Logo.png",
              width: 100.0,
            ),
          ),
          Text(
            "Sign In",
            style:
                Theme.of(context).textTheme.headline4?.copyWith(fontSize: 35.0),
          ),
          Padding(
            padding: EdgeInsets.only(right: 40, left: 40, top: 25),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.alternate_email,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Masukkan Email Di Sini",
                    ),
                    controller: emailController,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: buildTextField("Password"),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 15,
            ),
            child: ElevatedButton(
              onPressed: () async {
                await AuthServices.signIn(
                        emailController.text, passController.text)
                    .then((value) => Get.to(HalamanPage()));
                // Navigator.pushNamed(context, HomePageScreen.routeName);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 126, 173, 211)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 100.0, vertical: 13.0),
                child: Text(
                  "Masuk",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontSize: 17.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: FittedBox(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 40.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Belum punya akun? ",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "Daftar di sini",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: hintText == "Password"
            ? IconButton(
                onPressed: _togglePassView,
                icon: isPassHidden
                    ? Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      )
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      controller: passController,
      obscureText: hintText == "Password" ? isPassHidden : false,
      enableSuggestions: false,
      autocorrect: false,
    );
  }

  void _togglePassView() {
    setState(() {
      isPassHidden = !isPassHidden;
    });
  }

  // void loginProcess(String email, String pass) {
  //   login.add({
  //     'email': email,
  //     'pass': pass,
  //   });
  // }
}
