import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:tradefolioo/config/color_constants.dart';
import 'package:tradefolioo/config/enums.dart';
import 'package:tradefolioo/controllers/auth_controller.dart';
import 'package:tradefolioo/models/login_response.dart';
import 'package:tradefolioo/models/register_response.dart';
import 'package:tradefolioo/services/api/api_services.dart';
import 'package:tradefolioo/services/api/responses/auth_responses.dart';
import 'package:tradefolioo/services/app_routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final talker = TalkerFlutter.init();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstants.primaryWhiteColor,
        title: Text(
          'Login',
          style: GoogleFonts.inter(
            color: ColorConstants.primaryBlackColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    if (!GetUtils.isEmail(value)) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                    fillColor: ColorConstants.primaryTextBoxColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    filled: true,
                    labelText: 'Email',
                    labelStyle: GoogleFonts.inter(
                      color: ColorConstants.primaryBlackColor,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    fillColor: ColorConstants.primaryTextBoxColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    filled: true,
                    labelText: 'Password',
                    labelStyle: GoogleFonts.inter(
                      color: ColorConstants.primaryBlackColor,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Consumer<AuthController>(
                  builder: (context, controller, child) {
                    return SizedBox(
                      width: Get.width * 0.9,
                      child: MaterialButton(
                          height: Get.height * 0.06,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              controller
                                  .setLoginStatus(LOGIN_STATUS.LOGGING_IN);
                              talker.info('Signing In user');
                              talker.info("Calling api : ${ApiServices.login}");
                              final loginRequest = LoginRequest(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                              final response = await AuthResponses.login(
                                  loginRequest.toMap());
                              if (response.success) {
                                final loginResponse =
                                    LoginResponse.fromMap(response.data);
                                controller
                                    .setLoginStatus(LOGIN_STATUS.LOGGED_IN);
                                talker.info('Login successful');
                                Get.offNamed(AppRoutes.homeNavigationScreen);
                              } else {
                                controller
                                    .setLoginStatus(LOGIN_STATUS.LOGGED_OUT);
                                talker.error(response.message);
                              }
                            }
                          },
                          color: ColorConstants.primaryBlackColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: controller.login_status ==
                                  LOGIN_STATUS.LOGGED_OUT
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.inter(
                                      color: ColorConstants.primaryWhiteColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: CircularProgressIndicator(
                                    color: ColorConstants.primaryWhiteColor,
                                  ),
                                )),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
