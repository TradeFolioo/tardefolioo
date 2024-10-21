import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tradefolioo/config/color_constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryWhiteColor,
      appBar: AppBar(
        title: Text(
          'Login',
          style: GoogleFonts.inter(
            color: ColorConstants.primaryBlackColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(
        child: Text('Login Screen'),
      ),
    );
  }
}
