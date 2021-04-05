import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/control/routes.dart';
import 'package:flutter_app/theme.dart';
import 'boundary/screens/Login/LoginUI.dart';
import 'package:firebase_core/firebase_core.dart';

/// Main function to run the application.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

/// Implementation of application.
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'HealthyGoWhere App',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        routes: routes,
        initialRoute: LoginUI.routeName,
        home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('You have an error! ${snapshot.error.toString()}');
                return Text('Something went wrong!');
              } else if (snapshot.hasData) {
                return LoginUI();
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
