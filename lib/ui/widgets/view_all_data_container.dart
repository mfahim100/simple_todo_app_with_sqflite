import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constant/constant_text_style.dart';
import '../../core/constant/container_styles.dart';

class ViewAllDataContainer extends StatelessWidget {
  final String name, coarseName;
  final String totalFee, paidFee,id;
  final Function() onEdit;
  final Function()  onDelete;

  const ViewAllDataContainer({
    super.key,
    required this.name,
    required this.coarseName,
    required this.totalFee,
    required this.paidFee,
    required this.onEdit,
    required this.onDelete,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: Column(
        children: [
          Container(
            height: 15.h,
            width: 95.w,
            decoration: ContainerStyles.viewAllDataContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 15.h,
                  width: 70.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'ID: $id',
                        style: ConstTextStyles.viewAllContainer,
                      ),Text(
                        'Name: $name',
                        style: ConstTextStyles.viewAllContainer,
                      ),
                      Text(
                        'Coarse: $coarseName',
                        style: ConstTextStyles.viewAllContainer,
                      ),
                      Text(
                        'Total Fee: $totalFee',
                        style: ConstTextStyles.viewAllContainer,
                      ),
                      Text(
                        'Paid Fee: $paidFee',
                        style: ConstTextStyles.viewAllContainer,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                  width: 20.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: onEdit,
                          icon: Icon(
                            Icons.edit,
                            size: 08.w,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: onDelete,
                          icon: Icon(
                            Icons.delete,
                            size: 8.w,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
