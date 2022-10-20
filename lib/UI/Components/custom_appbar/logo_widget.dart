import 'package:flutter/material.dart';
import 'package:stacked_mvm_practice_build_dahboard/core/constants/colors.dart';

class LogoWidget extends StatefulWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        child: Text(
          "DashiDashboard",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isHover ? Colors.cyan : kGrey),
        ),
      ),
    );
  }
}
