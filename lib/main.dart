import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'package:escala_iasd/bemvindo/bemvindo_widget.dart';
import 'package:escala_iasd/home_page/home_page_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = ThemeMode.system;
  Stream<EscalaIasdFirebaseUser> userStream;
  EscalaIasdFirebaseUser initialUser;
  bool displaySplashImage = true;

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  void initState() {
    super.initState();
    userStream = escalaIasdFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'escala-iasd',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('pt', ''),
      ],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: SpinKitDoubleBounce(
                  color: Color(0xFFFCA311),
                  size: 50,
                ),
              ),
            )
          : currentUser.loggedIn
              ? HomePageWidget()
              : BemvindoWidget(),
    );
  }
}
