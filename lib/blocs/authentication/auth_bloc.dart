
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import '../../repository/auth_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  var logger = Logger();
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {

    // first event login
    on<LoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      final result = await authRepository.login(event.email, event.password);
      logger.i(result);
      if(result['success'] == true){
        emit(AuthSuccessState());
      }
      else if(result['success'] == false){
        emit(AuthErrorState(result['message']));
      }
    });

    // first event login
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoadingState());
      final result = await authRepository.register(event.email, event.password);
      if(result['success'] == true){
        emit(AuthSuccessState());
      }
      else if(result['success'] == false){
        emit(AuthErrorState(result['message']));
      }
    });




  }
}
