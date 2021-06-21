import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_taka_app/src/providers/panel_tabs_selection.dart';
import 'package:tiki_taka_app/src/view/screens/root.dart';
import './utils/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TabsSelectionProvider()),
      ],
      child: MaterialApp(
        title: "TIKI TAKA",
        debugShowCheckedModeBanner: false,
        home: RootScreen(),
        theme: MyTheme().getTheme,
      ),
    );
  }
}
