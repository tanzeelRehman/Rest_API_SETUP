import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_mvm_practice_build_dahboard/UI/Components/custom_sidebar/custom_conbutton_tile2.dart';

//* MANAGE BUISNESS LOGIC AND APP STATE
class DashboardViewModel extends BaseViewModel {
  final int _count = 0;

  final List<CustomIconButtonTile2> _communicationIconList = [
    CustomIconButtonTile2(
      valueKeyforReordableListTile: "UPD",
      iconData: Icons.email,
      iconColor: Colors.white,
      iconBackground: Colors.blue,
      text: "Updates",
      dragindex: 0,
      function: () {},
    ),
    CustomIconButtonTile2(
      valueKeyforReordableListTile: "CHAT",
      iconData: Icons.chat,
      iconColor: Colors.white,
      iconBackground: Colors.green,
      text: "Chat",
      dragindex: 1,
      function: () {},
    ),
    CustomIconButtonTile2(
      valueKeyforReordableListTile: "DIRCT",
      iconData: Icons.folder,
      iconColor: Colors.white,
      dragindex: 2,
      iconBackground: Colors.red,
      text: "Direcatory",
      function: () {},
    ),
  ];

  List<CustomIconButtonTile2> get getcommunicationIconList =>
      _communicationIconList;
}
