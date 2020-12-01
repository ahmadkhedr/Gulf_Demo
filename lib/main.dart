import 'package:flutter/material.dart';
import 'package:gulf_demo/Screens/MainScreen.dart';
import 'package:gulf_demo/Screens/MyApp.dart';
import 'package:gulf_demo/States/HomeState.dart';
import 'package:gulf_demo/Style/AppTheme.dart';
import 'package:gulf_demo/Style/SizeConfig.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MultiProvider(

              providers: [
                ChangeNotifierProvider<HomeState>(create: (_) => HomeState()),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                builder: (context, child) {
                  return MediaQuery(
                    child: child,
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  );
                },
                title: "Gulf Demo",
                theme: AppTheme.lightTheme,
                home: Myapp(),
              ),
            );
          },
        );
      },
    );
  }
}