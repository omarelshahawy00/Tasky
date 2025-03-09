import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:zbooma_to_do_app/core/errors/failures.dart';
import 'package:zbooma_to_do_app/features/home/data/models/create_task_model.dart';
import 'package:zbooma_to_do_app/features/home/data/models/task_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, void>> createNewTask( CreateTaskModel createTaskModel);
  Future<Either<Failure,List<TaskModel>>> getAllTasks();
    // Future<Either<Failure, String>> uploadFile(File file);


}