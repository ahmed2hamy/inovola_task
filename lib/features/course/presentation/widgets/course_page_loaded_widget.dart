import 'package:flutter/material.dart';
import 'package:inovola_task/features/course/domain/entities/course.dart';
import 'package:inovola_task/features/course/presentation/widgets/course_carousel_widget.dart';
import 'package:inovola_task/features/course/presentation/widgets/course_cost_widget.dart';
import 'package:inovola_task/features/course/presentation/widgets/course_details_widget.dart';
import 'package:inovola_task/features/course/presentation/widgets/page_actions_widget.dart';
import 'package:inovola_task/features/course/presentation/widgets/reserve_button_widget.dart';
import 'package:inovola_task/features/course/presentation/widgets/title_section_widget.dart';
import 'package:inovola_task/features/course/presentation/widgets/trainer_details_widget.dart';

class CoursePageLoadedWidget extends StatelessWidget {
  final Course course;

  const CoursePageLoadedWidget({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CourseCarouselWidget(imagesList: course.img ?? []),
              PageActionsWidget(isLiked: course.isLiked ?? false),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleSectionWidget(course: course),
                TrainerDetailsWidget(course: course),
                CourseDetailsWidget(course: course),
                CourseCostWidget(
                    reservTypes: course.reservTypesModelList ?? []),
              ],
            ),
          ),
          const ReserveButtonWidget(),
        ],
      ),
    );
  }
}
