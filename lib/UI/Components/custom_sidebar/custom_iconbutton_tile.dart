import 'package:flutter/material.dart';

class CustomIconButtonTile extends StatefulWidget {
  static const Color kDarkGrey = Color.fromRGBO(79, 79, 79, 1);
  IconData iconData;
  String text;
  VoidCallback function;
  Color? hoverColor;
  Color? activeColor;
  Color? iconColor;
  Color? textColor;
  double? fontSize;
  CustomIconButtonTile({
    Key? key,
    required this.iconData,
    required this.text,
    required this.function,
    this.hoverColor,
    this.iconColor = kDarkGrey,
    this.textColor = kDarkGrey,
    this.fontSize = 18,
    this.activeColor,
  }) : super(key: key);

  @override
  State<CustomIconButtonTile> createState() => _CustomIconButtonTileState();
}

class _CustomIconButtonTileState extends State<CustomIconButtonTile> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovering = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: isHovering ? Colors.black12 : Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        width: 220,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Icon(
              size: 19,
              widget.iconData,
              color: widget.iconColor,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              widget.text,
              style:
                  TextStyle(color: widget.textColor, fontSize: widget.fontSize),
            )
          ],
        ),
      ),
    );
  }
}
