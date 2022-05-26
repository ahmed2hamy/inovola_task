import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:inovola_task/constants/constants.dart';
import 'package:inovola_task/features/course/presentation/manager/course_carousel_provider.dart';
import 'package:inovola_task/features/course/presentation/manager/course_cubit.dart';
import 'package:inovola_task/features/course/presentation/pages/course_page.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sl = GetIt.instance;

    return ChangeNotifierProvider(
      create: (_) => sl<CourseCarouselProvider>(),
      child: BlocProvider(
        create: (_) => sl<CourseCubit>(),
        child: MaterialApp(
          title: kAppTitleString,
          theme: kAppTheme,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: child ?? const SizedBox(),
            );
          },
          home: const CoursePage(),
        ),
      ),
    );
  }
}
