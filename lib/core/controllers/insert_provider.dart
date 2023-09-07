import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_todo_app_with_sqflite/core/models/student_models.dart';
import 'package:simple_todo_app_with_sqflite/core/models/update_student_model.dart';
import 'package:simple_todo_app_with_sqflite/core/services/database_services.dart';
import 'package:sqflite/sqflite.dart';

class InsertProvider extends ChangeNotifier {

  var insertDataKey = GlobalKey<FormState>();



  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _coarseController = TextEditingController();
  TextEditingController get coarseController => _coarseController;

  final TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController get mobileNumberController => _mobileNumberController;

  final TextEditingController _totalFeeController = TextEditingController();
  TextEditingController get totalFeeController => _totalFeeController;


  final TextEditingController _feePaidController = TextEditingController();
  TextEditingController get feePaidController => _feePaidController;


  String? nameValidator(String? val) {
    if (val!.isEmpty) {
      return 'Please Enter name';
    }
    return null;
  }

  String? coarseValidator(String? val) {
    if (val!.isEmpty) {
      return 'Please Enter Coarse Name';
    }
    return null;
  }


  String? mobileNumberValidator(String? val) {
    if (val!.isEmpty) {
      return 'Please Enter Mobile Number';
    }
    return null;
  }


  String? totalFeeValidator(String? val) {
    if (val!.isEmpty) {
      return 'Please Enter Total Fee';
    }
    return null;
  }


  String? paidFeeValidator(String? val) {
    if (val!.isEmpty) {
      return 'Please Paid Fee';
    }
    return null;
  }

  void clearController(){
    _nameController.clear();
    _coarseController.clear();
    _mobileNumberController.clear();
    _totalFeeController.clear();
    _feePaidController.clear();

  }

  Future<void> insertStudentProvider()  async {
    EasyLoading.show();
    String name = _nameController.text.trim();
    String coarseName = _coarseController.text.trim();
    String mobile = _mobileNumberController.text.trim();
    String totalFee = _totalFeeController.text.trim();
    String feePaid = _feePaidController.text.trim();
    Student student = Student(name, coarseName, mobile, int.parse(totalFee), int.parse(feePaid),);
   int result = await DatabaseServices.instance.insertStudent(student);
   if(result>0){
     Fluttertoast.showToast(msg: 'Record Inserted');
   }
   else{
     Fluttertoast.showToast(msg: 'Something Went Wrong');
   }
   EasyLoading.dismiss();
   clearController();
   notifyListeners();

  }



  List<Student> listOfAllStudents = [];
  Future<void> getAllStudentsProvider() async {
    listOfAllStudents.clear();
    listOfAllStudents = await DatabaseServices.instance.getAllStudents();
    print(listOfAllStudents.length);
    notifyListeners();

  }


  Future<void> deleteStudent(int id)async {

    int result = await DatabaseServices.instance.deleteStudent(id);
    notifyListeners();
  }


  void oldData(Student s){
    int id   = s.id!;
    _nameController.text = s.name!;
    _coarseController.text = s.course!;
    _mobileNumberController.text = s.mobile!;
    _totalFeeController.text = s.totalFee!.toString();
    _feePaidController.text = s.feePaid!.toString();
    notifyListeners();
  }


  Future<void> updateDataProvider(int id) async {
    EasyLoading.show();
    print('Before Something');
    String name = _nameController.text.trim();
    String coarseName = _coarseController.text.trim();
    String mobile = _mobileNumberController.text.trim();
    String totalFee = _totalFeeController.text.trim();
    String feePaid = _feePaidController.text.trim();
    UpdateStudentModel student = UpdateStudentModel(id,name, coarseName, mobile, int.parse(totalFee), int.parse(feePaid),);
    int result = await DatabaseServices.instance.updateStudent(student);
    if(result>0){
      Fluttertoast.showToast(msg: 'Record Updated');
    }
    else{
      Fluttertoast.showToast(msg: 'Something Went Wrong');
    }
    getAllStudentsProvider();
    print('After Something');
    EasyLoading.dismiss();
    notifyListeners();
  }





}