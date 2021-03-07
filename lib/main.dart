import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/theme.dart';
import 'screens/Login/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() => runApp(MaterialApp(
//       title: 'HealthyGoWhere App',
//       theme: theme(),
//       debugShowCheckedModeBanner: false,
//       // home: BottomNavBar(),
//       routes: routes,
//       initialRoute: LoginPage.routeName,
//     ));

Future<void> main() async {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(MyApp());
}
class MyApp extends StatelessWidget {
      final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

      @override
      Widget build(BuildContext context) {
            return MaterialApp(
                title: 'HealthyGoWhere App',
                theme: theme(),
                debugShowCheckedModeBanner: false,
                routes: routes,
                initialRoute: LoginPage.routeName,
                home: FutureBuilder(
                    future: _fbApp,
                    builder: (context, snapshot) {
        if (snapshot.hasError) {
        print('You have an error! ${snapshot.error
            .toString()}');
        return Text('Something went wrong!');
        }
        else if (snapshot.hasData) {
        return LoginPage();
        } else{
        return Center(
        child: CircularProgressIndicator(),
        );
        }
        }
        ));
}
      }

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
