import 'package:flutter/material.dart';
import 'package:tiki_taka_app/src/utils/palette.dart';
import 'package:tiki_taka_app/src/utils/styles.dart';
import 'package:tiki_taka_app/src/view/global_widgets/circular_container.dart';

class MyPurchasesTab extends StatelessWidget {
  final List<PurchasesTile> tiles = [
    PurchasesTile("France 98 Zidane", "150€", "bc_shirt"),
    PurchasesTile("France 98 Zidane", "150€", "bc_shirt"),
    PurchasesTile("France 98 Zidane", "150€", "bc_shirt"),
    PurchasesTile("France 98 Zidane", "150€", "bc_shirt"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              color: Palette.transparentColor,
              child: InkWell(
                borderRadius: BorderRadius.circular(20.0),
                onTap: () {
                
                },
                child: CircularContainer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text("En Cours"),
                  ),
                ),
              ),
            ),
            Material(
              color: Palette.transparentColor,
              child: InkWell(
                borderRadius: BorderRadius.circular(20.0),
                onTap: () {
                
                },
                child: CircularContainer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text("Historique"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      const SizedBox(height: 10.0),
      ...List.generate(
        tiles.length,
        (index) => ListTile(
          onTap: () {},
          leading: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                )
              ],
              shape: BoxShape.circle,
              color: Palette.whiteColor,
            ),
            child: Image.asset(
              "assets/images/${tiles[index].img}.png",
              width: 65,
            ),
          ),
          title: Text(
            tiles[index].title,
            style: homeCardCaptionTS,
          ),
          subtitle: Text(tiles[index].subTitle),
          trailing: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ]);
  }
}

class PurchasesTile {
  final String title;
  final String subTitle;
  final String img;

  PurchasesTile(this.title, this.subTitle, this.img);
}
