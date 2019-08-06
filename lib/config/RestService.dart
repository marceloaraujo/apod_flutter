import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:apod/entity/Picture.dart';

class RestService {

  List<Picture> getPictures(DateTime initialDate, DateTime endDate) async{
    List<Picture> list;

    String url = "https://api.nasa.gov/planetary/apod?api_key=IinX6zbjodFMrB5qlYKXIldbXiddc0YXMWIJUL2q&start_date=2019-08-01&end_date=2019-08-06";

    http.Response response = await http.get(url);
    var jsonData = json.decode(response.body);
    var rest = jsonData as List;
    list = rest.map<Picture>((json) => Picture.fromJson(json)).toList();

  }

}