import 'package:gpoc_appointment_app/services/appointment_service.dart';
import 'package:gpoc_appointment_app/services/auth_service.dart';
import 'package:gpoc_appointment_app/services/localstorage_service.dart';
import 'package:gpoc_appointment_app/services/profile_database_service.dart';
import 'package:gpoc_appointment_app/services/staff_info_service.dart';
import 'package:gpoc_appointment_app/viewmodels/auth_viewmodel.dart';
import 'package:gpoc_appointment_app/viewmodels/input_form_viewmodel.dart';
import 'package:gpoc_appointment_app/viewmodels/appointments_viewmodel.dart';
import 'package:gpoc_appointment_app/viewmodels/date_appointment_viewmodel.dart';
import 'package:gpoc_appointment_app/viewmodels/landing_viewmodel.dart';
import 'package:gpoc_appointment_app/viewmodels/profile_viewmodel.dart';
import 'package:gpoc_appointment_app/viewmodels/startup_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  //services
  var localStorage = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(localStorage);

  var _firebaseAuth = FirebaseAuth.instance;
  locator.registerSingleton<FirebaseAuth>(_firebaseAuth);

  var _firebaseFirestore = FirebaseFirestore.instance;
  locator.registerSingleton<FirebaseFirestore>(_firebaseFirestore);
  locator.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  locator.registerSingleton<StaffInfoService>(StaffInfoService());

  var _profileDatabaseService = ProfileDatabaseService();
  locator.registerSingleton<ProfileDatabaseService>(_profileDatabaseService);

  var _appointmentService = AppointmentService();
  locator.registerSingleton<AppointmentService>(_appointmentService);

  //viewmodels
  locator.registerFactory<InputFormViewModel>(() => InputFormViewModel());
  locator.registerFactory<StartUpViewModel>(() => StartUpViewModel());
  locator.registerFactory<AuthViewModel>(() => AuthViewModel());
  locator.registerFactory<LandingViewModel>(() => LandingViewModel());
  locator.registerFactory<ProfileViewmodel>(() => ProfileViewmodel());
  locator.registerFactory<AppointmentViewmodel>(() => AppointmentViewmodel());
  locator.registerFactory<DateAppointmentViewModel>(
      () => DateAppointmentViewModel());
}
