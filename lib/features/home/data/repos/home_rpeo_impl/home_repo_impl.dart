import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zbooma_to_do_app/core/errors/failures.dart';
import 'package:zbooma_to_do_app/core/network/constants/api_constant.dart';
import 'package:zbooma_to_do_app/core/network/services/api_service.dart';
import 'package:zbooma_to_do_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:zbooma_to_do_app/features/home/data/models/create_task_model.dart';
import 'package:zbooma_to_do_app/features/home/data/models/task_model.dart';
import 'package:zbooma_to_do_app/features/home/data/repos/home_repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, void>> createNewTask(
    CreateTaskModel createTaskModel,
  ) async {
    try {
      await apiService.post(
        endPoint: ApiConstant.addTaskEndPoint,
        data: createTaskModel.toJson(),
      );
      return const Right(null);
    } catch (error) {
      if (error is DioException) {
        return Left(handleError(error));
      } else {
        log("Unexpected error in home repo impl: $error");
        return Left(
          ServerFailure("An unexpected error occurred: ${error.toString()}"),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> getAllTasks() async {
    try {
      final response = await apiService.get(
        endPoint: ApiConstant.getTaskEndPoint,
      );

      if (response is List) {
        return Right(response.map((task) => TaskModel.fromJson(task)).toList());
      } else if (response is Map<String, dynamic> &&
          response.containsKey("tasks")) {
        final tasksList = response["tasks"] as List<dynamic>;
        return Right(
          tasksList.map((task) => TaskModel.fromJson(task)).toList(),
        );
      } else {
        return Left(ServerFailure("Unexpected response format"));
      }
    } catch (error) {
      if (error is DioException) {
        return Left(handleError(error));
      } else {
        log("Unexpected error in home repo impl: $error");
        return Left(
          ServerFailure("An unexpected error occurred: ${error.toString()}"),
        );
      }
    }
  }

  @override
  Future<Either<Failure, String>> uploadFile(File file) async {
    try {
      final response = await apiService.post(
        endPoint: ApiConstant.uploadFileEndPoint,
        data: {"file": await MultipartFile.fromFile(file.path)},
      );

      return Right(response["url"]);
    } catch (e) {
      if (e is DioException) {
        return Left(handleError(e));
      } else {
        log("Unexpected error in home repo impl: $e");
        return Left(
          ServerFailure("An unexpected error occurred: ${e.toString()}"),
        );
      }
    }
  }
}
