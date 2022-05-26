import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/core/helpers/dialogs.dart';
import 'package:inovola_task/features/course/presentation/manager/course_cubit.dart';
import 'package:inovola_task/features/course/presentation/widgets/course_page_loaded_widget.dart';

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
      extendBodyBehindAppBar: true,
      body: BlocConsumer<CourseCubit, CourseState>(
        listener: (context, state) {
          if (state is CourseErrorState) {
            Dialogs.showAppSnackBar(context: context, content: state.message);
          }
        },
        builder: (context, state) {
          if (state is CourseLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CourseLoadedState) {
            return CoursePageLoadedWidget(course: state.course);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
