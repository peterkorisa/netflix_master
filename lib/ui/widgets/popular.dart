import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/bloc/state.dart';

import '../../bloc/popluarnow_cubit.dart';
import '../screen/detalis.dart';

class Popular extends StatelessWidget {
  Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, MovieState>(
      builder: (context, state) {
        if (state is PopularLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PopularSuccessState) {
          final movies = state.movieResponse.results;
          return SizedBox(
            height: 150,
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
                      height: 161,
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
          return const SizedBox();
        }
      },
    );
  }
}
