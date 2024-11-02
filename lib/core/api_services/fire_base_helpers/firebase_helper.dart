import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  FirebaseAuth auth = FirebaseAuth.instance;

Future  loginUser(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
