import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/res/app_colors.dart';
import 'package:mvvm/view_model/meal_view_model.dart';
import 'package:provider/provider.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  MealViewViewModel mealViewViewModel = MealViewViewModel();
  @override
  void initState() {
    mealViewViewModel.fetchMealListAPI();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // final mealViewModel = Provider.of<MealViewViewModel>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.AppColorBlue,
          title: const Text(
            'Movies List',
            style: TextStyle(color: AppColors.btnColorWhite, fontSize: 16),
          ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.btnColorWhite),
      ),

      body: ChangeNotifierProvider<MealViewViewModel>(
        create: (BuildContext context) => mealViewViewModel,
        child: Consumer<MealViewViewModel>(builder: (context, value, child) {
          switch (value.moviesList.status) {
            case Status.LOADING:
              return const Center(child: Text('loading....'));
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: value.moviesList.data!.meals!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: 250,
                      child: Card(
                        color: AppColors.AppColorBlue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(
                                fit: BoxFit.cover,
                                width: 200,
                                height: 200,
                                value.moviesList.data!.meals![index].strMealThumb.toString()),
                          const SizedBox(height: 20,),
                          Container(
                              width: 200,
                              alignment: Alignment.center,
                              child: Text(value.moviesList.data!.meals![index].strMeal.toString(),textAlign: TextAlign.center,style: TextStyle(color: AppColors.btnColorWhite),)),
                            Text(value.moviesList.data!.meals![index].idMeal.toString()),
                          
                          ],
                        ),
                        
                      ),
                    );
                  });
            case Status.ERROR:
              return Center(child: Text('Error ${value.moviesList.message}'));
            default:
              return const Text('Error');
          }
        }),
      ),


    );
  }
}
