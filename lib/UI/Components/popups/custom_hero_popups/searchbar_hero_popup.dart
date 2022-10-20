import 'package:flutter/material.dart';
import 'package:stacked_mvm_practice_build_dahboard/core/extensions/hero_dialog_route.dart';
import 'package:stacked_mvm_practice_build_dahboard/core/constants/colors.dart';

Future showSearchHeroDialog({
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              color: kBlack26,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Center(
            child: Hero(
              tag: heroTag,
              child: Container(
                width: 200,
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: kBodyColor,
                    borderRadius: BorderRadius.circular(8.0)),
                child: const Center(
                  child: Material(
                    color: Colors.transparent,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search features",
                          hintStyle: TextStyle(color: kGrey),
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.search,
                            color: kGrey,
                          )),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
