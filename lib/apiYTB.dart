import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/video.dart';

const CHAVE_YTB_API = "AIzaSyB2XLYJtOTaVhaL7xCE1Avi9SrabjT5S5c";
const ID_CANAL = "UCkgSRjlbfvuyQZbZ8pYqmAQ";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>?> pesquisar(String pesquisa) async {
    http.Response response = await http.get(
      Uri.parse(URL_BASE +
          "search"
              "?part=snippet"
              "&type=video"
              "&maxResults=20"
              "&order=date"
              "&key=$CHAVE_YTB_API"
              "&channelId=$ID_CANAL"
              "&q=$pesquisa"),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {}
  }
}
