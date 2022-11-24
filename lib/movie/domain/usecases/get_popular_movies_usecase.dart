import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movie/domain/entities/movie.dart';
import 'package:movies_app/movie/domain/repository/base_movies_repository.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository ;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure ,List<Movie>>>  execute() async{
    return await baseMoviesRepository.getPopularMovies();
  }

}