import 'package:blog_app/config/route/route_constant.dart';
import 'package:blog_app/features/auth/presentation/screens/screen_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/theme/app_pallete.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_field.dart';
import '../widgets/auth_gradient_button.dart';
import '../widgets/loader.dart';
import '../widgets/show_snackbar.dart';
import 'package:go_router/go_router.dart';
/*
✅  GlobalKey in Flutter is a unique identifier that allows you to access, manipulate,
and interact with a widget from outside its build context.

✅ context.read<AuthBloc>() -> Gets the BLoC instance without listening to state changes.
✅ context.watch<AuthBloc>() -> Listen to state changes and rebuild UI
✅ .add() is used to send an event to the BLoC. When an event is added, the BLoC processes it and emits a new state.

 */
class SignInScreen extends StatefulWidget {
  // static route() => MaterialPageRoute(builder: (context) => SignInScreen());

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
        /*
        * The BlocConsumer widget is used to listen to state changes and rebuild the UI based
         on different authentication states.

        * The listener is used to perform side effects, such as showing a snackbar
          or navigating to another screen, but not rebuilding the UI.

        * The builder is responsible for building and rebuilding the UI based on different states.

         */
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }
            return Form(
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
                     // Navigator.push(context, SignupScreen.route());
                      context.pushNamed(RouteConstant.signUp);
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
            );
          },
        ),
      ),
    );
  }
}
