import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_login_app/services/flutterfire.dart';
import 'package:simple_login_app/utils/colors.dart';
import 'package:simple_login_app/widgets/text_field_input.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 84.0),
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
                    textEditingController: _nameController,
                    icon: Icons.person,
                    hintText: 'Name',
                    labelText: 'Name',
                    textInputType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name must not be empty';
                      } else if (value.length < 3) {
                        return 'Name must be equal or longer then 3';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextFieldInput(
                    textEditingController: _lastNameController,
                    icon: Icons.person,
                    hintText: 'Last name',
                    labelText: 'Last name',
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextFieldInput(
                    textEditingController: _emailController,
                    icon: Icons.email,
                    hintText: 'Email',
                    labelText: 'Email',
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email must not be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextFieldInput(
                    textEditingController: _passwordController,
                    icon: Icons.lock,
                    hintText: 'Password',
                    labelText: 'Password',
                    textInputType: TextInputType.text,
                    isPass: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please, enter a proper password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextFieldInput(
                    textEditingController: _confirmPassController,
                    icon: Icons.lock,
                    hintText: 'Confirm password',
                    labelText: 'Confirm password',
                    textInputType: TextInputType.text,
                    isPass: true,
                    validator: (value) {
                      if (_passwordController.text !=
                          _confirmPassController.text) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 32.0,
                    child: TextButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          // Makes user access the home page without login
                          context.read<AuthenticationService>().signUp(
                              email: _emailController.text,
                              password: _passwordController.text);
                          context.read<AuthenticationService>().signIn(
                              email: _emailController.text,
                              password: _passwordController.text);
                        } else {
                          debugPrint('Unsuccessfull');
                        }
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue[500],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: const Text('Submit'),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have a account?",
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Sign in'),
                      ),
                    ],
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
