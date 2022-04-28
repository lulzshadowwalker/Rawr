import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawr/helpers/lulz_imports.dart';
import 'package:rawr/services/auth/auth_controller.dart';
import 'package:rawr/services/database/remote_database/remote_database_controller.dart';

class DSignIn extends StatefulWidget {
  const DSignIn({Key? key}) : super(key: key);

  @override
  State<DSignIn> createState() => _DSignInState();
}

class _DSignInState extends State<DSignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController _auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            child: Column(
      children: [
        /// Fields
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(hintText: 'email'),
        ),
        TextFormField(
          controller: _passwordController,
          decoration: const InputDecoration(hintText: 'password'),
        ),

        /// actions
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _signUp, child: const Text('sign up')),
            ElevatedButton(
                onPressed:
                    Get.find<AuthController>().signInWithEmailAndPassword,
                child: const Text('sign in')),
            ElevatedButton(
                onPressed: ()async  {
                  // await Get.find<RemoteDatabaseController>().registerNewUser();
                },
                child: const Text('rdb')),
          ],
        )
      ],
    )));
  }

  void _signUp() {
    _auth.userEmail = _emailController.text.trim();
    _auth.userPassword = _passwordController.text.trim();
    _auth.signUpWithEmailAndPassword();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    showSuitableScreen();
  }

  Future<void> showSuitableScreen() async {
    bool authStatus = await _auth.checkAuthStatus;

    authStatus ? _auth.getOffAll(const DHome()) : null;
  }
}
