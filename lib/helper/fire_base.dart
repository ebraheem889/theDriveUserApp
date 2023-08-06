import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  static Future<String?> verifyPhoneNumber(String phoneNumber) async {
    final completer = Completer<String?>();

    // await FirebaseAuth.instance.setSettings(
    //   appVerificationDisabledForTesting: false,
    // );

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        log("phoneAuthCredential=============================>$credential");
      },
      timeout: Duration(seconds: 70),
      verificationFailed: (FirebaseAuthException e) {
        completer.complete(null);
        log("erorr========================================>$e");
      },
      codeSent: (String verifyId, int? resendToken) {
        completer.complete(verifyId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );

    return completer.future;
  }

  static Future<bool> signInWithCredential(
      {required String verificationId, required String smsCode}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e);
      return false;
    }
  }
}
