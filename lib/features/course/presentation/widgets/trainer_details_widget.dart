import 'package:flutter/material.dart';
import 'package:inovola_task/core/widgets/app_cached_network_image.dart';
import 'package:inovola_task/features/course/domain/entities/course.dart';

class TrainerDetailsWidget extends StatelessWidget {
  final Course course;

  const TrainerDetailsWidget({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            course.trainerImg != null
                ? Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      clipBehavior: Clip.antiAlias,
                      child: AppCachedNetworkImage(
                          imageUrl: course.trainerImg ?? ""),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(width: 5.0),
            course.trainerName != null
                ? Text(course.trainerName ?? "")
                : const SizedBox(),
          ],
        ),
        const SizedBox(height: 10.0),
        course.trainerInfo != null
            ? Text(course.trainerInfo ?? "")
            : const SizedBox(),
        const Divider(),
      ],
    );
  }
}
