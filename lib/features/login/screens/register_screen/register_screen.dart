import 'package:firebase_auth/firebase_auth.dart';
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
                  SizedBox(
                      height: size.height * 0.02),
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
                  SizedBox(
                      height: size.height * 0.01),
                  const Text(
                    'Please enter your credentials to proceed',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    validator: (String? data){
                      if(data!.isEmpty){
                        return 'This Field is required' ;
                      }
                    },
                    onChanged: (data){
                      name = data;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                      height: size.height * 0.02),
                  TextFormField(
                    validator: (String? data){
                      if(data!.isEmpty){
                        return 'This Field is required' ;
                      }
                    },
                    onChanged: (data){
                      phone =data;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                      height: size.height * 0.02),
                  TextFormField(
                    validator: (String? data){
                      if(data!.isEmpty){
                        return 'This Field is required' ;
                      }
                    },
                    onChanged: (data){
                      email = data;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                      height: size.height * 0.02),
                  TextFormField(
                    validator: (String? data){
                      if(data!.isEmpty){
                        return 'This Field is required' ;
                      }
                    },

                    onChanged: (data){
                      password = data;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                  ),
                  SizedBox(
                      height: size.height * 0.03),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9ACD32), // Light green color
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () async {
                        if(formKey.currentState!.validate()){
                          try {
                            await registerUser();

                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBarMessage(context , 'The password provided is too weak');
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBarMessage(context ,'The account already exists for that email'
                              );
                            }
                          } catch (e) {
                            showSnackBarMessage(context, 'there was an error');
                            print(e);
                          }
                        }
                      },
                      child: const Text(
                        'CREATE ACCOUNT',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                            try{
                              signinWithGoogle();

                            }catch(e){
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
                        // Navigate to login
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

  void showSnackBarMessage(BuildContext context , String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
            content:Text(msg)
        )
    ) ;
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  Future<void> signinWithGoogle() async{
     GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

     GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

     AuthCredential credential =   GoogleAuthProvider.credential(
       accessToken: googleAuth?.accessToken,
       idToken: googleAuth?.idToken,
     );

     UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
   }

}

