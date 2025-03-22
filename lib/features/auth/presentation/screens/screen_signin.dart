import 'package:blog_app/features/auth/presentation/screens/screen_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_pallete.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_field.dart';
import '../widgets/auth_gradient_button.dart';

class SignInScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => SignInScreen());

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              AuthField(
                hintText: 'Email ID',
                textEditingController: _emailController,
              ),
              const SizedBox(height: 15),
              AuthField(
                hintText: 'Password',
                textEditingController: _passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 15),
              AuthGradientButton(
                buttonText: "Sign In",
                onButtonPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                      AuthSignIn(
                        emailId: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, SignupScreen.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          color: AppPallete.gradient2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
