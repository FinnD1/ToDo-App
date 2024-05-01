import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String pass,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
    } catch (e) {
      return;
    }
  }
}
