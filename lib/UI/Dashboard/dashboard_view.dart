import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_mvm_practice_build_dahboard/UI/Dashboard/dashboard_viewmodel.dart';

import '../Components/custom_appbar/custom_appbar.dart';
import '../Components/custom_sidebar/custom_sidebar.dart';

class DashboardView extends StatelessWidget {
//* UI ONLY
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
        viewModelBuilder: () => DashboardViewModel(),
        builder: ((context, model, child) => Scaffold(
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: CustomAppbar(),
              ),
              body: Row(
                children: [
                  const CustomSidebar(),
                  Expanded(child: Container(color: Colors.green))
                ],
              ),
            )));
  }
}
