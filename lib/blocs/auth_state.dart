part of 'auth_bloc.dart';


abstract class AuthState extends Equatable {

}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthSuccessState extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthLoadingState extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthErrorState extends AuthState{

  final String message;
  AuthErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
