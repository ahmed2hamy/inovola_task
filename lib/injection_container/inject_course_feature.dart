import 'package:get_it/get_it.dart';
import 'package:inovola_task/core/network/network_client.dart';
import 'package:inovola_task/core/network/network_info.dart';
import 'package:inovola_task/features/course/data/data_sources/course_local_datasource.dart';
import 'package:inovola_task/features/course/data/data_sources/course_remote_datasource.dart';
import 'package:inovola_task/features/course/data/repositories/course_repository_impl.dart';
import 'package:inovola_task/features/course/domain/repositories/course_reository.dart';
import 'package:inovola_task/features/course/domain/use_cases/get_course_details_use_case.dart';
import 'package:inovola_task/features/course/presentation/manager/course_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> injectCourseFeature(GetIt sl) async {
  ///Bloc:
  sl.registerLazySingleton<CourseCubit>(
    () => CourseCubit(getCourseDetailsUseCase: sl<GetCourseDetailsUseCase>()),
  );

  ///UseCases:
  sl.registerFactory<GetCourseDetailsUseCase>(
    () => GetCourseDetailsUseCase(repository: sl<CourseRepository>()),
  );

  ///Data - Repository:
  sl.registerFactory<CourseRepository>(
    () => CourseRepositoryImpl(
      networkInfo: sl<NetworkInfo>(),
      remoteDataSource: sl<CourseRemoteDataSource>(),
      localDataSource: sl<CourseLocalDataSource>(),
    ),
  );

  ///Data - DataSources:
  sl.registerFactory<CourseRemoteDataSource>(
    () => CourseRemoteDataSourceImpl(
      networkClient: sl<NetworkClient>(),
    ),
  );
  sl.registerFactory<CourseLocalDataSource>(
    () => CourseLocalDataSourceImpl(prefs: sl<SharedPreferences>()),
  );
}
