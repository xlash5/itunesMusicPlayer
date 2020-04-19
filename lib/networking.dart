import 'package:http/http.dart' as http;
import 'dart:convert';

const url = 'https://itunes.apple.com/search?term=';

class Networking {
  Future getQuery(String query) async {
    String queryURL = url + query + '&limit=5';
    var response = await http.get(queryURL);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
