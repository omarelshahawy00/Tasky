import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zbooma_to_do_app/features/home/data/models/task_model.dart';
import 'package:zbooma_to_do_app/features/home/data/repos/home_repo/home_repo.dart';

part 'get_task_state.dart';

class GetTaskCubit extends Cubit<GetTaskState> {
  final HomeRepo homeRepo;
  GetTaskCubit(this.homeRepo) : super(GetTaskInitial());

  Future<void> getAllTasks() async {
    emit(GetTaskLoading());
    final result = await homeRepo.getAllTasks();
    result.fold((failure) {
      emit(GetTaskError(errMessage: failure.errMessage));
    }, (r) {
      emit(GetTaskSuccess(tasks: r));
    });
  }

}
