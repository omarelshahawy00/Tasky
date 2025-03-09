import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zbooma_to_do_app/features/home/data/models/create_task_model.dart';
import 'package:zbooma_to_do_app/features/home/data/repos/home_repo/home_repo.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  final HomeRepo homeRepo;
  AddTaskCubit(this.homeRepo) : super(AddTaskInitial());

  Future<void> createNewTask(CreateTaskModel createTaskModel) async {
    emit(AddTaskLoading());
    final result = await homeRepo.createNewTask(createTaskModel);
    result.fold(
      (failure) {
        emit(AddTaskError(failure.errMessage));
      },
      (r) {
        emit(AddTaskSuccess());
      },
    );
  }
}
