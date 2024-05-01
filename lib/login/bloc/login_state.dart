part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String title;
  const LoginState(this.title);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

final class LoginInitial extends LoginState {
  LoginInitial(super.title);

  @override
  List<Object> get props => [
    title,
  ];
}
