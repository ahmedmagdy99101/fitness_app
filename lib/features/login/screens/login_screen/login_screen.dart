import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  String? email;
  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Handle back button action
                                },
                                icon: const Icon(Icons.arrow_back),
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                'WELCOME TO PRO FITNESS!',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Hello there, sign in to continue!',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                validator: (String? data) {
                                  if (data!.isEmpty) {
                                    return 'This Field is required';
                                  }
                                },
                                onChanged: (data) {
                                  email = data;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Email address',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  suffixIcon: const Icon(Icons.check_circle),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 20),
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
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  suffixIcon: const Icon(Icons.visibility_off),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    // Forgot Password Action
                                  },
                                  child: const Text('Forgot Password?'),
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFA2D05D),
                                  // Green button color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    try {
                                      await loginUser();
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'user-not-found') {
                                        showSnackBarMessage(context,
                                            'No user found for that email');
                                      } else if (e.code == 'wrong-password') {
                                        showSnackBarMessage(
                                            context, 'Wrong password');
                                      }
                                    } catch (e) {
                                      showSnackBarMessage(
                                          context, 'there was an error');
                                      print(e);
                                    }
                                  }
                                },
                                child: const Text(
                                  'LOGIN',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: Colors.grey,
                                      height: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      'Or Login with',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Colors.grey,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SocialLoginButton(
                                icon: Icons.g_translate,
                                text: 'Connect with Google',
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                onPressed: () async {
                                  try {
                                    GoogleAuthProvider googleAuthProvider =
                                        GoogleAuthProvider();
                                    await FirebaseAuth.instance
                                        .signInWithProvider(googleAuthProvider);
                                  } catch (e) {}
                                },
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                text: "Don’t have an account? ",
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: "Register!",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                    // Handle register action
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }

  void showSnackBarMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}

// Custom widget for social login buttons
class SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
