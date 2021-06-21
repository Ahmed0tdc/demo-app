import 'package:flutter/material.dart';
import 'package:tiki_taka_app/src/utils/palette.dart';

class AppBarActionBtn extends StatelessWidget {
  final String icon;
  const AppBarActionBtn({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        "assets/icons/${this.icon}.png",
        fit: BoxFit.contain,
        width: 25,
      ),
    );

    //  Container(
    //     color: Colors.red,
    //     child: Stack(

    //       children: [
    //         Image.asset(
    //           "assets/icons/${this.icon}.png",
    //           fit: BoxFit.contain,
    //           width: 25,
    //         ),
    //         Positioned(
    //           bottom: 0,
    //           child: Icon(Icons.brightness_1, size: 10.0,
    //             color: Colors.green))
    //       ],
    //     ));
  }
}
