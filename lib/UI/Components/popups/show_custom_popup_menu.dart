// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

Future<void> showCustomPopupMenu(
    {required BuildContext context,
    required double left,
    required double right,
    required double top,
    required double bottom,
    required List<PopupMenuEntry> items}) async {
  return await showMenu(
    
      context: context,
      position: RelativeRect.fromLTRB(left, top, right, bottom),
      items: items,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))));
}
