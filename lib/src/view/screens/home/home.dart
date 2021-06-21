import 'package:flutter/material.dart';
import 'package:tiki_taka_app/src/utils/palette.dart';
import 'package:tiki_taka_app/src/utils/scroll_behavior.dart';
import 'package:tiki_taka_app/src/utils/styles.dart';
import 'package:tiki_taka_app/src/view/global_widgets/search_bar.dart';
import 'package:tiki_taka_app/src/view/screens/menu_panel/menu_panel.dart';
import './local_widgets/home_local_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Route _createRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset(0.0, 0.0);
        var curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Image.asset(
          "assets/icons/logo.png",
        ),
        leadingWidth: 65,
        leading: GestureDetector(
          child: Image.asset(
            "assets/icons/menu.png",
            width: 45,
          ),
          onTap: () {
            Navigator.of(context).push(_createRoute(MenuPanelScreen()));
          },
        ),
        actions: [
          AppBarActionBtn(icon: "messages"),
          AppBarActionBtn(icon: "notifications"),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: ScrollConfiguration(
          behavior: MyScrollBehavior(),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Acheter et Vendre des maillots de football authentiques",
                  style: latoBoldTS,
                  textAlign: TextAlign.center,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //   child: SearchBar(),
              // ),
              const SizedBox(height: 20.0),

              SizedBox(height: 420, child: DraggableCarousel()),
              // Container(color: Colors.red, height: 20, width: 100,)
            ],
          ),
        ),
      ),
    );
  }
}
