part of 'add_task_cubit.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

final class AddTaskSuccess extends AddTaskState {}

final class AddTaskError extends AddTaskState {
  final String errorMessage;
  AddTaskError(this.errorMessage);
}

final class AddTaskLoading extends AddTaskState {}
