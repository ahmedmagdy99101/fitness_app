import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/features/login/screens/login_screen/login_screen.dart';
import 'package:fitness_app/screens/SelectFavoriteScreen_7.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  String? name;
  String? phone;
  String? email;
  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.02),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const Text(
                        'CREATE ACCOUNTS',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  const Text(
                    'Please enter your credentials to proceed',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    validator: (String? data) {
                      if (data!.isEmpty) {
                        return 'This Field is required';
                      }
                    },
                    onChanged: (data) {
                      name = data;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  TextFormField(
                    validator: (String? data) {
                      if (data!.isEmpty) {
                        return 'This Field is required';
                      }
                    },
                    onChanged: (data) {
                      phone = data;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  TextFormField(
                    validator: (String? data) {
                      if (data!.isEmpty) {
                        return 'This Field is required';
                      }
                    },
                    onChanged: (data) {
                      email = data;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  TextFormField(
                    validator: (String? data) {
                      if (data!.isEmpty) {
                        return 'This Field is required';
                      }
                    },
                    onChanged: (data) {
                      password = data;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9ACD32),
                        // Light green color
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            await registerUser().then((value) {
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(email)
                                  .set({
                                'full-name': name,
                                'phone': phone,
                                'email': email,
                                'password': password,
                                'gender': 'Male',
                                'goal': 'Weight loss',
                                'level': 'Beginner',
                                'height':
                                    '${generateRandomNumber(min: 150, max: 190)}',
                                'weight':
                                    '${generateRandomNumber(min: 40, max: 150)}',
                                'progress-sleep':
                                    generateRandomNumber(min: 0, max: 8),
                                'progress-calories':
                                    generateRandomNumber(min: 50, max: 2200),
                                'progress-exercise':
                                    generateRandomNumber(min: 0, max: 15),
                                'progress-walk':
                                    generateRandomNumber(min: 0, max: 6000),
                                'progress-water':
                                    generateRandomNumber(min: 0, max: 12),
                                'uid': FirebaseAuth.instance.currentUser!.uid
                              });
                              FirebaseAuth.instance.currentUser
                                  ?.updateDisplayName(name);
                            });

                            showSnackBarMessage(context, "Sign in succsess");

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SelectFavoriteScreen()));
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBarMessage(
                                  context, 'The password provided is too weak');
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBarMessage(context,
                                  'The account already exists for that email');
                            }
                          } catch (e) {
                            showSnackBarMessage(context, 'there was an error');
                            print(e);
                          }
                        }
                      },
                      child: const Text(
                        'CREATE ACCOUNT',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  const Center(
                    child: Text(
                      'Or Register with',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              await signinWithGoogle().then((value) {
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(email)
                                    .set({
                                  'full-name': name,
                                  'phone': phone,
                                  'email': email,
                                  'password': password,
                                  'gender': 'Male',
                                  'goal': 'Weight loss',
                                  'level': 'Beginner',
                                  'height':
                                      '${generateRandomNumber(min: 150, max: 190)}',
                                  'weight':
                                      '${generateRandomNumber(min: 40, max: 150)}',
                                  'progress-sleep':
                                      generateRandomNumber(min: 0, max: 8),
                                  'progress-calories':
                                      generateRandomNumber(min: 50, max: 2200),
                                  'progress-exercise':
                                      generateRandomNumber(min: 0, max: 15),
                                  'progress-walk':
                                      generateRandomNumber(min: 0, max: 6000),
                                  'progress-water':
                                      generateRandomNumber(min: 0, max: 12),
                                  'uid': FirebaseAuth.instance.currentUser!.uid
                                });
                                FirebaseAuth.instance.currentUser
                                    ?.updateDisplayName(name);
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SelectFavoriteScreen()));
                            } catch (e) {
                              print(e);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Colors.grey),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.g_mobiledata_outlined,
                                color: Colors.blue,
                                size: 25,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Connect with Google',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  SizedBox(height: size.height * 0.03),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: const Text(
                        'Already have an account? Login!',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

  int generateRandomNumber({int min = 0, int max = 100}) {
    final random = Random();
    return min +
        random.nextInt(max -
            min +
            1); // Generates a random number between min and max (inclusive)
  }

  void showSnackBarMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  Future<void> registerUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  Future<void> signinWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
