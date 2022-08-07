import 'dart:ui';

import 'package:ticketing_system/const.dart';

import '../screens/home_screen.dart';
import 'authentication_client.dart';
import 'validator.dart';
import 'register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();

  final _authClient = AuthenticationClient();

  bool _isProgress = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _emailFocusNode.unfocus();
        _passwordFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1607490040458-10e379cfa700?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2luZW1hfGVufDB8MXwwfGJsYWNrX2FuZF93aGl0ZXw%3D&auto=format&fit=crop&w=500&q=60',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        validator: Validator.email,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: kPimaryColor,
                          ),
                          hintText: '...........@gmail.com',
                          hintStyle: const TextStyle(color: Colors.white),
                          label: const Text(
                            'Email',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        validator: Validator.password,
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: kPimaryColor,
                          ),
                          //border: OutlineInputBorder(),
                          hintText: 'Enter your password',
                          label: const Text(
                            'Password',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      _isProgress
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: double.maxFinite,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: kActionColor,
                                      //fixedSize: const Size(100, 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        _isProgress = true;
                                      });
                                      final User? user =
                                          await _authClient.loginUser(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      );
                                      setState(() {
                                        _isProgress = false;
                                      });

                                      if (user != null) {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyHomePage(user: user)),
                                          (route) => false,
                                        );
                                      } //const MyHomePage(title: 'RECESS')
                                    }
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(fontSize: 22.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                        child: const Text(
                          ' Click here to register',
                          style: TextStyle(
                            color: kPimaryColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
