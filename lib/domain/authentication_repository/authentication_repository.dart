import 'package:flutter_firebase/domain/data_source/firebase_auth_service.dart';

abstract class AuthenticationRepository {
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String pass,
  });
}

class AuthenticationRepositoryImp extends AuthenticationRepository {
  final FirebaseAuthService firebaseAuthService;

  AuthenticationRepositoryImp({
    required this.firebaseAuthService,
  });

  @override
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String pass,
  }) async {
    try {
      await firebaseAuthService.loginWithEmailAndPassword(
        email: email,
        pass: pass,
      );
    } catch (e) {
      print(e);
    }
  }
}
