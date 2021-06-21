import 'package:flutter/material.dart';
import 'package:tiki_taka_app/src/utils/palette.dart';
import 'package:tiki_taka_app/src/utils/styles.dart';
import 'package:tiki_taka_app/src/view/screens/home/home.dart';

class RootScreen extends StatefulWidget {
  RootScreen({Key? key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Center(child: Text("search", style: latoBoldTS)),
    Center(child: Text("buy", style: latoBoldTS)),
    Center(child: Text("account", style: latoBoldTS)),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Palette.whiteColor,
        
        onTap: (currentIndex) =>
            setState(() => this.currentIndex = currentIndex),
        currentIndex: this.currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Accueil",),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: "Recherche"),
          BottomNavigationBarItem(icon: Icon(Icons.sell_outlined), label: "Vendre"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: "Compte"),
        ],
        unselectedItemColor: Palette.homeHeaderColor,
        selectedItemColor: Colors.blue,
        elevation: 0.0,
      ),
      body: _screens[currentIndex],
    );
  }
}
