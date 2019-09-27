import 'package:http/http.dart' as http;

class RestService {

  static Future getPictures() {
    String url = "https://api.nasa.gov/planetary/apod?api_key=IinX6zbjodFMrB5qlYKXIldbXiddc0YXMWIJUL2q&start_date=2019-09-01&end_date=2019-09-27";
    return http.get(url);
  }

}