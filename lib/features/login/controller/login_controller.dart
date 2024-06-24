
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/routes/route_constant.dart';
import '../../../common/services/auth_error_handling.dart';
import '../../../common/utils/constants.dart';
import '../../../common/widgets/popup_message.dart';
import '../../../global.dart';
import '../../../main.dart';
import '../provider/login_notifier.dart';

class LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void handleLoginWithEmailAndPassword(WidgetRef ref) async {
    var state = ref.read(loginNotifierProvider);

    try {
      var credential = await _auth.signInWithEmailAndPassword(
          email: state.email, password: state.password);

      if (credential.user != null) {
        Global.storageService
            .setString(AppConstant.userToken, credential.user!.uid);


      }
    } on FirebaseAuthException catch (e) {
      var message = 'An error occurred';
    } finally {

    }
  }

  void handleGoogleSignIn() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();

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

      navKey.currentState!.pushNamed(RouteConstant.tab);
    } on PlatformException catch (e) {
      checkError(e.code);
    } finally{

    }
  }


}
