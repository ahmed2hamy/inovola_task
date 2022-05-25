import 'package:inovola_task/constants/constants.dart';
import 'package:inovola_task/core/error/exceptions.dart';
import 'package:inovola_task/core/network/network_client.dart';
import 'package:inovola_task/features/course/data/models/course_model.dart';
import 'package:inovola_task/features/course/domain/entities/course.dart';

abstract class CourseRemoteDataSource {
  Future<Course> getCourseDetails();
}

class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  final NetworkClient _networkClient;

  const CourseRemoteDataSourceImpl({required NetworkClient networkClient})
      : _networkClient = networkClient;

  @override
  Future<Course> getCourseDetails() async {
    try {
      Map<String, dynamic> res = await _networkClient.getData("");
      Course course = CourseModel.fromJson(res);
      return course;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
