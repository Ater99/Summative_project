class StaffModel {
  String name;
  String address;
  String Department;
  String Role;
  String timing;

  StaffModel({
    required this.name,
    required this.address,
    required this.Department,
    required this.Role,
    required this.timing,
  });

  factory StaffModel.fromStaff(StaffModel staff) {
    return StaffModel(
      name: staff.name,
      address: staff.address,
      Department: staff.Department,
      Role: staff.Role,
      timing: staff.timing,
    );
  }
}
