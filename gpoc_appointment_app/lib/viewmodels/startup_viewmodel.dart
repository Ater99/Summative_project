import 'package:gpoc_appointment_app/locator.dart';
import 'package:gpoc_appointment_app/services/localstorage_service.dart';
import 'package:gpoc_appointment_app/viewmodels/base_viewmodel.dart';
import 'package:get/get.dart';

class StartUpViewModel extends BaseViewModel {
  final LocalStorageService localStorageService =
      locator<LocalStorageService>();

  void onModelReady() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    await Get.offAllNamed(
      localStorageService.isLoggedIn ? '/landing' : '/login',
    );
  }
}
