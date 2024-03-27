import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:transfer_flutter/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  var logger = Logger();
  final UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserInitial()) {
    on<UserLoadEvent>((event, emit) async{
      emit(UserLoadingState());
      try{
        final List<User> users = await userRepository.fetchUsers();
        logger.i(users);
        emit(UserLoadedState(users: users));
      }catch (e){
        emit(UserErrorState(message: e.toString()));
      }
    });

    on<DropdownItemSelectedUserEvent>((event, emit) {
      // No need to fetch the user again if we already have the list and the selected user
      // Directly emit UserLoadedState with updated selectedUser
      if (state is UserLoadedState) {
        emit(UserLoadedState(users: (state as UserLoadedState).users, selectedUser: event.selectedUser));
      }
    });




  }



}
