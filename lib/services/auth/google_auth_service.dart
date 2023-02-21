import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media_box/screens/settings/settings.dart';

class GoogleAuthService extends GetxController {
  RxBool isSignIn = false.obs;
  void setIsSignIN(newValue) {
    isSignIn.value = newValue;
    update();
  }

  @override
  onInit() {
    super.onInit();
    if (FirebaseAuth.instance.currentUser != null) {
      setIsSignIN(true);
    } else {
      setIsSignIN(false);
    }
    handleAuthState();
  }

  //handle auth state
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          setIsSignIN(true);
        } else {
          setIsSignIN(false);
        }
        return const SettingsScreen();
      },
    );
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(() => setIsSignIN(true));
  }

  signOut() async {
    FirebaseAuth.instance
        .signOut()
        .whenComplete(() => setIsSignIN(false))
        .whenComplete(() async => await DefaultCacheManager().emptyCache());
  }
}
