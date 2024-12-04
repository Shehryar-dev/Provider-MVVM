import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/404%20page/not_found.dart';
import 'package:mvvm/view/authentication/signup_screen.dart';
import 'package:mvvm/view/authentication/login_screen.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/meal/meals.dart';
import 'package:mvvm/view/movies%20fetch/movie_list.dart';
import 'package:mvvm/view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case RoutesName.moviesApi:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MoviesList());


      case RoutesName.mealApi:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MealsScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignupScreen());

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const PageNotFound();
        });
    }
  }
}
