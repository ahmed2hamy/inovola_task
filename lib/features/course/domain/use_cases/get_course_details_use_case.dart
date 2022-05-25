import 'package:dartz/dartz.dart';
import 'package:inovola_task/core/error/failures.dart';
import 'package:inovola_task/core/use_cases/use_case.dart';
import 'package:inovola_task/features/course/domain/entities/course.dart';
import 'package:inovola_task/features/course/domain/repositories/course_reository.dart';

class GetCourseDetailsUseCase extends UseCase<Course, NoParams> {
  final CourseRepository _repository;

  const GetCourseDetailsUseCase({required CourseRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, Course>> call(params) {
    return _repository.getCourseDetails();
  }
}
