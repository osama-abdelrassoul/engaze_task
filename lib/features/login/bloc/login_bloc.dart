import 'dart:async';
import 'dart:convert';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../../../core/models/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginButtonPressedEvent>(_handleLoginWithEmailAndPasswordEvent);
  }

  Future<void> _handleLoginWithEmailAndPasswordEvent(
    LoginButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      Dio dio = Dio();

      var formData = FormData.fromMap({
        'UserPhone': event.phoneController.text,
        'Password': event.passwordController.text,
        'UserFirebaseToken': event.userFirebaseTokenController.text
      });

      Response response = await dio.post(
        "https://engaztechnology.net/Himam/User/LoginUser.php",
        data: formData,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 600;
          },
        ),
      );

      if (response.statusCode == 200) {
        User user = User.fromMap(json.decode(response.data)["data"]);
        emit(state.copyWith(
            message: 'logged in successfully',
            status: LoginStatus.success,
            user: user));
      }
    } catch (e) {
      emit(state.copyWith(message: e.toString(), status: LoginStatus.failure));
    }
  }
}
