import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiki_taka_app/src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}
