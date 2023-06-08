part of 'login_bloc.dart';

enum LoginStatus {
  success,
  failure,
  loading,
}

class LoginState extends Equatable {
  const LoginState(
      {this.message = 'Facebook',
      this.status = LoginStatus.loading,
      this.user = const User()});

  final String message;
  final User user;
  final LoginStatus status;

  LoginState copyWith({User? user, String? message, LoginStatus? status}) {
    return LoginState(
      message: message ?? this.message,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [message, status, user];
}
