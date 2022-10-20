import 'package:flutter/material.dart';
import 'package:stacked_mvm_practice_build_dahboard/core/constants/colors.dart';

class CustomPopupMenuItems {
  static final List<PopupMenuEntry> namepopupitemslist = [
    PopupMenuItem(

        child: Container(
      padding: const EdgeInsets.all(10),
      color: kDarkGrey,
      child: Row(
        children: const [
          CircleAvatar(
            backgroundColor: Colors.cyan,
            child: Text("TN",
                style: TextStyle(
                    fontWeight: FontWeight.w900, color: Colors.white)),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "Tanzeel",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    )),
    const PopupMenuItem(
      child: ListTile(
        leading: Icon(Icons.settings),
        title: Text("Settings"),
      ),
    ),
    const PopupMenuItem(
      child: ListTile(
        leading: Icon(Icons.logout),
        title: Text("Logout"),
      ),
    ),
  ];

  static final List<PopupMenuEntry> communicationItems = [
    PopupMenuItem(
      
        child: Row(
      children: const [
        Text("Surveys"),
        Icon(Icons.document_scanner, color: kWhite)
      ],
    )),
    PopupMenuItem(
        child: Row(
      children: const [
        Text("Messages"),
        Icon(Icons.safety_check, color: Colors.blue)
      ],
    )),
    PopupMenuItem(
        child: Row(
      children: const [
        Text("Dangerous"),
        Icon(Icons.dangerous, color: Colors.red)
      ],
    )),
    PopupMenuItem(
        child: Row(
      children: const [Text("Surveys"), Icon(Icons.face, color: Colors.pink)],
    )),
  ];
}
