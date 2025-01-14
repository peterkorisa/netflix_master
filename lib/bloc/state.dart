import 'package:netflix/data/movie-class.dart';

class MovieState {}

// Now Playing States
class InitialState extends MovieState {}

class NowPlayingLoadingState extends MovieState {}

class NowPlayingSuccessState extends MovieState {
  final MovieResponse movieResponse;
  NowPlayingSuccessState(this.movieResponse);
}

class NowPlayingErrorState extends MovieState {
  final String errorMessage;

  NowPlayingErrorState(this.errorMessage);
}
class PopularLoadingState extends MovieState {}
class PopularSuccessState extends MovieState {
  final MovieResponse movieResponse;

  PopularSuccessState(this.movieResponse);
}

class PopularErrorState extends MovieState {
  final String errorMessage;

  PopularErrorState(this.errorMessage);
}

class TopRatedLoadingState extends MovieState {}

class TopRatedSuccessState extends MovieState {
  final MovieResponse movieResponse;
  TopRatedSuccessState(this.movieResponse);
}

class TopRatedErrorState extends MovieState {
  final String errorMessage;

  TopRatedErrorState(this.errorMessage);
}
