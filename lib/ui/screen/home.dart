import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/bloc/nowplaying_cubit.dart';
import 'package:netflix/bloc/popluarnow_cubit.dart';
import 'package:netflix/bloc/toprated_cubit.dart';
import 'package:netflix/ui/widgets/now-playing.dart';
import '../widgets/popular.dart';
import '../widgets/top-rated.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[
      BlocProvider(create: (context) => NowPlayingCubit(Dio())..getNowPlayingMovies()),
      BlocProvider(create: (context) => PopularCubit(Dio())..getPopularMovies()),
      BlocProvider(create: (context) => TopRatedCubit(Dio())..getTopRatedMovies()),

    ], child:  Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          NowPlaying(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Popular on Netflix",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Popular(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Top Rated",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
         TopRated(),

        ],
      ),
    ));
  }
}
