import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zbooma_to_do_app/core/theme/colors.dart';
import 'package:zbooma_to_do_app/core/theme/styles.dart';
import 'package:zbooma_to_do_app/features/home/presentation/views/widget/custom_details_item.dart';

class AddNewTaskViewBody extends StatelessWidget {
  const AddNewTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Picker
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsManager.appPrimaryColor,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_photo_alternate_outlined,
                          color: ColorsManager.appPrimaryColor,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "Add Img",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: ColorsManager.appPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Task Title
            Text(
              "Task title",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.h),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter title here...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Task Description
            Text(
              "Task Description",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.h),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Enter description here...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Priority",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.h),
            CustomDetailsItem(
              title: Text(
                'Medium Priority',
                style: Styles.textLBold.copyWith(
                  color: ColorsManager.appPrimaryColor,
                ),
              ),
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_drop_down, size: 30),
                color: ColorsManager.appPrimaryColor,
              ),
              backgroundColor: ColorsManager.appPrimaryColor.withOpacity(0.15),
            ),
            SizedBox(height: 20.h),
            Text(
              "Due Date",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8.h),
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.calendar_month,
                  color: ColorsManager.appPrimaryColor,
                ),
                hintText: "Choose due date...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
