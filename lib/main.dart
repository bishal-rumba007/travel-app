import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/main/app.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]
  );

  runApp(const MyApp());
}



