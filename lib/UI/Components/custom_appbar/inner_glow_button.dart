import 'package:flutter/material.dart';
import 'package:stacked_mvm_practice_build_dahboard/core/constants/colors.dart';

class InnerGlowButton extends StatefulWidget {
  const InnerGlowButton({super.key});

  @override
  State<InnerGlowButton> createState() => _InnerGlowButtonState();
}

class _InnerGlowButtonState extends State<InnerGlowButton> {
  bool hoveronbutton = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          hoveronbutton = true;
        });
      },
      onExit: (event) {
        setState(() {
          hoveronbutton = false;
        });
      },
      child: AnimatedContainer(
        width: 150,
        height: 40,
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 300),
        // padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: hoveronbutton ? Colors.cyan : kGrey,
            width: hoveronbutton ? 3 : 1,
          ),
        ),
        child: Text(
          "Upgrade now",
          style: TextStyle(
              fontSize: 17, color: hoveronbutton ? Colors.cyan : kGrey),
        ),
      ),
    );
  }
}
