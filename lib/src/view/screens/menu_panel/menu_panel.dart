import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_taka_app/src/providers/panel_tabs_selection.dart';
import 'package:tiki_taka_app/src/utils/palette.dart';
import 'package:tiki_taka_app/src/utils/styles.dart';
import 'package:tiki_taka_app/src/view/global_widgets/search_bar.dart';
import 'package:tiki_taka_app/src/view/screens/menu_panel/tabs/tabs.dart';

import 'local_widgets/panel_local_widgets.dart';

class MenuPanelScreen extends StatelessWidget {
  MenuPanelScreen({Key? key}) : super(key: key);

  final List<TileModel> options = [
    TileModel("Mes achats", "ticket"),
    TileModel("Mes articles suivis", "shape"),
    TileModel("Mon espace vendeur", "seller"),
    TileModel("Centre d’aide", "support"),
    TileModel("Enchéres", "hammer"),
    TileModel("Suivre ma livraison", "pin"),
    TileModel("Recrutement", "greeting"),
    TileModel("Avis", "rate"),
    TileModel("Comment ça marche", "faq"),
    TileModel("Sécurité", "privacy"),
    TileModel("Adresse de livraison", "shipping"),
    TileModel("Langue", "language"),
    TileModel("Méthode de paiement", "pending payment"),
  ];

  final List<Widget> tabs = [
    MyPurchasesTab(),
    Center(child: Text("tab 2", style: latoBoldTS)),
    Center(child: Text("tab 3", style: latoBoldTS)),
    Center(child: Text("tab 4", style: latoBoldTS)),
    Center(child: Text("tab 5", style: latoBoldTS)),
    Center(child: Text("tab 6", style: latoBoldTS)),
    Center(child: Text("tab 7", style: latoBoldTS)),
    Center(child: Text("tab 8", style: latoBoldTS)),
    Center(child: Text("tab 9", style: latoBoldTS)),
    Center(child: Text("tab 10", style: latoBoldTS)),
    Center(child: Text("tab 11", style: latoBoldTS)),
    Center(child: Text("tab 12", style: latoBoldTS)),
    Center(child: Text("tab 13", style: latoBoldTS)),
  ];

  @override
  Widget build(BuildContext context) {
    final tabsSelectionProvider = Provider.of<TabsSelectionProvider>(context);
    return WillPopScope(
      onWillPop: () {
        var retVal;
        if (tabsSelectionProvider.getTabClicked) {
          tabsSelectionProvider.setTabClicked = false;
          retVal = Future.value(false);
        } else {
          retVal = Future.value(true);
        }
        return retVal;
      },
      child: Scaffold(
        backgroundColor: Palette.whiteColor,
        appBar: AppBar(
          leading: tabsSelectionProvider.getTabClicked
              ? GestureDetector(
                  onTap: () => tabsSelectionProvider.setTabClicked = false,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Palette.blackColor,
                  ),
                )
              : SizedBox.shrink(),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                      backgroundColor: Palette.profileBgColor,
                      radius: 50,
                      child: Image.asset(
                        "assets/images/profile.png",
                        width: 75,
                      )),
                  SizedBox(width: 20.0),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Paul Doe',
                        style: userNameTS,
                      ),
                      Text('email@email.com'),
                      SizedBox(height: 10.0),
                      ModifyProfileBtn()
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            tabsSelectionProvider.getTabClicked
                ? this.tabs[tabsSelectionProvider.getTabIndex]
                : Expanded(
                    child: Scrollbar(
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        children: [
                          SearchBar(),
                          ...List.generate(
                            this.options.length,
                            (index) => ListTile(
                              onTap: () {
                                tabsSelectionProvider.setTabClicked = true;
                                tabsSelectionProvider.setTabIndex = index;
                              },
                              leading: Container(
                                child: Image.asset(
                                    "assets/icons/${options[index].icon}.png"),
                              ),
                              title: Text(
                                options[index].label,
                                style:
                                    TextStyle(color: Palette.homeHeaderColor),
                              ),
                              trailing: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Palette.homeHeaderColor,
                                ),
                                child: Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class TileModel {
  final String label;
  final String icon;

  TileModel(this.label, this.icon);
}
