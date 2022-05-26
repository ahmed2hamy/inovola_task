import 'package:flutter/material.dart';

class PageActionsWidget extends StatelessWidget {
  final bool isLiked;

  const PageActionsWidget({
    Key? key,
    required this.isLiked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios),
            ),
            const Expanded(child: SizedBox(width: 1)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(isLiked ? Icons.star : Icons.star_border),
            ),
          ],
        ),
      ),
    );
  }
}
