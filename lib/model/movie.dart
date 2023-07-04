import 'package:http/http.dart' as http;
import 'dart:convert';

class Movie {
  final int id, numOfRatings, criticsReview, metascoreRating;
  final double rating;
  final List<String> genre;
  final String year, plot, title, poster, backdrop;
  final List<Map<String, dynamic>> cast;
  final List<Map<String, dynamic>> similar;
  final String runtime;

  Movie({
    required this.similar,
    required this.runtime,
    required this.poster,
    required this.backdrop,
    required this.title,
    required this.id,
    required this.year,
    required this.numOfRatings,
    required this.criticsReview,
    required this.metascoreRating,
    required this.rating,
    required this.genre,
    required this.plot,
    required this.cast,
  });
}

List<Map<String, dynamic>> genresList = [
  {"id": 28, "name": "Action"},
  {"id": 12, "name": "Adventure"},
  {"id": 16, "name": "Animation"},
  {"id": 35, "name": "Comedy"},
  {"id": 80, "name": "Crime"},
  {"id": 99, "name": "Documentary"},
  {"id": 18, "name": "Drama"},
  {"id": 10751, "name": "Family"},
  {"id": 14, "name": "Fantasy"},
  {"id": 36, "name": "History"},
  {"id": 27, "name": "Horror"},
  {"id": 10402, "name": "Music"},
  {"id": 9648, "name": "Mystery"},
  {"id": 10749, "name": "Romance"},
  {"id": 878, "name": "Science Fiction"},
  {"id": 10770, "name": "TV Movie"},
  {"id": 53, "name": "Thriller"},
  {"id": 10752, "name": "War"},
  {"id": 37, "name": "Western"}
];

String getGenreName(int genreId) {
  final genre = genresList.firstWhere(
        (element) => element['id'] == genreId,
    orElse: () => Map<String, dynamic>(),
  );
  return genre.isNotEmpty ? genre['name'] : 'Unknown';
}


List<Movie> movies = [];

final apiKey = '5f80bc0b10a444db9c045e07de26b900';
final mainUrl = 'https://api.themoviedb.org/3';

Future<Iterable<Null>> fetchMovies(String baseUrl) async {
  movies.clear();
  final response = await http.get(Uri.parse('$baseUrl?api_key=$apiKey'));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final List<dynamic> results = jsonResponse['results'];

    return Future.wait(results.map((movieData) async {
      final List<dynamic> genreData = movieData['genre_ids'];
      final List<String> genres = genreData.map((genreId) => getGenreName(genreId).toString()).toList();

      final castResponse = await http.get(Uri.parse('$mainUrl/movie/${movieData['id']}/credits?api_key=$apiKey'));
      final castJsonResponse = json.decode(castResponse.body);

      final similarRes = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/${movieData['id']}/similar?api_key=$apiKey'));
      final similarJsonResponse = json.decode(similarRes.body);

      final List<dynamic> castData = castJsonResponse['cast'];
      final List<dynamic> similarData = similarJsonResponse['results'];

      final movieRes = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/${movieData['id']}?api_key=$apiKey'));
      final movieResponse = json.decode(movieRes.body);

      movies.add(
        Movie(
          runtime: movieResponse['runtime'].toString(),
          poster: 'https://image.tmdb.org/t/p/w500${movieData['poster_path']}',
          backdrop: 'https://image.tmdb.org/t/p/w500${movieData['backdrop_path']}',
          title: movieData['title'],
          id: movieData['id'],
          year: movieResponse['release_date'],
          numOfRatings: movieData['vote_count'],
          criticsReview: movieData['vote_average'].toInt(),
          metascoreRating: movieData['popularity'].toInt(),
          rating: movieData['vote_average'].toDouble(),
          genre: genres,
          plot: movieData['overview'],
          cast: castData.map((castMember) => {
            'orginalName': castMember['name'],
            'movieName': castMember['character'],
            'image': 'https://image.tmdb.org/t/p/w500${castMember['profile_path']}',
          }).toList(),
          similar: similarData.map((sim) => {
            'title': sim['title'],
            'poster': 'https://image.tmdb.org/t/p/w500${sim['poster_path']}',
          }).toList(),
        ),
      );
      print(movies[movies.length-1].title);
      print(movies[movies.length-1].similar);
    }));
  } else {
    throw Exception('Failed to fetch movies');
  }
}

