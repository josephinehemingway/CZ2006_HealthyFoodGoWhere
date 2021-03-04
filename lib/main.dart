import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/theme.dart';
import 'screens/Login/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MaterialApp(
      title: 'HealthyGoWhere App',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      // home: BottomNavBar(),
      routes: routes,
      initialRoute: LoginPage.routeName,
    ));

// Future main() async {
//       WidgetsFlutterBinding.ensureInitialized();
//       await Firebase.initializeApp();
//
//       runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//       static final String title = 'HealthyGoWhere App';
//
//       @override
//       Widget build(BuildContext context) => MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: title,
//             theme: theme(),
//             routes: routes,
//             // initialRoute: LoginPage.routeName,
//             home: LoginPage(),
//       );
// }
