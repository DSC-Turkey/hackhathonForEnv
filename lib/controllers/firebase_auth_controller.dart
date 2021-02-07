import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User> _firebaseUser = Rx<User>();

  String get user => _firebaseUser.value?.email;


  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }


  //E-MAİL İLE GİRİŞ YAP.
  Future<String> loginWithEmail(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');
    try {
      await _auth.signInWithEmailAndPassword(
          email: data.name, password: data.password);
    } on FirebaseAuthException catch (e) {
      return "Giriş yapılamadı :" + e.message.toString();
    }
    return null;
  }

  //E-MAİL İLE KULLANICI OLUŞTUR.
  Future<String> signUpWithEmail(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');
    try {
      await _auth.createUserWithEmailAndPassword(
          email: data.name, password: data.password);
    } on FirebaseAuthException catch (e) {
      return "Kullanıcı oluşturulamadı :" + e.message.toString();
    }
    return null;
  }
}
