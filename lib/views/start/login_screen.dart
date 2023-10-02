// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_app2/views/buyers/main_screen.dart';
import 'package:go_app2/views/start/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String emailErrorText = '';
  String passwordErrorText = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool validateForm() {
    bool isValid = true;

    if (emailController.text.isEmpty) {
      setState(() {
        emailErrorText = 'Email is required';
      });
      isValid = false;
    } else {
      setState(() {
        emailErrorText = '';
      });
    }

    if (passwordController.text.isEmpty) {
      setState(() {
        passwordErrorText = 'Password is required';
      });
      isValid = false;
    } else {
      setState(() {
        passwordErrorText = '';
      });
    }

    return isValid;
  }

  Future<void> loginUser() async {
    if (validateForm()) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        if (userCredential.user != null) {
          // Login successful
          // Navigate to the homepage
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        }
      } catch (e) {
        print('Error during login: $e'); // Print the error for debugging
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get Set, Ready',
                  style: TextStyle(fontSize: 35, fontFamily: "Lobster"),
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 86,
                      height: 86,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: const [Colors.blue, Colors.purple],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'GO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: "Alfa",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                buildTextField(
                  controller: emailController,
                  labelText: 'E-mail',
                  errorText: emailErrorText,
                ),
                SizedBox(height: 20),
                buildTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  errorText: passwordErrorText,
                  obscureText: true,
                ),
                SizedBox(height: 50),
                InkWell(
                  onTap: loginUser,
                  child: Container(
                    width: 290,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 36, 76, 255),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Add your password reset logic here
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color.fromARGB(255, 36, 76, 255)),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?',
                          style:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text('Register',
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 76, 255))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    String? errorText,
    bool obscureText = false,
    TextInputType? keyboardType,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            labelText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromARGB(255, 221, 221, 221),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (errorText != null && errorText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              errorText,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
      ],
    );
  }
}
