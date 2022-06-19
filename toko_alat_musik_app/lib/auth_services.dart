import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

Future<void> userSetup(
    String email, String nama, String noTelp, String alamat) async {
  CollectionReference users = FirebaseFirestore.instance.collection("Users");
  FirebaseAuth _auth = FirebaseAuth.instance;
  String uid = _auth.currentUser!.uid.toString();
  users.add({
    'Uid': uid,
    'Email': email,
    'Nama': nama,
    'NoTelp': noTelp,
    'Alamat': alamat
  });
  return;
}

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User> signUp(String email, String pass) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);

      User user = result.user!;
      print(result.user!.uid);

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {}
      // ignore: null_check_always_fails
      return null!;
    }
  }

  static Future<User> signIn(String email, String pass) async {
    // try {
    UserCredential result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );
    User user = result.user!;
    print(result.user!.uid);
    return user;
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static final userTransformer = StreamTransformer<User, User>.fromHandlers(
    handleData: (value, sink) => sink.add(_auth.currentUser!),
  );

  static Stream<User> get firebaseUserStream {
    return _auth.authStateChanges().transform(userTransformer);
  }

  static Stream<User?> get userStream => _auth.authStateChanges();
}

class SignInOutResult {
  User? user;
  String? message;

  SignInOutResult({this.user, this.message});
}
