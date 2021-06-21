import 'package:flutter/material.dart';
import 'package:tiki_taka_app/src/utils/palette.dart';
import 'package:tiki_taka_app/src/view/global_widgets/circular_container.dart';

class ModifyProfileBtn extends StatelessWidget {
  const ModifyProfileBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Palette.transparentColor,
      child: InkWell(
         borderRadius: BorderRadius.circular(20.0),
        onTap: (){},
        child: CircularContainer(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 4.0),
          child: Text("Modifier le profil"),
        )),
      ),
    );
  }
}
