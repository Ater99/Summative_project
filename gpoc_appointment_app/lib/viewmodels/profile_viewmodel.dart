import 'package:gpoc_appointment_app/enums/view_state.dart';
import 'package:gpoc_appointment_app/locator.dart';
import 'package:gpoc_appointment_app/models/staff_model.dart';
import 'package:gpoc_appointment_app/services/profile_database_service.dart';
import 'package:gpoc_appointment_app/services/auth_service.dart';
import 'package:gpoc_appointment_app/services/localstorage_service.dart';
import 'package:gpoc_appointment_app/viewmodels/base_viewmodel.dart';
import 'package:get/get.dart';

class ProfileViewmodel extends BaseViewModel {
  final ProfileDatabaseService _profileService =
      locator<ProfileDatabaseService>();
  final FirebaseAuthService _firebaseAuthService =
      locator<FirebaseAuthService>();
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();

  late final StaffModel _profile;

  StaffModel get profile => _profile;

  set profile(StaffModel profile) {
    _profile = profile;
    notifyListeners();
  }

  String get name => profile.name;
  String get Department => profile.Department;
  String get Role => profile.Role;
  String get address => profile.address;
  String get timing => profile.timing;

  void fetchProfile() async {
    setState(ViewState.Busy);
    profile = (await _profileService.profile) as StaffModel;
    setState(ViewState.Idle);
  }

  void signout() async {
    await _firebaseAuthService.signOut();
    _localStorageService.isLoggedIn = false;
    Get.offAndToNamed('/login');
  }
}
