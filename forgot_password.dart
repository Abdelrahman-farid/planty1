import 'package:flutter/material.dart';
import 'package:plantproject/constants.dart';
import 'package:plantproject/ui/screens/signin_page.dart';
import 'package:plantproject/ui/screens/widgets/custom_textfield.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/reset-password.png',
                width: size.width,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              const Text(
                'Forgot\nPassword',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
              const CustomTextfield(
                obscureText: false,
                hintText: 'Enter Email',
                icon: Icons.alternate_email,
              ),
              const SizedBox(height: 20),
              _buildResetButton(size),
              const SizedBox(height: 20),
              _buildLoginLink(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResetButton(Size size) {
    return GestureDetector(
      onTap: () {
        // Implement password reset logic here
      },
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: const Center(
          child: Text(
            'Reset Password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignIn(),
          ),
        );
      },
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Have an Account? ',
                style: TextStyle(
                  color: Constants.blackColor,
                ),
              ),
              TextSpan(
                text: 'Login',
                style: TextStyle(
                  color: Constants.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
