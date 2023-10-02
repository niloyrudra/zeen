import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:zeen/config/text_style.dart';
import 'package:zeen/view/splash/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent
    ),
  );

  // Firebase Initializer
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
        (_) => runApp(
      const MyApp(),
    ),
  );

  // runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static setCustomTheme( BuildContext context, int index ) async {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();

    state!.setCustomTheme(index);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  setCustomTheme( int index ) {
    if( index == 6 ) {
      setState(() {
        AppTheme.isLightTheme == true;
      });
    } else if ( index == 7 ) {
      AppTheme.isLightTheme = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: AppTheme.getTheme().primaryColor,
          systemNavigationBarDividerColor: AppTheme.getTheme().disabledColor,
          systemNavigationBarIconBrightness: Brightness.dark,
        )
    );
    return GetMaterialApp(
      title: "Zeen",
      theme: AppTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}