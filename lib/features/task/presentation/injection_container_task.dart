import 'package:djamo_test/core/domain/usecases/usecase.dart';
import 'package:djamo_test/features/task/data/data_sources/local/task_local_data_source.dart';
import 'package:djamo_test/features/task/data/repositories/task_repository_impl.dart';
import 'package:djamo_test/features/task/domain/repositories/task_repository.dart';
import 'package:djamo_test/features/task/domain/usecases/get_task_use_case.dart';
import 'package:djamo_test/features/task/domain/usecases/save_task_use_case.dart';
import 'package:djamo_test/features/task/presentation/bloc/task_bloc.dart';

import '../../../injection_container.dart';

class InjectionContainerTask {
  static inject() {
    ///bloc
    sl.registerFactory(() => TaskBloc(getTaskUseCase: sl(), saveTaskUseCase: sl(), ));

    ///useCase
    sl.registerLazySingleton(() => GetTaskUseCase(taskRepository: sl()));
    sl.registerLazySingleton(() => SaveTaskUseCase(taskRepository: sl()));


    ///repository
    sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(taskLocalDataSource: sl()));


    ///datasource
    sl.registerLazySingleton<TaskLocalDataSource>(() => TaskLocalDataSourceImpl(storage: sl()));
  }
}