// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_mvm_practice_build_dahboard/UI/Components/custom_sidebar/custom_iconbutton_tile.dart';
import 'package:stacked_mvm_practice_build_dahboard/UI/Components/popups/show_custom_popup_menu.dart';
import 'package:stacked_mvm_practice_build_dahboard/UI/Dashboard/dashboard_viewmodel.dart';
import 'package:stacked_mvm_practice_build_dahboard/UI/widgets/custom_divider.dart';
import 'package:stacked_mvm_practice_build_dahboard/constant_data/popupmenu_items.dart';
import 'package:stacked_mvm_practice_build_dahboard/core/constants/colors.dart';

class CustomSidebar extends StatefulWidget {
  const CustomSidebar({
    Key? key,
  }) : super(key: key);
  @override
  State<CustomSidebar> createState() => _CustomSidebarState();
}

class _CustomSidebarState extends State<CustomSidebar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final bool _drawerClosed = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400))
      ..forward();
    _animationController.addListener(() {
      setState(() {});
      print(_animationController.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => DashboardViewModel(),
        builder: ((context, model, child) {
          return Container(
            color: Colors.white,
            width: 45 + (_animationController.value * 180),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    sideBarOpenCloseIconButton(drawerClosed: _drawerClosed),
                  ],
                ),
                Expanded(
                    child: ListView(
                  shrinkWrap: true,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomIconButtonTile(
                              iconData: Icons.dashboard_outlined,
                              text: "Overview",
                              function: () {},
                            ),
                            CustomIconButtonTile(
                              iconData: Icons.local_activity,
                              text: "Activity",
                              function: () {},
                            ),
                            const CustomDivider(),
                            CustomIconButtonTile(
                              iconData: Icons.person,
                              text: "User",
                              function: () {},
                            ),
                            CustomIconButtonTile(
                              iconData: Icons.people,
                              text: "Smart Groups",
                              function: () {},
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 11),
                              height: _animationController.value * 30,
                              child: Opacity(
                                  opacity: _animationController.value,
                                  child: const Text(
                                    "Communication",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            GestureDetector(
                              onTapDown: (details) {
                                showCustomPopupMenu(
                                    context: context,
                                    left: 230,
                                    right: 230,
                                    top: details.globalPosition.dy + 250,
                                    bottom: details.globalPosition.dy,
                                    items: CustomPopupMenuItems
                                        .communicationItems);
                              },
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      print("Pressed");
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Text("Add new features")
                                ],
                              ),
                            ),
                            SizedBox(
                                height: 400,
                                width: 45 + (_animationController.value * 180),
                                child: ReorderableListView(
                                    buildDefaultDragHandles: false,
                                    scrollDirection: Axis.vertical,
                                    onReorder: ((oldIndex, newIndex) {
                                      if (newIndex > oldIndex) {
                                        newIndex -= 1;
                                      }
                                      final item = model
                                          .getcommunicationIconList
                                          .removeAt(oldIndex);
                                      model.getcommunicationIconList
                                          .insert(newIndex, item);
                                      setState(() {});
                                    }),
                                    children: List.generate(
                                        model.getcommunicationIconList.length,
                                        (index) => ReorderableDragStartListener(
                                            enabled:
                                                _drawerClosed ? false : true,
                                            index: index,
                                            key: ValueKey(index),
                                            child:
                                                model.getcommunicationIconList[
                                                    index])))),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          );
        }));
  }

  //?+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  //* WIDGET SECTION ======================================================================
  //?+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Widget sideBarOpenCloseIconButton({required bool drawerClosed}) {
    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
          color: kBodyColorStrong),
      child: Center(
        child: Transform.rotate(
          //! 3.14 is area of circle. if want to rotate something use this value wth animationcontroller value
          angle: _animationController.value * 3.14,
          alignment: Alignment.center,
          child: IconButton(
              onPressed: () {
                if (_animationController.isCompleted) {
                  _animationController.reverse();

                  setState(() {
                    drawerClosed = true;
                    print(drawerClosed);
                  });
                } else {
                  _animationController.forward();
                  setState(() {
                    drawerClosed = false;
                    print(drawerClosed);
                  });
                }
              },
              icon: const Icon(size: 15, Icons.arrow_forward_ios)),
        ),
      ),
    );
  }
}
