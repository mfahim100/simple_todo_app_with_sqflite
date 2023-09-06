import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_todo_app_with_sqflite/core/constant/constant_text_style.dart';
import 'package:simple_todo_app_with_sqflite/core/controllers/insert_provider.dart';
import 'package:simple_todo_app_with_sqflite/core/models/student_models.dart';
import 'package:simple_todo_app_with_sqflite/ui/pages/update_screen.dart';
import 'package:simple_todo_app_with_sqflite/ui/widgets/view_all_data_container.dart';

class ViewAllPage extends StatelessWidget {
  const ViewAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text(
            'View All Screen',
            style: ConstTextStyles.appBarStyle,
          ),
        ),
        body: Consumer<InsertProvider>(builder: ( context, insertProvider, child) {
          return Container(
            width: 100.w,
            height: 100.h,
            color: Colors.blueGrey,
            child: Padding(
              padding: EdgeInsets.all(1.w),
              child: SizedBox(
                width: 100.w,
                height: 100.h,
                child: ListView.builder(
                    itemCount: insertProvider.listOfAllStudents.length,
                    itemBuilder: (context, index) {
                      Student mdl = insertProvider.listOfAllStudents[index];
                      return ViewAllDataContainer(
                        id: mdl.id.toString(),
                        name: mdl.name!,
                        coarseName: mdl.course!,
                        totalFee: mdl.totalFee.toString(),
                        paidFee: mdl.feePaid.toString(),
                        onEdit: () {
                          insertProvider.oldData(mdl);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return  UpdateScreen(student: mdl,);
                          }));
                        },
                        onDelete: () {
                          showDialog(context: (context), builder: (context){
                            return  AlertDialog(
                              title: const Text('Something'),
                              content: const Text('Do you want to delete the student'),
                                actions: [
                                  TextButton(onPressed: (){
                                    insertProvider.deleteStudent(mdl.id!);
                                    Navigator.of(context).pop();
                                    insertProvider.getAllStudentsProvider();
                                  }, child:const Text('Yes')),

                                  TextButton(onPressed: (){
                                    Navigator.of(context).pop();
                                  }, child:const Text('No')),

                                ],
                            );
                          });
                        },
                      );
                    }),
              ),
            ),
          );


        },)
      ),
    );
  }
}


