import 'package:gpoc_appointment_app/locator.dart';
import '../../constants/error_code.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();

  User get currentUser => _firebaseAuth.currentUser!;

  // Sign In with email and password
  Future<UserCredential> signIn(String email, String password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw signInErrorCodes[e.code] ?? 'Database Error Occured!';
    } catch (e) {
      throw '${e.toString()} Error Occured!';
    }
  }

  // Sign Up using email address
  Future<UserCredential> signUp(String email, String password) async {
    try {
      var _user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _user;
    } on FirebaseAuthException catch (e) {
      throw signUpErrorCodes[e.code] ?? 'Firebase ${e.code} Error Occured!';
    } catch (e) {
      throw '${e.toString()} Error Occured!';
    }
  }

  // Sign Out
  Future<String> signOut() async {
    await _firebaseAuth.signOut();
    return 'Signed Out Successfully';
  }

  Future<String> sendResetPasswordEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return 'Email Sent Succesfully';
    } on FirebaseException catch (e) {
      throw passwordResetErrorCodes[e.code] ??
          'Firebase ${e.code} Error Occured!';
    } catch (e) {
      throw '${e.toString()} Error Occured!';
    }
  }
}
// import 'package:gpoc_appointment_app/locator.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:http/http.dart' as http;
// import 'package:validator/validator.dart';

// import '../../constants/error_code.dart';

// class FirebaseAuthService {
//   final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();

//   User get currentUser => _firebaseAuth.currentUser!;

//   // Sign In with email and password
//   Future<UserCredential> signIn(String email, String password) async {
//     if (!isEmail(email)) {
//       throw 'Invalid email address';
//     }
//     if (password.isEmpty) {
//       throw 'Password is required';
//     }
//     try {
//       return await _firebaseAuth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       throw signInErrorCodes[e.code] ?? 'Database Error Occured!';
//     } catch (e) {
//       throw '${e.toString()} Error Occured!';
//     }
//   }

//   // Sign Up using email address
//   Future<UserCredential> signUp(String email, String password) async {
//     if (!isEmail(email)) {
//       throw 'Invalid email address';
//     }
//     if (password.isEmpty) {
//       throw 'Password is required';
//     }
//     try {
//       var _user = await _firebaseAuth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return _user;
//     } on FirebaseAuthException catch (e) {
//       throw signUpErrorCodes[e.code] ?? 'Firebase ${e.code} Error Occured!';
//     } catch (e) {
//       throw '${e.toString()} Error Occured!';
//     }
//   }

//   // Sign Out
//   Future<String> signOut() async {
//     await _firebaseAuth.signOut();
//     return 'Signed Out Successfully';
//   }

//   Future<String> sendResetPasswordEmail(String email) async {
//     if (!isEmail(email)) {
//       throw 'Invalid email address';
//     }
//     try {
//       await _firebaseAuth.sendPasswordResetEmail(email: email);
//       return 'Email Sent Succesfully';
//     } on FirebaseException catch (e) {
//       throw passwordResetErrorCodes[e.code] ??
//           'Firebase ${e.code} Error Occured!';
//     } catch (e) {
//       throw '${e.toString()} Error Occured!';
//     }
//   }
// }
