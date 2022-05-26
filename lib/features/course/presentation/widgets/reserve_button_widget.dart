import 'package:flutter/material.dart';
import 'package:inovola_task/constants/constants.dart';

class ReserveButtonWidget extends StatelessWidget {
  const ReserveButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.15,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {},
        style: kNoBorderButtonStyle,
        child: const Text(kReserveNowString),
      ),
    );
  }
}
