import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/bloc/state.dart';
import 'package:netflix/data/movie-class.dart';
import '../../bloc/nowplaying_cubit.dart';
import '../screen/detalis.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, MovieState>(
      builder: (context, state) {
        if (state is NowPlayingLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NowPlayingSuccessState) {
          final movies = state.movieResponse.results;


          final movie = movies[0]; // عرض أول فيلم فقط
          return Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detalis(movie: movie),
                    ),
                  );
                },
                child: Image.network(
                  'https://image.tmdb.org/t/p/w780${movie.posterPath}',
                  width: double.infinity,
                  height: 370,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.broken_image, size: 100, color: Colors.grey),
                    );
                  },
                ),
              ),
              Positioned(
                top: 328,
                left: 83,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red,
                  ),
                ),
              ),
              const Positioned(
                top: 324,
                left: 104,
                child: Text(
                  "Now playing",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        } else if (state is NowPlayingErrorState) {
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
