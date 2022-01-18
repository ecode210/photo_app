import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class Photo extends ChangeNotifier {
  File? image;

  void launchURL(String urlString) async {
    if (await canLaunch(urlString)) {
      await launch(urlString);
    }
  }

  Future selectImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      final tempImage = File(image.path);
      this.image = tempImage;
      notifyListeners();
    }
  }

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile', 'openid'],
  );
  GoogleSignInAccount? user;

  Future<UserCredential> googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      user = googleUser;
    }
    final googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future googleLogout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
