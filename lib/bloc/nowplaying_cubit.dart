import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:netflix/bloc/state.dart';
import '../data/movie-class.dart';

class NowPlayingCubit extends Cubit<MovieState> {
  final Dio dio;

  NowPlayingCubit(this.dio) : super(InitialState());

  // Function to fetch now playing movies
  Future<void> getNowPlayingMovies() async {
    emit(NowPlayingLoadingState());
    try {
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/now_playing?api_key=56050d0adf74a600390e0ffd875a78e8"
      );

      if (response.statusCode == 200) {
        final nowPlayingRes = MovieResponse.fromJson(response.data);
        emit(NowPlayingSuccessState(nowPlayingRes));
      } else {
        emit(NowPlayingErrorState("Failed to load data: ${response.statusCode}"));
      }
    } catch (e) {
      emit(NowPlayingErrorState(e.toString()));
    }
  }
}
