import 'package:flutter/material.dart';

class CustomIconButtonTile2 extends StatefulWidget {
  static const Color kDarkGrey = Color.fromRGBO(79, 79, 79, 1);
  IconData iconData;
  String text;
  VoidCallback function;
  Color? hoverColor;
  Color? activeColor;
  Color? iconColor;
  Color? textColor;
  double? fontSize;
  Color? iconBackground;
  dynamic valueKeyforReordableListTile;
  int dragindex;
  bool? drawerClosed;
  CustomIconButtonTile2(
      {Key? key,
      required this.iconData,
      required this.text,
      required this.function,
      this.hoverColor,
      this.iconColor = kDarkGrey,
      this.textColor = kDarkGrey,
      this.valueKeyforReordableListTile,
      this.fontSize = 18,
      this.drawerClosed = false,
      this.activeColor,
      required this.dragindex,
      this.iconBackground = Colors.blue})
      : super(key: key);

  @override
  State<CustomIconButtonTile2> createState() => _CustomIconButtonTileState();
}

class _CustomIconButtonTileState extends State<CustomIconButtonTile2> {
  bool isHovering = false;
  @override
  void initState() {
    print(widget.dragindex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      key: ValueKey(widget.dragindex),
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
          key: ValueKey(widget.dragindex),
          height: 40,
          decoration: BoxDecoration(
              color: isHovering ? Colors.black12 : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          width: 200,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: MouseRegion(
            cursor: SystemMouseCursors.grabbing,
            child: AnimatedPadding(
              padding: isHovering
                  ? widget.drawerClosed!
                      ? const EdgeInsets.only(left: 0)
                      : const EdgeInsets.only(left: 15)
                  : const EdgeInsets.only(left: 0),
              duration: const Duration(milliseconds: 200),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: widget.iconBackground,
                      radius: 12,
                      child: Icon(
                        size: 15,
                        widget.iconData,
                        color: widget.iconColor,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      widget.text,
                      style: TextStyle(
                          color: widget.textColor, fontSize: widget.fontSize),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
