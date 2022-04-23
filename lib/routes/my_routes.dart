import 'package:flutter/material.dart';
import 'package:study/Pages/Login/BoshPage/cover_screen.dart';
import 'package:study/Pages/Login/BoshPage/splash2.dart';
import 'package:study/Pages/Login/Sign_IN/sign_in_page.dart';
import 'package:study/Pages/Login/Sign_UP/sign_up_page.dart';
import 'package:study/Pages/home/home_page.dart';

class MyRoutes {
  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (context) => HomePage());
      case "/boshpage":
        return MaterialPageRoute(builder: (context) => FirstSplashScreen());
      case '/splash2':
        return MaterialPageRoute(builder: (context) => SecondSplashScreen());
      case '/sign_In':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case '/sign_Up':
        return MaterialPageRoute(builder: (context) => SignUpPage());
    }
  }
}
