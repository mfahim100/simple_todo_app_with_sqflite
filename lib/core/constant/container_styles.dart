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

  static var viewAllDataContainer = BoxDecoration(
      borderRadius: BorderRadius.circular(05.w),
      gradient: LinearGradient(
          colors: [
            Colors.black12,
            Colors.blue,
            Colors.blue.withOpacity(.5),
            Colors.black12,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
      )
  );

}