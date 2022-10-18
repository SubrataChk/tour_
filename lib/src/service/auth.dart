import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tour_application/src/routes/route.dart';

import 'package:tour_application/src/widget/show_msg.dart';

class Auth {
  final box = GetStorage();

  Future registration(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      var authCredential = userCredential.user;

      if (authCredential!.uid.isNotEmpty) {
        showMessage("Register Successfully");
        box.write("uid", authCredential.uid);
        Get.toNamed(userForm);
      } else {
        showMessage("Sign Up Failed");
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "weak-password") {
        showMessage("The Password provided is so weak. Please try again");
      } else if (error.code == "email-already-in-use") {
        showMessage("The account already exists. Please new one!");
      }
    } catch (e) {
      showMessage(e.toString());
    }
  }

  Future login(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      var authCredential = userCredential.user;
      if (authCredential!.uid.isNotEmpty) {
        showMessage("Login Successfully");
      } else {
        showMessage("Sign In Failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "null") {}
    } catch (e) {
      showMessage(e.toString());
    }
  }
}
