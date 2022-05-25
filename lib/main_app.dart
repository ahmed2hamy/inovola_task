import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:inovola_task/constants/constants.dart';
import 'package:inovola_task/features/course/presentation/manager/course_cubit.dart';
import 'package:inovola_task/features/course/presentation/pages/course_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sl = GetIt.instance;

    return BlocProvider(
      create: (_) => sl<CourseCubit>(),
      child: MaterialApp(
        title: kAppTitleString,
        theme: kAppTheme,
        home: const CoursePage(),
      ),
    );
  }
}
