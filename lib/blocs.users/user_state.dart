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
  final User? selectedUser; // Add this line
  UserLoadedState({required this.users, this.selectedUser});
  @override
  List<Object?> get props => [users, selectedUser];
}

class UserErrorState extends UserState {
  final String message;
  UserErrorState({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class DropdownItemSelectedUserState extends UserState {
  final User selectedUser;
  DropdownItemSelectedUserState({required this.selectedUser});
  @override
  // TODO: implement props
  List<Object?> get props => [selectedUser];
}