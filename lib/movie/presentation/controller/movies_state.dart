import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movie/domain/entities/movie.dart';

class MoviesState extends Equatable{

  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;


  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;

  final List<Movie> topMovies;
  final RequestState topState;
  final String topMessage;


  const MoviesState({
    this.nowPlayingMovies = const[],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage ='',

    this.popularMovies = const[],
    this.popularState = RequestState.loading,
    this.popularMessage ='',

    this.topMovies = const[],
    this.topState = RequestState.loading,
    this.topMessage ='',
  });


  MoviesState copyWith ({
     List<Movie>? nowPlayingMovies,
     RequestState? nowPlayingState,
     String? nowPlayingMessage,


     List<Movie>? popularMovies,
     RequestState? popularState,
     String? popularMessage,

     List<Movie>? topMovies,
     RequestState? topState,
     String? topMessage,
  })  {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies ,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState ,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,


      popularMovies: popularMovies ?? this.popularMovies,
      popularState:  popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,

      topMovies: topMovies ?? this.topMovies,
      topState: topState ?? this.topState,
      topMessage: topMessage ?? this.topMessage,
    );
  }

  @override
  List<Object?> get props => [
    nowPlayingMovies ,
    nowPlayingState ,
    nowPlayingMessage,
    popularMovies,
    popularState,
    popularMessage,
    topMovies,
    topState,
    topMessage,
  ];


}