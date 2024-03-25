part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable{}

class UserInitial extends UserState {

  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  List<User> users;
  UserLoadedState({required this.users});
  @override
  List<Object> get props => [users];
}

class UserErrorState extends UserState {
  final String message;
  UserErrorState({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}