// Our series model
import 'package:http/http.dart' as http;
import 'dart:convert';

class Series {
  final int id, numOfRatings, criticsReview, metascoreRating;
  final double rating;
  final List<String> genre;
  final String plot, title, poster, backdrop, year;
  final List<Map> cast;
  final String seasons;

  Series( {
    required this.seasons,
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
  {
    "id": 10759,
    "name": "Action & Adventure"
  },
  {
    "id": 16,
    "name": "Animation"
  },
  {
    "id": 35,
    "name": "Comedy"
  },
  {
    "id": 80,
    "name": "Crime"
  },
  {
    "id": 99,
    "name": "Documentary"
  },
  {
    "id": 18,
    "name": "Drama"
  },
  {
    "id": 10751,
    "name": "Family"
  },
  {
    "id": 10762,
    "name": "Kids"
  },
  {
    "id": 9648,
    "name": "Mystery"
  },
  {
    "id": 10763,
    "name": "News"
  },
  {
    "id": 10764,
    "name": "Reality"
  },
  {
    "id": 10765,
    "name": "Sci-Fi & Fantasy"
  },
  {
    "id": 10766,
    "name": "Soap"
  },
  {
    "id": 10767,
    "name": "Talk"
  },
  {
    "id": 10768,
    "name": "War & Politics"
  },
  {
    "id": 37,
    "name": "Western"
  }
];

String getGenreName(int genreId) {
  final genre = genresList.firstWhere(
        (element) => element['id'] == genreId,
    orElse: () => Map<String, dynamic>(),
  );
  return genre.isNotEmpty ? genre['name'] : 'Unknown';
}

final apiKey = '5f80bc0b10a444db9c045e07de26b900';
final mainUrl = 'https://api.themoviedb.org/3';

Future<Iterable<Null>> fetchSeries(String url) async {
  final response = await http.get(Uri.parse('$url?api_key=$apiKey'));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final List<dynamic> results = jsonResponse['results'];

    return Future.wait(results.map((seriesData) async {
      final List<dynamic> genreData = seriesData['genre_ids'];
      final List<String> genres = genreData.map((genreId) => getGenreName(genreId).toString()).toList();

      final castResponse = await http.get(Uri.parse('$mainUrl/tv/${seriesData['id']}/aggregate_credits?api_key=$apiKey'));
      final castJsonResponse = json.decode(castResponse.body);
      final List<dynamic> castData = castJsonResponse['cast'];

      series.add(Series(
        seasons: seriesData['number_of_seasons'].toString(),
        poster: 'https://image.tmdb.org/t/p/w500${seriesData['poster_path']}',
        backdrop: 'https://image.tmdb.org/t/p/w500${seriesData['backdrop_path']}',
        title: seriesData['name'],
        id: seriesData['id'],
        year: seriesData['first_air_date'] != null ? seriesData['first_air_date'].substring(0, 4) : '',
        numOfRatings: seriesData['vote_count'],
        criticsReview: seriesData['vote_average'].toInt(),
        metascoreRating: seriesData['popularity'].toInt(),
        rating: seriesData['vote_average'].toDouble(),
        genre: genres,
        plot: seriesData['overview'],
        cast: castData.map((castMember) => {
          'orginalName': castMember['name'],
          'movieName': castMember['roles'][0]['character'],
          'image': 'https://image.tmdb.org/t/p/w500${castMember['profile_path']}',
        }).toList(), // Populate cast data as needed
      ));
    }));
  } else {
    throw Exception('Failed to fetch series');
  }
}
// our demo data movie data
List<Series> series = [];
//   Series(
//     id: 1,
//     seasons: '10',
//     title: "Friends",
//     year: 'September 22, 1994 – May 6, 2004',
//     poster: "assets/images/series_3.jpg",
//     backdrop: "assets/images/backdrop_1.jpg",
//     numOfRatings: 10000,
//     rating: 7.9,
//     criticsReview: 24,
//     metascoreRating: 76,
//     genre: ["Drama", "Romance"],
//     plot: plotText,
//     cast: [
//       {
//         "orginalName": "Matthew Perry",
//         "movieName": "Chandler Bing",
//         "image": "assets/images/chan.jpg",
//       },
//       {
//         "orginalName": "Courtney Cox",
//         "movieName": "Monica Geller",
//         "image": "assets/images/cox.jpg",
//       },
//       {
//         "orginalName": "Matt LeBlanc",
//         "movieName": "Joey Tribbiani",
//         "image": "assets/images/matt.jpg",
//       },
//       {
//         "orginalName": "Jennifer Aniston",
//         "movieName": "Rachel Green",
//         "image": "assets/images/jen.jpg",
//       },
//       {
//         "orginalName": "Lisa Kudrow",
//         "movieName": "Phoebe Buffay",
//         "image": "assets/images/lisa.jpg",
//       },
//       {
//         "orginalName": "David Schwimmer",
//         "movieName": "Ross Geller",
//         "image": "assets/images/ross.jpg",
//       },
//     ],
//   ),
//   Series(
//     id: 2,
//     seasons: '2',
//     title: "Alice In BorderLand",
//     year: 'December 10, 2020 – December 22, 2022',
//     poster: "assets/images/series_2.jpg",
//     backdrop: "assets/images/backdrop_2.jpg",
//     numOfRatings: 8400,
//     rating: 8.8,
//     criticsReview: 2,
//     metascoreRating: 76,
//     genre: ["Crime", "Musical", "Drama"],
//     plot: plotText,
//     cast: [
//       {
//         "orginalName": "Chanchal Chowdhury",
//         "movieName": "Shonai",
//         "image": "assets/images/actor_5.jpg",
//       },
//       {
//         "orginalName": "Farhana Mili",
//         "movieName": "Pori",
//         "image": "assets/images/actor_6.jpg",
//       },
//       {
//         "orginalName": "Fazlur Rahman Babu",
//         "movieName": "Pori's Father",
//         "image": "assets/images/actor_7.jpg",
//       },
//       {
//         "orginalName": "Mamunur Rashid",
//         "movieName": "Gazi",
//         "image": "assets/images/actor_8.jpg",
//       },
//     ],
//   ),
//   Series(
//     id: 3,
//     seasons: '2',
//     title: "Asur",
//     year: '1997',
//     poster: "assets/images/series_1.jpg",
//     backdrop: "assets/images/backdrop_3.jpg",
//     numOfRatings: 713794,
//     rating: 8.6,
//     criticsReview: 138,
//     metascoreRating: 59,
//     genre: ["Comedy", "Drama", "Romance"],
//     plot: plotText,
//     cast: [
//       {
//         "orginalName": "Roberto Benigni ",
//         "movieName": "Guido Orefice",
//         "image": "assets/images/actor_1.jpg",
//       },
//       {
//         "orginalName": "Nicoletta Braschi ",
//         "movieName": "Dora Orefice",
//         "image": "assets/images/actor_2.jpg",
//       },
//       {
//         "orginalName": "Giorgio Cantarini",
//         "movieName": " Giosuè Orefice",
//         "image": "assets/images/actor_3.jpg",
//       },
//       {
//         "orginalName": "Giustino Durano ",
//         "movieName": "Uncle Eliseo",
//         "image": "assets/images/actor_4.jpg",
//       },
//     ],
//   ),

//
// String plotText =
//     "American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.";