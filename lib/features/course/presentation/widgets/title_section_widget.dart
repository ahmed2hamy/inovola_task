import 'package:flutter/material.dart';
import 'package:inovola_task/constants/constants.dart';
import 'package:inovola_task/core/utils/date_time_coverter.dart';
import 'package:inovola_task/features/course/domain/entities/course.dart';

class TitleSectionWidget extends StatelessWidget {
  final Course course;

  const TitleSectionWidget({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime? date = DateTime.tryParse(course.date ?? "");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        course.interest != null
            ? Text("#${course.interest}")
            : const SizedBox(),
        const SizedBox(height: 10.0),
        course.title != null
            ? Text(
                course.title ?? "",
                style: kTitleTextStyle,
              )
            : const SizedBox(),
        const SizedBox(height: 10.0),
        date != null
            ? Row(
                children: [
                  const Icon(Icons.date_range),
                  const SizedBox(width: 5),
                  Text("${DateTimeConverter.getWeekDay(date)} , "
                      "${date.day}${DateTimeConverter.getMonth(date)} , "
                      "${DateTimeConverter.getTime(date)}"),
                ],
              )
            : const SizedBox(),
        const SizedBox(height: 5),
        course.address != null
            ? Row(
                children: [
                  const Icon(Icons.location_on_outlined),
                  const SizedBox(width: 5),
                  Text(course.address ?? ""),
                ],
              )
            : const SizedBox(),
        const Divider(),
      ],
    );
  }
}
