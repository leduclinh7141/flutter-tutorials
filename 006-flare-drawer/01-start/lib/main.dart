import 'package:flutter/material.dart';
import 'package:smart_flare/smart_flare.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home()
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          child: Align(alignment: Alignment.centerRight,
          child: PanFlareActor(
            width: 135.0,
            height: screenSize.height,
            filename: 'assets/slideout-menu.flr',
            openAnimation: 'open',
            closeAnimation: 'close',
            direction: ActorAdvancingDirection.RightToLeft,
            threshold: 20.0,
            reverseOnRelease: true,
            completeOnThresholdReached: true,
            activeAreas: [
              RelativePanArea(area: Rect.fromLTWH(0, 0.7, 1.0, 0.3), debugArea: false)
            ],
          ),
          )
          
        ),
      );
  }

}