part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class LoginButtonPressedEvent extends LoginEvent {
  const LoginButtonPressedEvent(
      {required this.passwordController,
      required this.phoneController,
      required this.userFirebaseTokenController});

  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController userFirebaseTokenController;
  @override
  List<Object> get props =>
      [phoneController, passwordController, userFirebaseTokenController];
}
