import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_login_app/services/flutterfire.dart';
import 'package:simple_login_app/screens/register/register_page.dart';
import 'package:simple_login_app/utils/colors.dart';
import 'package:simple_login_app/widgets/text_field_input.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  double _opacity = 0.0;
  void setOpacity() {
    setState(() {
      _opacity = 1.0;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 84.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'lib/assets/flutter_logo.svg',
                    height: 84.0,
                  ),
                  const SizedBox(
                    height: 64.0,
                  ),
                  TextFieldInput(
                    textEditingController: _emailController,
                    icon: Icons.email,
                    hintText: 'Email',
                    labelText: 'Email',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextFieldInput(
                    textEditingController: _passwordController,
                    icon: Icons.key,
                    hintText: 'Password',
                    labelText: 'Password',
                    textInputType: TextInputType.text,
                    isPass: true,
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  SizedBox(
                    width: 200.0,
                    height: 40.0,
                    child: TextButton(
                      onPressed: () async {
                        String isLogged =
                            await context.read<AuthenticationService>().signIn(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                        if (isLogged == 'Error') {
                          setOpacity();
                        }
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue[500],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      child: const Text('Sign in'),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'Could not log in. Check your email and password',
                    style: TextStyle(
                      color: Colors.red.withOpacity(_opacity),
                    ),
                  ),
                  const SizedBox(
                    height: 42.0,
                  ),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        const Text(
                          "Don't have a account yet?",
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: const Text('Sign up'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
