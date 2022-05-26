import 'package:flutter/material.dart';
import 'package:inovola_task/constants/constants.dart';
import 'package:inovola_task/features/course/domain/entities/course.dart';

class CourseDetailsWidget extends StatelessWidget {
  final Course course;

  const CourseDetailsWidget({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return course.occasionDetail != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                kAboutCourseString,
                style: kSubTitleTextStyle,
              ),
              const SizedBox(height: 10.0),
              Text(course.occasionDetail ?? ""),
              const Divider(),
            ],
          )
        : const SizedBox();
  }
}
