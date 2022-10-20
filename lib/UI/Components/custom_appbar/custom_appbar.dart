import 'package:flutter/material.dart';
import 'package:stacked_mvm_practice_build_dahboard/UI/Components/custom_appbar/hero_searchbar.dart';
import 'package:stacked_mvm_practice_build_dahboard/UI/Components/custom_appbar/inner_glow_button.dart';
import 'package:stacked_mvm_practice_build_dahboard/UI/Components/custom_appbar/logo_widget.dart';
import 'package:stacked_mvm_practice_build_dahboard/UI/Components/custom_appbar/name_widget.dart';
import 'package:stacked_mvm_practice_build_dahboard/UI/widgets/custom_divider.dart';
import 'package:stacked_mvm_practice_build_dahboard/UI/Components/popups/custom_hero_popups/bellIcon_hero_popup.dart';
import 'package:stacked_mvm_practice_build_dahboard/UI/Components/popups/show_custom_popup_menu.dart';
import 'package:stacked_mvm_practice_build_dahboard/constant_data/popupmenu_items.dart';
import 'package:stacked_mvm_practice_build_dahboard/core/constants/colors.dart';
import 'package:stacked_mvm_practice_build_dahboard/core/extensions/global_location.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey notificationIconKey = GlobalKey();
    final GlobalKey searchbarKey = GlobalKey();
    return Container(
      height: 60,
      decoration: const BoxDecoration(color: kWhite, boxShadow: [
        BoxShadow(
          color: kBlack12,
          blurRadius: 1,
          spreadRadius: 1,
        )
      ]),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const LogoWidget(),
          const SizedBox(
            width: 60,
          ),
          HeroSearchBar(searchbarKey: searchbarKey),
          const SizedBox(
            width: 20,
          ),
          const InnerGlowButton(),
          const CustomDivider(),
          IconButton(
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            icon: const Icon(Icons.network_wifi),
            onPressed: () {},
          ),
          const CustomDivider(),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Company",
                style: TextStyle(fontSize: 13, color: kGrey),
              ),
              Text(
                "Code: 102456",
                style: TextStyle(fontSize: 13, color: kGrey),
              ),
            ],
          ),
          const CustomDivider(),
          //* HERO BELL WIDGET
          Hero(
              tag: "BellIcon",
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                    key: notificationIconKey,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    color: Colors.cyan,
                    onPressed: () {
                      final rect = notificationIconKey.globalPaintBounds;
                      bellIconHeroPopup(
                          context: context, heroTag: "BellIcon", rect: rect);
                    },
                    icon: const Icon(Icons.notifications_active_outlined)),
              )),
          const CustomDivider(),
          const SizedBox(
            width: 40,
          ),
          GestureDetector(
            onTapDown: (details) {
              showCustomPopupMenu(
                  context: context,
                  left: details.globalPosition.dx,
                  //* Also provide some space from right as well. otherwise the menu will stick to the left
                  right: 100,
                  top: 55,
                  bottom: 0,
                  items: CustomPopupMenuItems.namepopupitemslist);
            },
            child: const NameWidget(),
          )
        ],
      ),
    );
  }
}
