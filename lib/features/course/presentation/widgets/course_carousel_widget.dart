import 'package:flutter/material.dart';
import 'package:inovola_task/core/widgets/app_cached_network_image.dart';
import 'package:inovola_task/features/course/presentation/manager/course_carousel_provider.dart';
import 'package:provider/provider.dart';

class CourseCarouselWidget extends StatelessWidget {
  const CourseCarouselWidget({
    Key? key,
    required this.imagesList,
  }) : super(key: key);

  final List<String> imagesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        fit: StackFit.loose,
        children: [
          PageView.builder(
            itemCount: imagesList.length,
            itemBuilder: (context, index) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Provider.of<CourseCarouselProvider>(context, listen: false)
                    .setCurrentPageIndex(index);
              });
              return AppCachedNetworkImage(imageUrl: imagesList[index]);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: imagesList.map(
                (e) {
                  int pageIndex =
                      Provider.of<CourseCarouselProvider>(context).pageIndex;
                  int dotIndex = imagesList.indexOf(e);
                  return Container(
                    margin: const EdgeInsets.all(2.0),
                    height: dotIndex == pageIndex ? 15.0 : 10.0,
                    width: dotIndex == pageIndex ? 15.0 : 10.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
