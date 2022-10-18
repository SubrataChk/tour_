import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tour_application/src/widget/show_msg.dart';

import '../routes/route.dart';

class UserForm {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future sendFormData(
      String name, int phone, String address, String dob, String gender) async {
    try {
      CollectionReference _details =
          FirebaseFirestore.instance.collection("User_Information");
      _details.doc(_firebaseAuth.currentUser!.uid).set({
        "name": name,
        "phone": phone,
        "address": address,
        "dob": dob,
        "gender": gender,
      }).whenComplete(() {
        showMessage("Added Successfully");
        Get.toNamed(privacy);
      });
    } catch (e) {
      showMessage(e.toString());
    }
  }
}
