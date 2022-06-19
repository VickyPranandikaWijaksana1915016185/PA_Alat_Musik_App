// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toko_alat_musik_app/auth_services.dart';
import 'package:toko_alat_musik_app/Sign_In_Page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/sign_up";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool showSpinner = false;
  bool isPassHidden = true;
  String error = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cpassController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController notelpController = TextEditingController();

  final maskFormatter = new MaskTextInputFormatter(mask: '####-####-####');
  // final _auth = FirebaseAuth.instance;
  // static FirebaseAuth _auth = FirebaseAuth.instance;
  // User firebaseUser = Provider.of<User>(context);

  static FirebaseFirestore firestores = FirebaseFirestore.instance;
  CollectionReference users = firestores.collection('Users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 120),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Sign Up\n",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(fontSize: 35.0, color: Colors.black),
                    ),
                    TextSpan(text: "\n"),
                    TextSpan(
                      text: "Silahkan isi data di bawah ini untuk membuat akun",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                    ),
                    TextSpan(
                      text: error != ''
                          ? "Silahkan isi data di bawah ini untuk membuat akun"
                          : '',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 40, left: 40, top: 40),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Nama",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        controller: namaController,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 40, left: 40, top: 25),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "No Telepon",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        controller: notelpController,
                      ),
                    ),
                  ],
                ),
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
                          hintText: "Email",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        controller: emailController,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40, top: 25),
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
                      child: buildTextField("Password", passController),
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
                        color: Colors.black87,
                      ),
                    ),
                    Expanded(
                      child: buildTextField(
                          "Konfirmasi Password", cpassController),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: 40, left: 40, top: 0, bottom: 30),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.house,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Alamat",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        controller: alamatController,
                      ),
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
                    setState(() {
                      showSpinner = true;
                    });
                    if (passController.text == cpassController.text) {
                      await AuthServices.signUp(
                        emailController.text,
                        passController.text,
                      );
                      await userSetup(emailController.text, namaController.text,
                              notelpController.text, alamatController.text)
                          .then((value) => Get.to(SignInScreen()));
                    } else {
                      setState(() {
                        error = "Konfirmasi Password yang anda masukkan salah";
                      });
                    }
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
                        EdgeInsets.symmetric(horizontal: 60.0, vertical: 13),
                    child: Text(
                      "Daftar",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontSize: 17.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, TextEditingController controller) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
        suffixIcon: hintText == "Password"
            ? IconButton(
                onPressed: _togglePassView,
                icon: isPassHidden
                    ? Icon(
                        Icons.visibility_off,
                        color: Colors.black,
                      )
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      style: TextStyle(
        color: Colors.black,
      ),
      controller: controller,
      obscureText: hintText == "Password" || hintText == "Konfirmasi Password"
          ? isPassHidden
          : false,
      enableSuggestions: false,
      autocorrect: false,
    );
  }

  void _togglePassView() {
    setState(() {
      isPassHidden = !isPassHidden;
    });
  }
}
