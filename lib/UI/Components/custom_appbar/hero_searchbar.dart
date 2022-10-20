import 'package:flutter/material.dart';
import 'package:stacked_mvm_practice_build_dahboard/UI/Components/popups/custom_hero_popups/searchbar_hero_popup.dart';
import 'package:stacked_mvm_practice_build_dahboard/core/constants/colors.dart';
import 'package:stacked_mvm_practice_build_dahboard/core/extensions/global_location.dart';

class HeroSearchBar extends StatelessWidget {
  const HeroSearchBar({
    Key? key,
    required this.searchbarKey,
  }) : super(key: key);

  final GlobalKey<State<StatefulWidget>> searchbarKey;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "SearchBar",
      child: Container(
        width: 200,
        height: 60,
        key: searchbarKey,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: kBodyColor, borderRadius: BorderRadius.circular(8.0)),
        child: Center(
          child: Material(
            child: TextField(
              onTap: () {
                showSearchHeroDialog(
                    context: context,
                    heroTag: "SearchBar",
                    rect: searchbarKey.globalPaintBounds);
              },
              decoration: const InputDecoration(
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
    );
  }
}
