import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/res/app_colors.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';


class MoviesList extends StatefulWidget {
  const MoviesList({super.key});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  HomeViewViewModel homeViewModel = HomeViewViewModel();
  @override
  void initState() {
    // TODO: implement initState
    homeViewModel.fetchMovieListAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewViewModel>(builder: (context, value, child) {
          switch (value.moviesList.status) {
            case Status.LOADING:
              return const Center(child: Text('loading....'));
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: value.moviesList.data!.movies!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.network(
                            value.moviesList.data!.movies![index].posterurl
                                .toString(),
                            errorBuilder: (context, value, stack) {
                              return Container(
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                              );
                            },
                          ),
                        ),
                        title: Text(value.moviesList.data!.movies![index].title
                            .toString()),
                        subtitle: Text(value
                            .moviesList.data!.movies![index].year
                            .toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(Utils.averageRating(value
                                    .moviesList.data!.movies![index].ratings!)
                                .toStringAsFixed(1)),
                           const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.star,
                              color: AppColors.AppColorGreen,
                            )
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
