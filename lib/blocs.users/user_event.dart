part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable{
  const UserEvent();
}

class UserLoadEvent extends UserEvent {
  @override
  List<Object> get props => [];
}

class UserLoadedEvent extends UserEvent {
  final UserListData users;
  const UserLoadedEvent({required this.users});
  @override
  List<Object> get props => [users];
}

class DropdownItemSelectedUserEvent extends UserEvent {
  final User selectedUser;
  const DropdownItemSelectedUserEvent({required this.selectedUser});
  @override
  // TODO: implement props
  List<Object?> get props => [selectedUser];
}