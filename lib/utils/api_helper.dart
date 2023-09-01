import 'dart:convert';
import 'package:bhagvad_gita_copy/modal/gita_modal.dart';
import 'package:bhagvad_gita_copy/modal/slok_modal.dart';
import 'package:http/http.dart' as http;

class Apihelper {
  static Apihelper api = Apihelper._();

  Apihelper._();

  Future<List<Gitamodal>> gita_Adhay_Api() async {
    String link = "https://bhagavad-gita3.p.rapidapi.com/v2/chapters/?limit=18";
    var response = await http.get(Uri.parse("$link"), headers: {
      "X-RapidAPI-Key": "d0d5a9eab1mshb3fe875b20d73b4p1a9ad3jsn89ea54996bbb",
      "X-RapidAPI-Host": "bhagavad-gita3.p.rapidapi.com"
    });
    List json = jsonDecode(utf8.decode(response.bodyBytes));
    List<Gitamodal> gita = json.map((e) => Gitamodal.fromJson(e)).toList();
    return gita;
  }

  Future<List<Slokmodal>> gita_Slok_Api(String id) async {
    String link = "https://bhagavad-gita3.p.rapidapi.com/v2/chapters/$id/verses/";
    var response = await http.get(Uri.parse("$link"), headers: {
      "X-RapidAPI-Key": "d0d5a9eab1mshb3fe875b20d73b4p1a9ad3jsn89ea54996bbb",
      "X-RapidAPI-Host": "bhagavad-gita3.p.rapidapi.com",
    });
    List json = jsonDecode(utf8.decode(response.bodyBytes));
    List<Slokmodal> slok = json.map((e) => Slokmodal.fromJson(e)).toList();
    return slok;
  }
}
