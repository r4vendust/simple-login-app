import 'package:flutter/material.dart';
import 'package:simple_login_app/widgets/text_field_input.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
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
                height: 32.0,
              ),
              Row(
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
                    onPressed: () {},
                    child: const Text('Sign up'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
