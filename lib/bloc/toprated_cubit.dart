import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:netflix/bloc/state.dart';
import '../data/movie-class.dart';

class TopRatedCubit extends Cubit<MovieState> {
  final Dio dio;

  TopRatedCubit(this.dio) : super(InitialState());

  // Function to fetch top-rated movies
  Future<void> getTopRatedMovies() async {
    emit(TopRatedLoadingState());
    try {
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/top_rated?api_key=56050d0adf74a600390e0ffd875a78e8"
      );

      if (response.statusCode == 200) {
        final topRatedRes = MovieResponse.fromJson(response.data);
        emit(TopRatedSuccessState(topRatedRes));
      } else {
        emit(TopRatedErrorState("Failed to load data: ${response.statusCode}"));
      }
    } catch (e) {
      emit(TopRatedErrorState(e.toString()));
    }
  }
}
