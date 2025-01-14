import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/bloc/state.dart';

import '../../bloc/toprated_cubit.dart';
import '../screen/detalis.dart';

class TopRated extends StatelessWidget {
  TopRated({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedCubit, MovieState>(
      builder: (context, state) {
        if (state is TopRatedLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TopRatedSuccessState) {
          final movies = state.movieResponse.results;
          return SizedBox(
            height: 161,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detalis(movie: movie),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 7.0),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w780${movie.posterPath}',
                      width: 103,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is PopularErrorState) {
          return Center(
            child: Text(
              state.errorMessage,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
