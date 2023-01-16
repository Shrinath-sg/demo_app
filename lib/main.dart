import 'package:demo_project/provider/my_provider.dart';
import 'package:demo_project/screens/home_screen.dart';
import 'package:demo_project/screens/login.dart';
import 'package:demo_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => MyProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            headline4:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            bodyText1:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            bodyText2: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            subtitle1: TextStyle(fontWeight: FontWeight.bold),
            subtitle2: TextStyle(color: primaryColor, fontSize: 12),
          ),
        ),
        home: const LoginScreen(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          LoginScreen.routeName: (context) => LoginScreen()
        },
      ),
    );
  }
}
