import 'dart:convert';

import 'package:inovola_task/constants/constants.dart';
import 'package:inovola_task/core/error/exceptions.dart';
import 'package:inovola_task/features/course/data/models/course_model.dart';
import 'package:inovola_task/features/course/domain/entities/course.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CourseLocalDataSource {
  Future<void> saveCourseToLocalData(Course course);

  Future<Course> getCourseDetails();
}

class CourseLocalDataSourceImpl implements CourseLocalDataSource {
  final SharedPreferences _prefs;

  const CourseLocalDataSourceImpl({required SharedPreferences prefs})
      : _prefs = prefs;

  @override
  Future<void> saveCourseToLocalData(Course course) async {
    try {
      CourseModel model = CourseModel.fromCourse(course);
      _prefs.setString(kCourseKey, jsonEncode(model.toJson()));
    } catch (e) {
      throw (CacheException(e.toString()));
    }
  }

  @override
  Future<Course> getCourseDetails() async {
    try {
      String? json = _prefs.getString(kCourseKey);
      if (json != null) {
        CourseModel model = CourseModel.fromJson(jsonDecode(json));
        return model;
      } else {
        throw (const CacheException(kErrorNotFoundString));
      }
    } catch (e) {
      throw (CacheException(e.toString()));
    }
  }
}
