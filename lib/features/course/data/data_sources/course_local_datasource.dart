import 'package:inovola_task/features/course/domain/entities/course.dart';

abstract class CourseLocalDataSource {
  Future<Course> getCourseDetails();
}

class CourseLocalDataSourceImpl implements CourseLocalDataSource {
  const CourseLocalDataSourceImpl();

  @override
  Future<Course> getCourseDetails() {
    // TODO: implement getCourseDetails
    throw UnimplementedError();
  }
}
