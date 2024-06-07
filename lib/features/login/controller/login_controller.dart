import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/routes/route_constant.dart';
import '../../../main.dart';

class LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  void handleLoginWithEmailAndPassword() {}

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
      await _auth.signInWithCredential(credential);

      // Update UI

      navKey.currentState
          !.pushNamedAndRemoveUntil(RouteConstant.tab, (route) => false);
      print("Successfully signed in");
    } catch (e) {
      print("Failed to sign in: $e");
    }
  }
}
