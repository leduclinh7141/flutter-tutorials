import 'package:flutter/material.dart';
import 'package:scoped_guide/enums/view_state.dart';
import 'package:scoped_guide/scoped_models/home_model.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../service_locator.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<HomeModel>(
      model: locator<HomeModel>(),
      child: ScopedModelDescendant<HomeModel>(
          builder: (context, child, model) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  model.saveData();
                },
              ),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _getBodyUi(model.state),
                    Text(model.title)
                  ],
                ),
              ))),
    );
  }

  Widget _getBodyUi(ViewState state) {
    switch (state) {
      case ViewState.Busy:
        return CircularProgressIndicator();
      case ViewState.Retrieved:
      default:
        return Text('Done');
    }
  }
}
