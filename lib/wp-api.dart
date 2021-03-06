import 'package:http/http.dart' as http;
import 'dart:convert';

Future fetchWpPosts() async {
  var url =
      "https://inspiresean.com/index.php/wp-json/wp/v2/posts?per_page=100&page=1";
  final response = await http.get(url, headers: {"Accept": "application/json"});

  var convertedDataToJson = jsonDecode(response.body);
  return convertedDataToJson;
}

Future fetchWpPostImgUrl(imgsrc) async {
  final response =
      await http.get(imgsrc, headers: {"Accept": "application/json"});

  var convertedDataToJson = jsonDecode(response.body);
  return convertedDataToJson;
}
