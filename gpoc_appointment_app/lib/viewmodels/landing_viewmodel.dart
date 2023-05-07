import 'package:gpoc_appointment_app/ui/views/appointment_view.dart';
import 'package:gpoc_appointment_app/viewmodels/base_viewmodel.dart';
import 'package:gpoc_appointment_app/ui/views/profile_view.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingViewModel extends BaseViewModel {
  final List<Widget> _views = [
    AppointmentView(),
    ProfileView(),
  ];

  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
  ];

  final List<String> _headings = [
    'GPOC Appointments App',
    'Profile',
  ];

  int _activeTab = 0;

  int get activeTab => _activeTab;

  Widget get activeBody => _views[activeTab];

  Color get activeColor => _colors[activeTab];

  String get activeHeading => _headings[activeTab];

  set activeTab(int activeTab) {
    _activeTab = activeTab;
    notifyListeners();
  }
}
