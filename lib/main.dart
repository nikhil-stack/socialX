import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:socialx/services/auth_services.dart';
import 'package:socialx/screens/home_page.dart';
import 'package:socialx/screens/Tabs_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        unselectedWidgetColor: Colors.red,
      ),
      home: StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return TabsPage(index: 0);
          }
        },
      ),
    );
  }
}
