// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:stacked_mvm_practice_build_dahboard/constant_data/notification_list.dart';
import 'package:stacked_mvm_practice_build_dahboard/core/constants/colors.dart';
import 'package:stacked_mvm_practice_build_dahboard/models/notificarion_model.dart';

import '../../../../core/extensions/hero_dialog_route.dart';

Future bellIconHeroPopup({
  required BuildContext context,
  dynamic data,
  required Object heroTag,
  required Rect rect,
}) {
  return Navigator.push(
    context,
    HeroDialogRoute(
      builder: (context) => Stack(
        children: [
          Positioned(
            right: rect.right,
            left: rect.left,
            top: 40,
            child: const Icon(size: 60, color: kWhite, Icons.arrow_drop_up),
          ),
          Positioned(
              //* increase the number will increase LEFT/RIGHT width and decrease will decrease it
              right: rect.right - 425,
              left: rect.left - 360,
              top: 74,
              child: Hero(tag: heroTag, child: NotificationBox())),
        ],
      ),
    ),
  );
}

class NotificationBox extends StatelessWidget {
  GlobalKey notificationContainerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        key: notificationContainerKey,
        width: 400,
        clipBehavior: Clip.antiAlias,
        height: notificationList.isNotEmpty ? 300 : null,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15)),
          color: kWhite,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: const Text(
                    "Earlier",
                    style: TextStyle(color: kGrey, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: kGrey,
                  height: 1,
                ),
                for (var element in notificationList)
                  NotificationTile(model: element)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final NotificationModel model;
  const NotificationTile({
    Key? key,
    required this.model,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: kBodyColor,
          border: Border(left: BorderSide(width: 3, color: kBlue))),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 30,
              child: Text(
                model.prefix,
                style: const TextStyle(
                    fontWeight: FontWeight.w900, color: kWhite, fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: double.infinity, child: Text(model.desc)),
                  Text(
                    model.date,
                    style: const TextStyle(color: kGrey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
