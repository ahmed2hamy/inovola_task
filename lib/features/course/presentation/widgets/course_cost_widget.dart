import 'package:flutter/material.dart';
import 'package:inovola_task/constants/constants.dart';
import 'package:inovola_task/features/course/data/models/course_model.dart';

class CourseCostWidget extends StatelessWidget {
  final List<ReservTypesModel> reservTypes;

  const CourseCostWidget({
    Key? key,
    required this.reservTypes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          kCourseCostString,
          style: kSubTitleTextStyle,
        ),
        const SizedBox(height: 10.0),
        ListView.builder(
          itemCount: reservTypes.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(reservTypes[index].name ?? ""),
                Text("${reservTypes[index].price}"),
              ],
            );
          },
        ),
      ],
    );
  }
}
