import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:zbooma_to_do_app/core/routes/routes.dart';
import 'package:zbooma_to_do_app/core/theme/colors.dart';
import 'package:zbooma_to_do_app/core/theme/styles.dart';
import 'package:zbooma_to_do_app/features/home/data/models/create_task_model.dart';
import 'package:zbooma_to_do_app/features/home/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:zbooma_to_do_app/features/home/presentation/views/widget/add_image_item.dart';
import 'package:zbooma_to_do_app/features/home/presentation/views/widget/custom_details_item.dart';

class AddNewTaskViewBody extends StatefulWidget {
  const AddNewTaskViewBody({super.key});

  @override
  State<AddNewTaskViewBody> createState() => _AddNewTaskViewBodyState();
}

class _AddNewTaskViewBodyState extends State<AddNewTaskViewBody> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  String? _priority = 'Medium';
  String? _dueDate;
  String? _imagePath;

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _dueDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void _submitTask() {
    if (_titleController.text.isEmpty ||
        _descController.text.isEmpty ||
        _dueDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    final newTask = CreateTaskModel(
      desc: _descController.text,
      image: _imagePath ?? '',
      priority: _priority ?? 'Medium',
      title: _titleController.text,
    );

    BlocProvider.of<AddTaskCubit>(context).createNewTask(newTask);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Task added successfully!")),
          );
          Navigator.pushReplacementNamed(context, Routes.homeView);
        } else if (state is AddTaskError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Picker
              AddImageItem(
                onImageSelected: (image) {
                  setState(() {
                    _imagePath = image?.path;
                  });
                },
              ),
              SizedBox(height: 20.h),

              // Task Title
              Text(
                "Task title",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: _titleController,
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
                controller: _descController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Enter description here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Priority Selector
              Text(
                "Priority",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8.h),
              CustomDetailsItem(
                title: Text(
                  _priority ?? 'Medium',
                  style: Styles.textLBold.copyWith(
                    color: ColorsManager.appPrimaryColor,
                  ),
                ),
                iconButton: PopupMenuButton<String>(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: ColorsManager.appPrimaryColor,
                    size: 30,
                  ),
                  onSelected: (value) {
                    setState(() {
                      _priority = value;
                    });
                  },
                  itemBuilder:
                      (context) => [
                        const PopupMenuItem(value: 'Low', child: Text('Low')),
                        const PopupMenuItem(
                          value: 'Medium',
                          child: Text('Medium'),
                        ),
                        const PopupMenuItem(value: 'High', child: Text('High')),
                      ],
                ),
                backgroundColor: ColorsManager.appPrimaryColor.withOpacity(
                  0.15,
                ),
              ),
              SizedBox(height: 20.h),

              // Due Date Selector
              Text(
                "Due Date",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8.h),
              TextField(
                readOnly: true,
                onTap: _pickDate,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.calendar_month,
                    color: ColorsManager.appPrimaryColor,
                  ),
                  hintText: _dueDate ?? "Choose due date...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitTask,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.appPrimaryColor,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    "Add Task",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
