import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:souq/view/HomeScreen/home_screen.dart';

//gextController very good for memory leak

class AuthViewModel extends GetxController {
  //google instance
  GoogleSignIn _googleSignIn = GoogleSignIn();

  //facebook instance
  // FacebookLogin _facebookLogin = FacebookLogin();
  static final FacebookLogin _facebookLogin = new FacebookLogin();

  //firebase instance
 static final FirebaseAuth _auth = FirebaseAuth.instance;

  late String email, password, name;


  late  String imageUrl;



  //SIGN UP METHOD
  Future signUp({ required String email, required String password, }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // SIGN IN METHOD
  void signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print(email);
      Get.offAll(homeScreen(email: email,));
    } on FirebaseAuthException catch (e) {
      print( e.message);
      Get.snackbar("error", e.toString(), colorText: Colors.black, snackPosition: SnackPosition.TOP);
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    await _auth.signOut();

    print('signout');
  }



  // void signInEmail() async{
  //
  //   // try{
  //   //  await  _auth.signInWithEmailAndPassword(email: email, password: password);
  //   //  return null;
  //   // }catch(e){
  //   //   print(e);
  //   //   Get.snackbar("error", e.toString(), colorText: Colors.black, snackPosition: SnackPosition.TOP);
  //
  //
  //   try {
  //     final user = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     if (user != null) {
  //       print(email);
  //     }
  //
  //
  //
  //   } catch (e) {
  //     print(e);
  //
  //   }
  //
  //
  //
  //
  // }





void facebookSignInMethod() async{
  FacebookLoginResult result = await _facebookLogin.logInWithReadPermissions(['email']);

final accessToken = result.accessToken.token;
print(result.status);
print("facebook username : ${FacebookAuthProvider.FACEBOOK_SIGN_IN_METHOD}");
if(result.status == FacebookLoginStatus.loggedIn){
  final faceCredential = FacebookAuthProvider.credential(accessToken);
  await _auth.signInWithCredential(faceCredential);
}

}


  void signOutFacebook() async {
    await _facebookLogin.logOut();

    print("User Signed Out from facebook");
  }


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

  void signOutGoogle() async {
    await _googleSignIn.signOut();

    print("User Signed Out from google");
  }






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
