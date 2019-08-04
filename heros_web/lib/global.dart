import 'dart:convert';
import 'package:http/http.dart' as http;

class Global {
  getData() {
    return http
        .get('http://www.mocky.io/v2/5d45bc573000006c63c5c8f4')
        .then((onValue) {
      return json.decode(onValue.body);
    });
  }
}
