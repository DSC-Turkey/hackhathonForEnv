import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:forenvironment/constants/login_messages.dart';
import 'package:forenvironment/controllers/firebase_auth_controller.dart';
import 'package:forenvironment/screens/ideas_page.dart';
import 'package:forenvironment/screens/search_page.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseController _firebaseController = Get.put(FirebaseController());

    return FlutterLogin(
      logo: "assets/recycle.png",
      title: 'FOR-ENV',
      messages: turkceGiris,
      onLogin: (loginData) {
        return _firebaseController.loginWithEmail(loginData);
      },
      onSignup: (loginData) {
        return _firebaseController.signUpWithEmail(loginData);
      },
      onSubmitAnimationCompleted: () {
        Get.off(TriesPage());
      },
      onRecoverPassword: (_) => Future(null), //Şifre sıfırlama eklenecek.
    );
  }
}
