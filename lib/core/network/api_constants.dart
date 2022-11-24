class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "17f8c3d1ecdfc62a380b528bc545cf6e";
  static const String nowPlayingMoviesPath = "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String popularMoviesPath = "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topMoviesPath = "$baseUrl/movie/top_rated?api_key=$apiKey";

  static  String movieDetailsPath(int movieId) => "$baseUrl/movie/$movieId?api_key=$apiKey";

  static  String recommendationPath(int movieId) => "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";



  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
   static String imageUrl(String path) => '$baseImageUrl$path';


}