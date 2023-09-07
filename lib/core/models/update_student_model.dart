class UpdateStudentModel {
  int? id;
  String? name;
  String? course;
  String? mobile;
  int? totalFee;
  int? feePaid;

  UpdateStudentModel(
      this.id,
      this.name,
      this.course,
      this.mobile,
      this.totalFee,
      this.feePaid,
      );

  // convert a Student object into map object

  Map<String, dynamic> toMap() {
    Map<String,dynamic> map = {};
    map['id'] = id;
    map['name'] = name;
    map['course'] = course;
    map['mobile'] = mobile;
    map['totalFee'] = totalFee;
    map['feePaid'] = feePaid;
    return map;
  }

  // Extract a student object from a map object
  UpdateStudentModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    course = map['course'];
    mobile = map['mobile'];
    totalFee = map['totalFee'];
    feePaid = map['feePaid'];
  }
}
