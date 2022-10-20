import 'package:flutter/material.dart';
import 'package:stacked_mvm_practice_build_dahboard/core/constants/colors.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CircleAvatar(
          backgroundColor: Colors.cyan,
          child: Text(
            "TN",
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "Tanzeel ur Rehman",
          style: TextStyle(fontSize: 20, color: kGrey),
        ),
        SizedBox(
          width: 8.0,
        ),
        Icon(color: kGrey, Icons.arrow_drop_down_circle_outlined)
      ],
    );
  }
}
