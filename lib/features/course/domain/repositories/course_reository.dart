import 'package:dartz/dartz.dart';
import 'package:inovola_task/core/error/failures.dart';
import 'package:inovola_task/features/course/domain/entities/course.dart';

abstract class CourseRepository {
  Future<Either<Failure, Course>> getCourseDetails();
}