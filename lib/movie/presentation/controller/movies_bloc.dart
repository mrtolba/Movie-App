import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movie/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movie/domain/usecases/get_top_movies_usecase.dart';
import 'package:movies_app/movie/presentation/controller/movies_event.dart';
import 'package:movies_app/movie/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState>{

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopMoviesUseCase getTopMoviesUseCase;


  MoviesBloc(this.getNowPlayingMoviesUseCase,
      this.getPopularMoviesUseCase,
      this.getTopMoviesUseCase
      ): super(const MoviesState()){
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
     //  BaseMovieRemoteDataSource baseMovieRemoteDataSource = MovieRemoteDataSource();
     //  BaseMoviesRepository baseMoviesRepository = MoviesRepository(baseMovieRemoteDataSource);
     // final result = await GetNowPlayingMoviesUseCase(baseMoviesRepository).execute();
    // emit(const MoviesState(nowPlayingState: RequestState.loaded));
     result.fold((l) =>
         emit(state.copyWith(
           nowPlayingState: RequestState.error,
           nowPlayingMessage: l.message,

         )),
           (r) =>  emit(state.copyWith(
         nowPlayingMovies:r ,
         nowPlayingState: RequestState.loaded ,
     ),
     ),
     );
    });


    on<GetPopularMoviesEvent>((event, emit)  async{
      final result = await getPopularMoviesUseCase.execute();

      result.fold((l) =>
          emit(state.copyWith(
            popularState: RequestState.error,
            popularMessage: l.message,
          )), (r) =>  emit(state.copyWith(
        popularMovies:r ,
        popularState: RequestState.loaded ,
      ),
      ),
      );
    });


    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }





  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
      final result = await getTopMoviesUseCase(const NoParameters());
      result.fold((l) =>
          emit(state.copyWith(
            topState: RequestState.error,
            topMessage: l.message,
          )), (r) =>  emit(state.copyWith(
        topMovies:r ,
        topState: RequestState.loaded,),
      ),
      );

  }
}