import 'package:gpoc_appointment_app/constants/constants.dart';
import 'package:gpoc_appointment_app/locator.dart';
import 'package:gpoc_appointment_app/model/staff_model.dart';
import 'package:gpoc_appointment_app/models/staff_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileDatabaseService {
  final FirebaseFirestore _firestore = locator<FirebaseFirestore>();
  final FirebaseAuth _auth = locator<FirebaseAuth>();

  Future<Staff> get profile async => await _getProfile();

  Future<Staff> _getProfile() async {
    var staff = await _firestore
        .collection(staffs_key)
        .doc(_auth.currentUser!.uid)
        .get();
    return Staff(
      name: staff.data()![name_key],
      Role: staff.data()![role_key],
      timing: staff.data()![timing_key],
      address: staff.data()![address_key],
      Department: staff.data()![department_key],
    );
  }
}
