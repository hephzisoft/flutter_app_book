import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/global_loader/global_loader.dart';
import '../../../common/routes/route_constant.dart';
import '../../../common/services/auth_error_handling.dart';
import '../../../common/utils/constants.dart';
import '../../../common/widgets/popup_message.dart';
import '../../../global.dart';
import '../../../main.dart';
import '../provider/register_notifier.dart';

class RegisterController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void handleRegisterWithEmailAndPassword(WidgetRef ref) async {
    var state = ref.read(registerNotifierProvider);
    ref.watch(globalLoaderProvider.notifier).setLoaderValue(true);

    try {
      var credential = await _auth.createUserWithEmailAndPassword(
          email: state.email, password: state.password);

      if (credential.user == null) return;
      await _auth.currentUser!.sendEmailVerification();
      toastInfo('A verification email has been sent');

      navKey.currentState!.pushNamedAndRemoveUntil(RouteConstant.tab, (route)=>false);
    } on FirebaseAuthException catch (e) {
      toastInfo(checkError(e.code));
    } finally {
      ref.watch(globalLoaderProvider.notifier).setLoaderValue(false);
    }
  }

  void handleGoogleSignIn(WidgetRef ref) async {
    ref.watch(globalLoaderProvider.notifier).setLoaderValue(true);
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount == null) toastInfo('Could not sign in');
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential = await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        Global.storageService
            .setString(AppConstant.userToken, userCredential.user!.uid);

        toastInfo('Welcome ${userCredential.user!.displayName}');
      }

      navKey.currentState!.pushNamedAndRemoveUntil(RouteConstant.tab, (route)=>false);
    } on PlatformException catch (e) {
      toastInfo(e.code);
    } on FirebaseAuthException catch (e) {
      toastInfo(checkError(e.code));
    } finally {
      ref.watch(globalLoaderProvider.notifier).setLoaderValue(false);
    }
  }
}
