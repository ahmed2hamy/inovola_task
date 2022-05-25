import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/core/error/failures.dart';
import 'package:inovola_task/core/use_cases/use_case.dart';
import 'package:inovola_task/features/course/domain/entities/course.dart';
import 'package:inovola_task/features/course/domain/use_cases/get_course_details_use_case.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final GetCourseDetailsUseCase _getCourseDetailsUseCase;

  CourseCubit({
    required GetCourseDetailsUseCase getCourseDetailsUseCase,
  })  : _getCourseDetailsUseCase = getCourseDetailsUseCase,
        super(CourseInitialState());

  Future getCourseDetails() async {
    emit(CourseLoadingState());
    Either<Failure, Course> res =
        await _getCourseDetailsUseCase.call(NoParams());

    res.fold(
      (failure) => emit(CourseErrorState(message: failure.message)),
      (course) => emit(CourseLoadedState(course: course)),
    );
  }
}
