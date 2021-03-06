import 'package:dartz/dartz.dart';
import 'package:inovola_task/core/error/exceptions.dart';
import 'package:inovola_task/core/error/failures.dart';
import 'package:inovola_task/core/helpers/network/network_info.dart';
import 'package:inovola_task/features/course/data/data_sources/course_local_datasource.dart';
import 'package:inovola_task/features/course/data/data_sources/course_remote_datasource.dart';
import 'package:inovola_task/features/course/domain/entities/course.dart';
import 'package:inovola_task/features/course/domain/repositories/course_reository.dart';

typedef GetCourseDetails = Future<Course> Function();

class CourseRepositoryImpl implements CourseRepository {
  final NetworkInfo _networkInfo;
  final CourseRemoteDataSource _remoteDataSource;
  final CourseLocalDataSource _localDataSource;

  CourseRepositoryImpl({
    required NetworkInfo networkInfo,
    required CourseRemoteDataSource remoteDataSource,
    required CourseLocalDataSource localDataSource,
  })  : _networkInfo = networkInfo,
        _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<Either<Failure, Course>> getCourseDetails() async {
    if (await _networkInfo.isConnected) {
      return _getCourseDetailsFromRemote();
    } else {
      return _getCourseDetailsFromLocal();
    }
  }

  Future<Either<Failure, Course>> _getCourseDetailsFromRemote() async {
    try {
      ///Get course from remote
      Course course = await _remoteDataSource.getCourseDetails();

      ///Cache course to local
      _localDataSource.saveCourseToLocalData(course);

      return Right(course);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  Future<Either<Failure, Course>> _getCourseDetailsFromLocal() async {
    try {
      Course course = await _localDataSource.getCourseDetails();
      return Right(course);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
