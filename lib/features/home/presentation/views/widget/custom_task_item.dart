import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:zbooma_to_do_app/core/routes/routes.dart';
import 'package:zbooma_to_do_app/core/theme/styles.dart';

class CustomTaskItem extends StatelessWidget {
  final String title;
  final String description;
  final String status;
  final Color statusColor;
  final String priority;
  final Color priorityColor;
  final String date;
  final String imagePath;

  const CustomTaskItem({
    super.key,
    required this.title,
    required this.description,
    required this.status,
    required this.statusColor,
    required this.priority,
    required this.priorityColor,
    required this.date,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.taskDetailsView,
          arguments: {
            'title': title,
            'description': description,
            'status': status,
            'statusColor': statusColor,
            'priority': priority,
            'priorityColor': priorityColor,
            'date': date,
            'imagePath': imagePath,
          },
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 11.0.w, vertical: 12.0.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Task Image
              Image.asset(
                imagePath,
                width: 64.w,
                height: 64.h,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10.w),

              // Task Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title & Status Badge
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Gap(8.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: statusColor,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Description
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),

                    const SizedBox(height: 8),

                    // Priority & Date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.flag, color: priorityColor, size: 16.r),
                            const SizedBox(width: 4),
                            Text(
                              priority,
                              style: TextStyle(
                                color: priorityColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          date,
                          style: Styles.textMDRegular.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_vert_rounded, size: 30.r),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
