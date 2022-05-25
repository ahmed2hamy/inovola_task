part of 'course_cubit.dart';

abstract class CourseState extends Equatable {
  const CourseState();
}

class CourseInitialState extends CourseState {
  @override
  List<Object> get props => [];
}

class CourseLoadingState extends CourseState {
  @override
  List<Object> get props => [];
}

class CourseLoadedState extends CourseState {
  final Course course;

  const CourseLoadedState({required this.course});

  @override
  List<Object> get props => [];
}

class CourseErrorState extends CourseState {
  final String message;

  const CourseErrorState({required this.message});

  @override
  List<Object> get props => [];
}
