import 'package:flutter/material.dart';
import 'package:tradefolioo/config/enums.dart';

class AuthController extends ChangeNotifier {
  bool showPassword = false;
  bool showConfirmPassword = false;
  bool showLoginPassword = false;
  LOGIN_STATUS login_status = LOGIN_STATUS.LOGGED_OUT;
  REGISTRATION_STATUS registration_status = REGISTRATION_STATUS.NOT_SIGNINGUP;



  void toggleShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void toggleShowLoginPassword() {
    showLoginPassword = !showLoginPassword;
    notifyListeners();
  }

  void toggleShowConfirmPassword() {
    showConfirmPassword = !showConfirmPassword;
    notifyListeners();
  }

  void setLoginStatus(LOGIN_STATUS status) {
    login_status = status;
    notifyListeners();
  }

  void setRegistrationStatus(REGISTRATION_STATUS status) {
    registration_status = status;
    notifyListeners();
  }
}
