import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movie/domain/entities/movie_detail.dart';
import 'package:movies_app/movie/domain/entities/recommendation.dart';
import 'package:movies_app/movie/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movie/domain/usecases/get_recommendation_usecase.dart';
part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase,this.getRecommendationUseCase) :
        super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }
  final GetMovieDetailsUseCase getMovieDetailsUseCase ;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async{
      final result = await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id,
      ));
      result.fold((l) =>
          emit(state.copyWith(movieDetailState: RequestState.error,
                               movieDetailMessage: l.message,
          )), (r) =>
          emit(state.copyWith(
            movieDetail: r,
            movieDetailState: RequestState.loaded,

      ),
          ),
      );
  }

  FutureOr<void> _getMovieRecommendation(
      GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async {

    final result = await getRecommendationUseCase(
        RecommendationParameter(
          event.id,),
    );
    result.fold((l) =>
        emit(state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessage: l.message,
        )), (r) =>
        emit(state.copyWith(
          recommendation: r,
          recommendationState: RequestState.loaded,

        ),
        ),
    );

  }
}
