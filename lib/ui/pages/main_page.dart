import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_todo_app_with_sqflite/core/constant/constant_text_style.dart';
import 'package:simple_todo_app_with_sqflite/core/constant/container_styles.dart';
import 'package:simple_todo_app_with_sqflite/core/controllers/insert_provider.dart';
import 'package:simple_todo_app_with_sqflite/ui/pages/view_all.dart';
import 'package:simple_todo_app_with_sqflite/ui/widgets/custom_button.dart';
import 'package:simple_todo_app_with_sqflite/ui/widgets/custom_text_filed.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text(
            'Insert Screen',
            style: ConstTextStyles.appBarStyle,
          ),
        ),
        body: Consumer<InsertProvider>(builder: (context, insertProvider,child) {

          return Container(
            color: Colors.blueGrey,
            height: 100.h,
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.all(0.5.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 05.h,
                    ),
                    Container(
                      height: 80.h,
                      width: 100.w,
                      decoration: ContainerStyles.mainContainerStyle,
                      child: Form(
                        key: insertProvider.insertDataKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 10.h,
                                  width: 100.w,
                                  child: Center(
                                    child: Text(
                                      'Simple Todo App',
                                      style:
                                      ConstTextStyles.mainPageMainContainer,
                                    ),
                                  )),
                              CustomTextField(
                                controller: insertProvider.nameController,
                                validator: insertProvider.nameValidator,
                                hintText: 'Enter Name',
                                labelText: 'Enter Name',
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomTextField(
                                controller: insertProvider.coarseController,
                                validator: insertProvider.coarseValidator,
                                hintText: 'Coarse',
                                labelText: 'Register In Coarse',
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomTextField(
                                controller: insertProvider.mobileNumberController,
                                validator: insertProvider.mobileNumberValidator,
                                textInputType: TextInputType.number,
                                maxLength: 11,
                                hintText: 'Mobile Number',
                                labelText: 'Mobile Number',
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomTextField(
                                controller: insertProvider.totalFeeController,
                                validator: insertProvider.totalFeeValidator,
                                textInputType: TextInputType.number,
                                hintText: 'Total Fee',
                                labelText: 'Total Fee',
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              CustomTextField(
                                controller: insertProvider.feePaidController,
                                validator: insertProvider.paidFeeValidator,
                                textInputType: TextInputType.number,
                                hintText: 'Fee Paid',
                                labelText: 'Fee Paid',
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomButton(text: 'Save', onPressed: () {
                                    if(insertProvider.insertDataKey.currentState!.validate()){
                                      insertProvider.insertStudentProvider();

                                    }
                                  }),


                                  CustomButton(
                                      text: 'View All',
                                      onPressed: () {
                                        insertProvider.getAllStudentsProvider();
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) {
                                              return const ViewAllPage();
                                            }));
                                      }),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

        },)
      ),
    );
  }
}
