import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/custom_button.dart';
import '../../../common/custom_text_field.dart';

import '../../../common/top_bar_login.dart';
import '../../maps/screens/home.dart';
import '../bloc/login_bloc.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _userFirebaseTokenController =
    TextEditingController();
final _signInFormKey = GlobalKey<FormState>();

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    _userFirebaseTokenController.text = "sjhgjsdhgjshdfgjksdfsjkg";
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          var snackBar = SnackBar(
            backgroundColor: Colors.black,
            content: Text(state.message),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const HomeScreen();
              },
            ),
            (_) => false,
          );
        }
        if (state.status == LoginStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: const _LoginForm(),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const TopBarLogin(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Form(
                    key: _signInFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextFeild(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextFeild(
                          controller: _passwordController,
                          hintText: 'Password',
                          obsecure: true,
                          textInputType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 30.0),
                        const SizedBox(height: 30.0),
                        CustomButton(
                            text: 'Log in',
                            onTap: () {
                              if (_signInFormKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                    LoginButtonPressedEvent(
                                        phoneController: _emailController,
                                        passwordController: _passwordController,
                                        userFirebaseTokenController:
                                            _userFirebaseTokenController));
                              }
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
