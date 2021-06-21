import 'package:flutter/material.dart';
import 'package:tiki_taka_app/src/utils/palette.dart';
import 'package:tiki_taka_app/src/utils/styles.dart';
import 'package:tiki_taka_app/src/view/global_widgets/circular_container.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
        child: Container(
      child: SizedBox(
        height: 40,
        child: Center(
          child: Row(
            children: [
              Image.asset(
                "assets/icons/search.png",
                width: 45,
              ),
              SizedBox(width: 2.0),
              Expanded(
                child: TextField(
                  cursorColor: Palette.homeHeaderColor,
                  style: searchBarTextTS,
                  decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: "search",
                      hintStyle: searchBarHintTS),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
