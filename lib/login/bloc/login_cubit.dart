import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/authentication_repository/authentication_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository authenticationRepository;

  LoginCubit({required  this.authenticationRepository}) : super(LoginInitial(""));

  Future<void> login(String email, String pass) async {
    print("login with $email vs $pass");
    try {
      await authenticationRepository.loginWithEmailAndPassword(
          email: email, pass: pass);
    } catch (e) {}
  }
}
