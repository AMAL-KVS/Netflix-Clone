import 'package:netflix/Infrastructure/api_key.dart';
import 'package:netflix/core/strings.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUral/trending/all/day?api_key=$apikey";
  static const search = " $kBaseUral/search/movie?api_key=$apikey";
}
