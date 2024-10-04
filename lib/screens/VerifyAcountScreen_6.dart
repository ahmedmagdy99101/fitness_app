import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyAccountScreen extends StatelessWidget {
  const VerifyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                      'VERIFY ACCOUNT',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                const Text(
                  'Verify your account by entering the verification code we sent to ',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const Text(
                  'johnwelles@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF9ACD32), // light green color
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildOtpInputField(context),
                    _buildOtpInputField(context),
                    _buildOtpInputField(context),
                    _buildOtpInputField(context),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Handle Resend Code
                    },
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9ACD32), // Light green color
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      // Handle Reset Password Action
                    },
                    child: const Text(
                      'RESET PASSWORD',
                      style: TextStyle(
                        fontSize: 16,
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
    );
  }

  // Method to create each OTP input field
  Widget _buildOtpInputField(BuildContext context) {
    return SizedBox(
      width: 60,
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          counterText: '',
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}


