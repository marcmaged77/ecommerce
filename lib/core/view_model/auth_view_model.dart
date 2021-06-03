import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';











//gextController very good for memory leak

class AuthViewModel extends GetxController {


  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth =FirebaseAuth.instance;
  late String name;
  late String email;
  late String imageUrl;




  Future<String?> googleSignInMethod() async {

    await Firebase.initializeApp();


    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      assert(user.email != null);
      assert(user.displayName != null);
      assert(user.photoURL != null);

      name = user.displayName!;
      email = user.email!;
      imageUrl = user.photoURL!;



      final User? currentUser = _auth.currentUser;
      assert(user.uid == currentUser!.uid);

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('email', email);
      // prefs.setString('name', name);
      // prefs.setString('imageUrl', imageUrl);


      print('signInWithGoogle succeeded: $user');
      print(name);
      print(email);


      return '$user';
    }

    return null;
  }








  void signOutGoogle() async{
    await _googleSignIn.signOut();

    print("User Signed Out");
  }

// void googleSignInMethod() async {
//
// final GoogleSignInAccount? googleUser =  await _googleSignIn.signIn();
//
// final GoogleSignInAuthentication googleSignInAuthentication = await googleUser!.authentication;
// final AuthCredential credential = GoogleAuthProvider.credential(
//   idToken: googleSignInAuthentication.idToken,
//   accessToken: googleSignInAuthentication.accessToken
// );
// UserCredential userCredential = await _auth.signInWithCredential(credential);
//
//
// print(userCredential);
// print(googleUser);
//
//
// }
//
// void signOutGoogle() async{
//   await _googleSignIn.signOut();
//
// }





// first function to run
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  //
  // when the widget is ready on screen
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  //
  // when the controller is deleted from memory
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }






}

