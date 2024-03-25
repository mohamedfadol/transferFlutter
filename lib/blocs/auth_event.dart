part of 'auth_bloc.dart';
@immutable
abstract class AuthEvent extends Equatable {

}

class LoginEvent extends AuthEvent{
  final String email;
  final String password;
  LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];

}


class RegisterEvent extends AuthEvent{
  final String email;
  final String password;
  RegisterEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];

}