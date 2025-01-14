import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:netflix/bloc/state.dart';
import '../data/movie-class.dart';

class PopularCubit extends Cubit<MovieState> {
  final Dio dio;

  PopularCubit(this.dio) : super(InitialState());

  // Function to fetch popular movies
  Future<void> getPopularMovies() async {
    emit(PopularLoadingState());
    try {
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/popular?api_key=56050d0adf74a600390e0ffd875a78e8"
      );

      if (response.statusCode == 200) {
        final popularRes = MovieResponse.fromJson(response.data);
        emit(PopularSuccessState(popularRes));
      } else {
        emit(PopularErrorState("Failed to load data: ${response.statusCode}"));
      }
    } catch (e) {
      emit(PopularErrorState(e.toString()));
    }
  }
}
