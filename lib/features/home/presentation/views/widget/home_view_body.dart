import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:zbooma_to_do_app/core/theme/colors.dart';
import 'package:zbooma_to_do_app/core/theme/styles.dart';
import 'package:zbooma_to_do_app/core/utilss/assets_manager.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> filters = ['All', 'Inprogress', 'Waiting', 'Finished'];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'My Tasks',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
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
            ),
            ListView.builder(
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return _buildTaskItem();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'qr_button', // Unique hero tag
            backgroundColor: Colors.purple.shade100,
            child: const Icon(Icons.qr_code),
            onPressed: () {},
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'add_button', // Unique hero tag
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text, {bool isActive = false}) {
    return Container(
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

  Widget _buildTaskItem() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0.h),
      child: ListTile(
        leading: Image.asset(AssetsManager.taskIcon),
        title: Row(
          children: [
            const Text('Grocery Shopping', overflow: TextOverflow.ellipsis),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              width: 55.w,
              height: 22.h,
              decoration: BoxDecoration(
                color: ColorsManager.appPrimaryColor,
                borderRadius: BorderRadius.circular(5.0.r),
              ),
              child: Text(
                'Inprogress',
                style: Styles.textSMMedium.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'This application is designed for',
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Icon(Icons.flag),
                const Text('low', overflow: TextOverflow.ellipsis),
                const Spacer(),

                const Text('30/12/2022', overflow: TextOverflow.ellipsis),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,

      title: const Text(
        'Logo',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(icon: const Icon(Icons.person_outline), onPressed: () {}),
        IconButton(icon: const Icon(Icons.logout), onPressed: () {}),
      ],
    );
  }
}
