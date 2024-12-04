import 'package:flutter/material.dart';
import 'package:mvvm/res/app_colors.dart';
import 'package:mvvm/res/components/rounded_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.AppColorBlue,
        title: const Text(
          'Home Screen',
          style: TextStyle(color: AppColors.btnColorWhite, fontSize: 16),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            userPreference.remove().then((value) {
              Utils.toastMessage('Logout Successfully');
              Navigator.pushNamed(context, RoutesName.login);
            });
          },
          child: const Icon(
            Icons.logout,
            color: AppColors.btnColorWhite,
          ),
        ),
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
                btnColor: AppColors.AppColorBlue,
                text: 'Movies List', onPress: (){
              Navigator.pushNamed(context, RoutesName.moviesApi);
            }),
            const SizedBox(height: 50,),
            RoundedButton(text: 'Meal List',
                btnColor: AppColors.AppColorBlue,
                onPress: (){
              Navigator.pushNamed(context, RoutesName.mealApi);
            })
          ],
        ),
      ),
    );
  }
}
