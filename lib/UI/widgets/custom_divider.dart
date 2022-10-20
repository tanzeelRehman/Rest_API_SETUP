import 'package:flutter/material.dart';
import 'package:stacked_mvm_practice_build_dahboard/core/constants/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    this.color,
  }) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      color: color ?? kGrey,
      margin: const EdgeInsets.symmetric(horizontal: 15),
    );
  }
}
