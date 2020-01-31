import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_basics/home_model.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final model = HomeModel();

  @override
  void initState() {
    model.getListData();
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          model.getListData();
        },),
        backgroundColor: Colors.grey[900],
        body: StreamBuilder(
          stream: model.homeState,
          // future: _getListData(),
          builder: (builderContext, snapshot) {
            if (snapshot.hasError) {
              return _getInformationMessage(snapshot.error);
            }

            if (!snapshot.hasData || snapshot.data == HomeViewState.Busy) {
              return Center(child: CircularProgressIndicator());
            }

            // var listItems = snapshot.data;

            if (snapshot.data == HomeViewState.Nodata) {
              return _getInformationMessage('No data found');
            }

            return ListView.builder(
              itemCount: listItems.length,
              itemBuilder: (buildContext, index) =>
                  _getListItemUi(index, listItems),
            );
          },
        ));
  }

  Widget _getListItemUi(int index, List<String> listItems) {
    return Container(
        margin: EdgeInsets.all(5.0),
        height: 50.0,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
        child: Center(
          child: Text(
            listItems[index],
            style: TextStyle(color: Colors.white),
          ),
        ));
  }

  Widget _getInformationMessage(String message) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey[500]),
      ),
    );
  }
}
