import 'package:http/http.dart' as http;
import'dart:convert';

class NetworkHelper {
String url;
NetworkHelper({ required this.url});

Future getWeather () async {
  http.Response response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    String data = response.body;
    // print(data);
 return jsonDecode(data); // decodedData here !!!
  } else {
    print(response.statusCode);
  }
}
}