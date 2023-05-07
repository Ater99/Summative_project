import 'package:gpoc_appointment_app/locator.dart';
import 'package:gpoc_appointment_app/services/appointment_service.dart';
import 'package:gpoc_appointment_app/viewmodels/base_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentViewmodel extends BaseViewModel {
  final _appointmentService = locator<AppointmentService>();

  Stream<QuerySnapshot<Map<String, dynamic>>> get appointments =>
      _appointmentService.getAppointments();
}
