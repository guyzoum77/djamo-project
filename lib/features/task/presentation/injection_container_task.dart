import 'package:djamo_test/core/domain/usecases/usecase.dart';
import 'package:djamo_test/features/task/data/data_sources/local/task_local_data_source.dart';
import 'package:djamo_test/features/task/data/repositories/fetch_all_task_repository_impl.dart';
import 'package:djamo_test/features/task/domain/repositories/task_repository.dart';
import 'package:djamo_test/features/task/domain/usecases/fecth_all_tasks_use_case.dart';
import 'package:djamo_test/features/task/presentation/bloc/task_bloc.dart';

import '../../../injection_container.dart';

class InjectionContainerTask {
  static inject() {
    ///bloc
    sl.registerFactory(() => TaskBloc(fetchAllTaskUseCase: sl()));

    ///useCase
    sl.registerLazySingleton(() => FetchAllTaskUseCase(taskRepository: sl()));


    ///repository
    sl.registerLazySingleton<TaskRepository>(() => FetchAllTaskRepositoryImpl(taskLocalDataSource: sl()));


    ///datasource
    sl.registerLazySingleton<TaskLocalDataSource>(() => TaskLocalDataSourceImpl(sharedPreference: sl()));
  }
}