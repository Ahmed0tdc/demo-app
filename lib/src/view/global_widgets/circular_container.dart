import 'package:flutter/cupertino.dart';
import 'package:tiki_taka_app/src/utils/palette.dart';

class CircularContainer extends StatelessWidget {
  final Widget child;
  const CircularContainer({ Key? key, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// responsible on wrapping the provided widget with a black circular border
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Palette.blackColor, width: 3.0)),
      child: this.child,
    );
  }
}