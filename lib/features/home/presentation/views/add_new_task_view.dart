import 'package:flutter/material.dart';
import 'package:zbooma_to_do_app/features/home/presentation/views/widget/add_new_task_view_body.dart';

class AddNewTaskView extends StatelessWidget {
  const AddNewTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: AddNewTaskViewBody()));
  }
}