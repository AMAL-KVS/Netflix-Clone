import 'package:netflix/Infrastructure/api_key.dart';
import 'package:netflix/core/strings.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUral/trending/all/day?api_key=$apikey";
  static const search = " $kBaseUral/search/movie?api_key=$apikey";
  static const search2 =
      "$kBaseUral/search/movie?api_key=$apikey&language=en-US&query=spiderman&page=1&include_adult=false";
  static const hotAndNewMovie =
      '$kBaseUral/discover/movie?api_key=$apikey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate';
  static const hotAndNewTv =
      '$kBaseUral/discover/tv?api_key=$apikey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate';

  static const hotAndNewMovie2 =
      "https://api.themoviedb.org/3/discover/movie?api_key=c5e68ec57bf3344f306737330e71ac8e&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate#";
}
