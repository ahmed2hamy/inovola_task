import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:inovola_task/core/network/network_client.dart';
import 'package:inovola_task/core/network/network_info.dart';
import 'package:inovola_task/injection_container/inject_course_feature.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///Features:
  //Course:
  injectCourseFeature(sl);

  ///Core:
  sl.registerLazySingleton<NetworkClient>(
    () => NetworkClient(dio: sl<Dio>()),
  );
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectivity: sl<Connectivity>()),
  );

  ///External:
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  SharedPreferences prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);
}
