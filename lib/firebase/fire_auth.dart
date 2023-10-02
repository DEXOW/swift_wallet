import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swift_wallet/models/snackbar.dart';

class FireAuth {
  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    User? user;
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Error code ${e.code}');
      if (e.code == 'user-not-found' || e.code == 'wrong-password' || e.code == 'INVALID_LOGIN_CREDENTIALS') {
        SnackBarNotify.showSnackBar(context: context, message: 'Invalid Email or Password', bgcolor: Colors.red, textColor: Colors.white);
      }
    }
    return user;
  }

  static Future<User?> registerUsingEmailPassword({
    required String firstName,
    required String lastName,
    required String otherNames,
    required String email,
    required String password,
    required String dob,
    required String country,
    required String phoneNoCode,
    required String phoneNo,
    required context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user;
    try {
      UserCredential userCredential;
      await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      ).then((value) async{
        userCredential = value;
        user = userCredential.user;
        await user!.updateDisplayName("${firstName.trim()} ${lastName.trim()}");
        await user!.reload();
        user = auth.currentUser;
      }).then((value) async {
        await firestore.collection('users').doc(user!.uid).set({
          'firstName': firstName.trim(),
          'lastName': lastName.trim(),
          'otherNames': otherNames.trim(),
          'email': email.trim(),
          'dob': DateTime.parse(dob.trim()),
          'country': country.trim(),
          'phoneNoCode': phoneNoCode.trim(),
          'phoneNo': phoneNo.trim(),
          'profilePic': '',
        });
      });
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    } catch (e) {
      SnackBarNotify.showSnackBar(context: context, message: 'Something Went Wrong!', bgcolor: Colors.amber, textColor: Colors.black);
      throw Exception(e);
    }
    return user;
  }
}