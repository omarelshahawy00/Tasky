import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:zbooma_to_do_app/core/routes/routes.dart';
import 'package:zbooma_to_do_app/core/theme/colors.dart';
import 'package:zbooma_to_do_app/core/theme/styles.dart';
import 'package:zbooma_to_do_app/core/utilss/assets_manager.dart';
import 'package:zbooma_to_do_app/core/widgets/custom_app_bar.dart';
import 'package:zbooma_to_do_app/features/home/presentation/views/widget/custom_task_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> filters = ['All', 'Inprogress', 'Waiting', 'Finished'];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            children: [
              const CustomAppBar(),
              Gap(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'My Tasks',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Gap(16.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    filters.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 8.0.w),
                      child: _buildFilterButton(
                        filters[index],
                        isActive: index == 0,
                      ),
                    ),
                  ),
                ),
              ),
              Gap(16.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return CustomTaskItem(
                    title: 'Grocery Shopping',
                    date: '12,June,2023',
                    description: 'Buy groceries for the week',
                    imagePath: AssetsManager.taskIcon,
                    priority: 'High',
                    priorityColor: Colors.red,
                    status: 'waiting',
                    statusColor: Colors.red,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'qr_button', // Unique hero tag
            elevation: 0,
            mini: true,
            backgroundColor: ColorsManager.appPrimaryColor.withOpacity(0.1),
            child: const Icon(
              Icons.qr_code,
              color: ColorsManager.appPrimaryColor,
            ),
            onPressed: () {},
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: ColorsManager.appPrimaryColor,

            heroTag: 'add_button', // Unique hero tag
            child: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, Routes.addNewTaskView);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text, {bool isActive = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color:
            isActive
                ? ColorsManager.appPrimaryColor
                : ColorsManager.appPrimaryColor.withOpacity(0.1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        text,
        style: Styles.textLRegular.copyWith(
          color: isActive ? Colors.white : const Color(0xff7c7c80),
        ),
      ),
    );
  }
}
