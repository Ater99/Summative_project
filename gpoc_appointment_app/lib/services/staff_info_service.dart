import 'package:gpoc_appointment_app/locator.dart';
import 'package:gpoc_appointment_app/model/staff_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StaffInfoService {
  final FirebaseFirestore _firebaseFirestore = locator<FirebaseFirestore>();
  final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();

  Future setStaffInfo(Staff info) async {
    try {
      await _firebaseFirestore
          .collection('Staffs')
          .doc(_firebaseAuth.currentUser!.uid)
          .set(
        {
          'name': info.name,
          'address': info.address,
          'department': info.Department,
          'role': info.Role,
          'timing': info.timing,
        },
      );
      print('added succesfully');
    } catch (e) {
      print('${e.toString()}');
    }
  }

  Future<bool> doesExist() async {
    try {
      var res = await _firebaseFirestore
          .collection('Staffs')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      return res.exists;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
