import 'package:flutter/material.dart';
import 'package:movies_app/screens/forget_PW/forget_pw_view.dart';
import 'package:movies_app/screens/home/home_view.dart';
import 'package:movies_app/screens/login/login_screen.dart';
import 'package:movies_app/screens/main/main_screen.dart';
import 'package:movies_app/screens/profile/profile_view.dart';
import 'package:movies_app/screens/search/search_view.dart';
import 'package:movies_app/screens/signup/signup_screen.dart';
import 'package:movies_app/screens/splash/splash_view.dart';
import 'package:movies_app/screens/wishlist/wishlist_view.dart';

class AppRoutes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String singupRoute = '/singup';
  static const String homeRoute = '/home';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String profileRoute = '/profile';
  static const String searchRoute = '/search';
  static const String wishlistRoute = '/wishlist';
  static const String mainRoute = '/main';
}

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashRoute:
      return MaterialPageRoute(builder: (context) => SplashView());
    case AppRoutes.loginRoute:
      return MaterialPageRoute(builder: (context) => LoginView());
    case AppRoutes.homeRoute:
      return MaterialPageRoute(builder: (_) => HomeView());
    case AppRoutes.singupRoute:
      return MaterialPageRoute(builder: (context) => SignupView());
    case AppRoutes.forgetPasswordRoute:
      return MaterialPageRoute(builder: (context) => ForgetPwView());
    case AppRoutes.profileRoute:
      return MaterialPageRoute(builder: (_) => ProfileView());
    case AppRoutes.searchRoute:
      return MaterialPageRoute(builder: (_) => SearchView());
    case AppRoutes.wishlistRoute:
      return MaterialPageRoute(builder: (_) => WishlistView());
    case AppRoutes.mainRoute:
      return MaterialPageRoute(builder: (_) => MainScreen());
    default:
      return _undefineRoute();
  }
}

Route _undefineRoute() {
  return MaterialPageRoute(
    builder:
        (_) => MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: Text('404')),
            body: Center(child: Text('404')),
          ),
        ),
  );
}
