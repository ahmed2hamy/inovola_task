import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/core/widgets/app_cached_network_image.dart';
import 'package:inovola_task/features/course/presentation/manager/course_cubit.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  void initState() {
    super.initState();
    context.read<CourseCubit>().getCourseDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CourseCubit, CourseState>(
        builder: (context, state) {
          if (state is CourseLoadedState) {
            final List<String> imagesList = state.course.img ?? [];

            return PageView.builder(
              itemCount: imagesList.length,
              itemBuilder: (context, index) {
                return AppCachedNetworkImage(imageUrl: imagesList[index]);
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
