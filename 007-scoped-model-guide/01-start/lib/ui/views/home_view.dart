import 'package:flutter/material.dart';
import 'package:scoped_guide/enums/view_state.dart';
import 'package:scoped_guide/scoped_models/home_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel> (
      builder: (context, child, model) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  // model.saveData();
                  var whereToNavigate = await model.saveData();

                  if (whereToNavigate) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SussessView()))
                  }
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
              ))
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
