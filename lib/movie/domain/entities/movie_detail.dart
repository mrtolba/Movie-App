import 'package:equatable/equatable.dart';
import 'package:movies_app/movie/domain/entities/genres.dart';

class MovieDetail extends Equatable{
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final String overview;
  final String releaseDate;
  final int runTime;
  final String title;
  final double voteAverage;

  const MovieDetail({
      required this.backdropPath,
      required this.id,
      required this.overview,
      required this.releaseDate,
      required this.runTime,
      required this.title,
      required this.voteAverage,
    required this.genres
});

  @override

  List<Object?> get props => [backdropPath,id,overview,releaseDate,runTime,title,voteAverage,genres];
}