import 'package:gpoc_appointment_app/enums/view_state.dart';
import 'package:gpoc_appointment_app/locator.dart';
import 'package:gpoc_appointment_app/model/staff_model.dart';
import 'package:gpoc_appointment_app/services/staff_info_service.dart';
import 'package:gpoc_appointment_app/viewmodels/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InputFormViewModel extends BaseViewModel {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final StaffInfoService _infoService = locator<StaffInfoService>();
  late DateTime _from, _to;
  late TextEditingController _nameController,
      _addressController,
      _roleController,
      _departmentController;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get nameController => _nameController;
  TextEditingController get addressController => _addressController;
  TextEditingController get roleController => _roleController;
  TextEditingController get departmentController => _departmentController;
  DateTime get from => _from;
  DateTime get to => _to;

  String? validateTextField(String? value) {
    if (value!.isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  void setTime(TimeOfDay time, String command) {
    switch (command) {
      case 'from':
        _from = DateTime(
          _from.year,
          _from.month,
          _from.day,
          time.hour,
          time.minute,
        );
        break;
      case 'to':
        _to = DateTime(
          _to.year,
          _to.month,
          _to.day,
          time.hour,
          time.minute,
        );
        break;
    }
    notifyListeners();
  }

  Future<void> setInfo() async {
    var info = Staff(
      name: _nameController.text.trim(),
      address: _addressController.text.trim(),
      Department: _roleController.text.trim(),
      Role: _departmentController.text.trim(),
      timing: '${DateFormat.jm().format(_from)}-${DateFormat.jm().format(_to)}',
    );
    await _infoService.setStaffInfo(info).then(
          (value) => Get.offAndToNamed('/landing'),
        );
  }

  void onModelReady() async {
    setState(ViewState.Busy);
    var isExist = await _infoService.doesExist();
    if (isExist) Get.offAndToNamed('/landing');
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _roleController = TextEditingController();
    _departmentController = TextEditingController();
    _from = _to = DateTime.now();
    setState(ViewState.Idle);
  }

  void onModelDestroy() {
    _nameController.dispose();
    _addressController.dispose();
    _roleController.dispose();
    _departmentController.dispose();
  }
}
