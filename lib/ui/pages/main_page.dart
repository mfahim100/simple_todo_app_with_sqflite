import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_todo_app_with_sqflite/core/constant/constant_text_style.dart';
import 'package:simple_todo_app_with_sqflite/core/constant/container_styles.dart';
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
          title:  Text('Insert Screen',style: ConstTextStyles.appBarStyle,),
        ),
        body: Container(
          color: Colors.blueGrey,
          height: 100.h,
          width: 100.w,
          child: Padding(
            padding: EdgeInsets.all(0.5.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 05.h,),
                  Container(
                    height: 70.h,
                    width: 100.w,
                   decoration:ContainerStyles.mainContainerStyle,
                    child: Form(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                                height: 10.h,
                                width: 100.w,
                                child: Center(child: Text('Simple Todo App',style: ConstTextStyles.mainPageMainContainer,),)
                            ),
                            
                            CustomTextField(
                              hintText: 'Enter Name',
                              labelText: 'Enter Name',
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomTextField(
                              hintText: 'Coarse',
                              labelText: 'Register In Coarse',
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomTextField(
                              textInputType: TextInputType.number,
                              maxLength: 11,
                              hintText: 'Mobile Number',
                              labelText: 'Mobile Number',
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomTextField(
                              textInputType: TextInputType.number,
                              hintText: 'Total Fee',
                              labelText: 'Total Fee',
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomTextField(
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
                                CustomButton(text: 'Save', onPressed: (){}),
                                CustomButton(text: 'View All', onPressed: (){}),
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
        ),
      ),
    );
  }
}
