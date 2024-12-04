import 'package:flutter/material.dart';
import 'package:mvvm/res/app_colors.dart';
import 'package:mvvm/view_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashService splashScreen = SplashService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.AppColorBlue,
      body: Center(
        child: Text('Splash Screen',style: TextStyle(color: AppColors.btnColorWhite,fontSize: 18),),
      ),
    );
  }
}
