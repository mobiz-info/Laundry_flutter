import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:golden_falcon/components/common_methods.dart';

import '../../Models/CustomerModel/device_token_model.dart';
import '../../Repositories/AuthRepo/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<UserLoginEvent>((event, emit) async {
      emit(LoginInitialState());
      try {
        await authRepository.loginUser(username: event.username, password: event.password, deviceToken: event.deviceToken).then((value) {
            if (value.status == true && value.message == "Authenticated User!") {
              emit(LoginSuccessState(value.data!.id.toString(), value.data!.tokEn.toString(), value.data!.userType.toString()));
            } else {
              emit(LoginErrorState(value.message.toString()));
            }
          },
        );
      } catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });

    on<GetDeviceTokenEvent>((event, emit) async {
      emit(DeviceTokenInitialState());
      try {
        await authRepository.getDeviceTokenData(deviceToken: event.deviceToken, userId: event.userId)
            .then((value) {
          if (value.status == true && value.message == "Succesfully !") {
            emit(DeviceTokenSuccess(value.data));
          } else {
            emit(DeviceTokenError(value.message));
          }
        });
      } catch (e) {
        emit(DeviceTokenError(e.toString()));
      }
    });
  }
}
