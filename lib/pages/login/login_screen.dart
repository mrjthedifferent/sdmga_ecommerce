import 'package:flutter/material.dart';
import 'package:sdmga_ecommerce/pages/home_page.dart';
import 'package:sdmga_ecommerce/pages/register/register_screen.dart';
import 'package:sdmga_ecommerce/service/database.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Sign In'),
      ),
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = true;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 16),
        Text(
          "Welcome Back,",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 16),
        Text(
          "Sign in to continue",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    suffixIcon: Icon(Icons.email),
                  ),
                  onChanged: (value) => email = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    //check if email is valid
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                TextFormField(
                  obscureText: isPasswordVisible,
                  onChanged: (value) => password = value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Stack(
                  children: [
                    Row(
                      children: [
                        //checkbox for remember me
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                        ),
                        Text(
                          'Remember me',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0.0,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('Form is valid');
                      Database().login(email!, password!).then((user) {
                        if (user != null) {
                          Get.offAllNamed(HomePage.routeName);
                        }
                      });
                    }
                  },
                  child: const Text('Continue'),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
