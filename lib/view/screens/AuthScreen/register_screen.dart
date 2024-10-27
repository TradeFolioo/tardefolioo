import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:tradefolioo/config/color_constants.dart';
import 'package:tradefolioo/config/enums.dart';
import 'package:tradefolioo/controllers/auth_controller.dart';
import 'package:tradefolioo/models/register_response.dart';
import 'package:tradefolioo/services/api/api_services.dart';
import 'package:tradefolioo/services/api/responses/auth_responses.dart';
import 'package:tradefolioo/services/app_routes.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
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
          'Create Account',
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
                      return 'Full name cannot be empty';
                    }
                    return null;
                  },
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    fillColor: ColorConstants.primaryTextBoxColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    filled: true,
                    labelText: 'Full Name',
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
                Consumer<AuthController>(
                  builder: (context, controller, child) {
                    return TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      obscureText: controller.showPassword ? false : true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.toggleShowPassword();
                          },
                          icon: Icon(
                            controller.showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: ColorConstants.primaryBlackColor,
                          ),
                        ),
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
                    );
                  },
                ),
                const SizedBox(height: 16),
                Consumer<AuthController>(builder: (context, controller, child) {
                  return TextFormField(
                    obscureText: controller.showConfirmPassword ? false : true,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.toggleShowConfirmPassword();
                        },
                        icon: Icon(
                          controller.showConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: ColorConstants.primaryBlackColor,
                        ),
                      ),
                      fillColor: ColorConstants.primaryTextBoxColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      filled: true,
                      labelText: 'Confirm Password',
                      labelStyle: GoogleFonts.inter(
                        color: ColorConstants.primaryBlackColor,
                        fontSize: 14,
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 25),
                Consumer<AuthController>(
                  builder: (context, controller, child) {
                    return SizedBox(
                      width: Get.width * 0.9,
                      child: MaterialButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              talker.info('Registering user');
                              talker.info(
                                  "Calling api : ${ApiServices.register}");
                              final data = RegisterRequest(
                                  name: _fullNameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text);
                              final registerResponse =
                                  await AuthResponses.register(data.toMap());
                              if (registerResponse.success) {
                                talker.info(
                                    "Registration successfull for ${registerResponse.data}");
                                Get.offNamed(AppRoutes.homeNavigationScreen);
                              } else {
                                talker.error("Error occurred");
                                talker.error(registerResponse.message);
                              }
                            }
                          },
                          color: ColorConstants.primaryBlackColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: controller.registration_status ==
                                  REGISTRATION_STATUS.NOT_SIGNINGUP
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Text(
                                    'Register',
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
