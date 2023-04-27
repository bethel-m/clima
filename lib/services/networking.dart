import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Uri url;
  NetworkHelper({required this.url});
  getData() async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        String body = (response.body);
        var data = jsonDecode(body);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
