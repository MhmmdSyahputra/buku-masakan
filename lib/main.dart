import 'package:flutter/material.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/views/bottomNavigation.dart';
import 'package:foodies/views/login/screenLogin.dart';
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
        ChangeNotifierProvider(create: (context) => UserLoginProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // is not restarted.
          // primarySwatch:
          backgroundColor: ColorConstants.themeColor,
        ),
        home: ScreenLogin(),
      ),
    );
  }
}
