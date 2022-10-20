import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_mvm_practice_build_dahboard/UI/Second/second_viewmodel.dart';

class SecondView extends StatelessWidget {
//* UI ONLY
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SecondViewModel>.reactive(
        viewModelBuilder: () => SecondViewModel(),
        builder: ((context, model, child) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
              ),
              body: Center(
                child: Container(
                  child: const Text("This is second page"),
                ),
              ),
            )));
  }
}
