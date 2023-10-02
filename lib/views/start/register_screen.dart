// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_app2/views/buyers/main_screen.dart';
import 'package:go_app2/views/start/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser() async {
    if (validateForm()) {
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        if (userCredential.user != null) {
          // Registration successful, user is created
          // Save the mobile number and name in Firestore
          await _firestore
              .collection('users')
              .doc(userCredential.user!.uid)
              .set({
            'name': nameController.text,
            'email': emailController.text,
            'phoneNumber': phoneNumberController.text,
          });

          // Navigate to the homepage
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        }
      } catch (e) {
        print('Error during registration: $e'); // Print the error for debugging
      }
    }
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String nameErrorText = '';
  String emailErrorText = '';
  String phoneNumberErrorText = '';
  String passwordErrorText = '';

  bool validateForm() {
    bool isValid = true;

    if (nameController.text.isEmpty) {
      setState(() {
        nameErrorText = 'Name is required';
      });
      isValid = false;
    } else {
      setState(() {
        nameErrorText = '';
      });
    }

    if (emailController.text.isEmpty) {
      setState(() {
        emailErrorText = 'Email is required';
      });
      isValid = false;
    } else if (!isValidEmail(emailController.text)) {
      setState(() {
        emailErrorText = 'Invalid email format';
      });
      isValid = false;
    } else {
      setState(() {
        emailErrorText = '';
      });
    }

    if (phoneNumberController.text.isEmpty) {
      setState(() {
        phoneNumberErrorText = 'Phone number is required';
      });
      isValid = false;
    } else if (phoneNumberController.text.length != 10) {
      setState(() {
        phoneNumberErrorText = 'Insert a valid Mobile number';
      });
      isValid = false;
    } else {
      setState(() {
        phoneNumberErrorText = '';
      });
    }

    if (passwordController.text.isEmpty) {
      setState(() {
        passwordErrorText = 'Password is required';
      });
      isValid = false;
    } else if (passwordController.text.length < 6) {
      setState(() {
        passwordErrorText = 'Password must be at least 6 characters';
      });
      isValid = false;
    } else {
      setState(() {
        passwordErrorText = '';
      });
    }

    return isValid;
  }

  bool isValidEmail(String email) {
    return email.contains('@');
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
                SizedBox(height: 20),
                buildTextField(
                  controller: nameController,
                  labelText: 'Name',
                  errorText: nameErrorText,
                ),
                SizedBox(height: 20),
                buildTextField(
                  controller: emailController,
                  labelText: 'E-mail',
                  errorText: emailErrorText,
                ),
                SizedBox(height: 20),
                buildTextField(
                  controller: phoneNumberController,
                  labelText: 'Phone Number',
                  errorText: phoneNumberErrorText,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                buildTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  errorText: passwordErrorText,
                  obscureText: true,
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: registerUser,
                  child: Container(
                    width: 290,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 36, 76, 255),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?',
                          style:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text('Login',
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
