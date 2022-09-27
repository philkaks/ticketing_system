import 'dart:ui';

import 'package:ticketing_system/const.dart';

import 'authentication_client.dart';
import 'validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _nameFocusNode = FocusNode();

  final _emailFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();

  final _authClient = AuthenticationClient();

  bool _isProgress = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _nameFocusNode.unfocus();
        _emailFocusNode.unfocus();
        _passwordFocusNode.unfocus();
      },
      child: Scaffold(
        //backgroundColor: mycolor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Register'),
        ),
        body: Stack(children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 0.8),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1573339886303-e2ee2fcad317?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Y2luZW1hfGVufDB8MXwwfGJsYWNrfA%3D%3D&auto=format&fit=crop&w=500&q=60',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    validator: Validator.name,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: kPimaryColor,
                          width: 2.0,
                        ),
                      ),
                      border: const OutlineInputBorder(),
                      hintText: 'Enter your name',
                      hintStyle: const TextStyle(color: Colors.white),
                      label: const Text(
                        'Name',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    validator: Validator.email,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: kPimaryColor,
                          width: 2.0,
                        ),
                      ),
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(),
                      hintText: 'Enter your email',
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
                    cursorColor: Colors.white,
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    validator: Validator.password,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: kPimaryColor,
                          width: 2.0,
                        ),
                      ),
                      border: const OutlineInputBorder(),
                      hintText: 'Enter your password',
                      hintStyle: const TextStyle(color: Colors.white),
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
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                //primary: kPimaryColor,
                                //fixedSize: const Size(50, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isProgress = true;
                                });
                                final User? user =
                                    await _authClient.registerUser(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                                setState(
                                  () {
                                    _isProgress = false;
                                  },
                                );

                                if (user != null) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                    (route) => false,
                                  );
                                }
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 22.0, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
