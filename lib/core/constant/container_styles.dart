import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContainerStyles{

  static var mainContainerStyle = BoxDecoration(
      borderRadius: BorderRadius.circular(05.w),
      gradient: LinearGradient(
          colors: [
            Colors.blueAccent,
            Colors.blue,
            Colors.blue.withOpacity(.5),
            Colors.blueGrey,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
      )
  );

}