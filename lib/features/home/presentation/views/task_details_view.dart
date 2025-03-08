import 'package:flutter/material.dart';
import 'package:zbooma_to_do_app/core/theme/colors.dart';
import 'package:zbooma_to_do_app/core/theme/styles.dart';
import 'package:zbooma_to_do_app/core/utilss/assets_manager.dart';
import 'package:zbooma_to_do_app/features/home/presentation/views/widget/custom_details_item.dart';

class TaskDetailsView extends StatelessWidget {
  final String title;
  final String description;
  final String status;
  final Color statusColor;
  final String priority;
  final Color priorityColor;
  final String date;
  final String imagePath;

  const TaskDetailsView({
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'edit') {
                // Handle edit
              } else if (value == 'delete') {
                // Handle delete
              }
            },
            itemBuilder:
                (context) => [
                  const PopupMenuItem(value: 'edit', child: Text('Edit')),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text('Delete', style: TextStyle(color: Colors.red)),
                  ),
                ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Task Image
              Center(child: Image.asset(AssetsManager.taskImage)),

              const SizedBox(height: 16),

              // Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // Description
              Text(
                description,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 20),

              // End Date
              CustomDetailsItem(
                title: Text(date, style: Styles.textMDRegular),
                showLable: true,
                iconButton: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_month),
                  color: ColorsManager.appPrimaryColor,
                ),
                backgroundColor: ColorsManager.appPrimaryColor.withOpacity(
                  0.15,
                ),
              ),

              const SizedBox(height: 8),

              CustomDetailsItem(
                title: Text(
                  status,
                  style: Styles.textLBold.copyWith(color: statusColor),
                ),

                iconButton: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_drop_down, size: 30),
                  color: ColorsManager.appPrimaryColor,
                ),
                backgroundColor: ColorsManager.appPrimaryColor.withOpacity(
                  0.15,
                ),
              ),
              const SizedBox(height: 8),
              CustomDetailsItem(
                title: Text(
                  priority,
                  style: Styles.textLBold.copyWith(color: priorityColor),
                ),
                iconButton: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_drop_down, size: 30),
                  color: ColorsManager.appPrimaryColor,
                ),
                backgroundColor: ColorsManager.appPrimaryColor.withOpacity(
                  0.15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
