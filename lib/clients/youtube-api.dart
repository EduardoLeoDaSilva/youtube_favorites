import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube_favorites/models/video_snippet.dart';

const API_KEY = "AIzaSyBOuBw6R_n4XBQgul2LreuwhPcVOGT17MM";
const baseUrl = "https://www.googleapis.com/youtube/v3";

class YoutubeApi {
  Future<List<VideoSnippet>> search({String? search, String? token}) async {
    String uriString = '$baseUrl/search?part=snippet';
    if (search != null && search.isNotEmpty && token == null) {
      uriString += '&q=$search';
    }

    if (token != null && token.isNotEmpty) {
      uriString += '&q=$search';
    }

    uriString += '&key=$API_KEY';
    var uri = Uri.parse(uriString);

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonMap = json.decode(response.body) as Map<String, dynamic>;
      var mapped = (jsonMap['items'] as List)
          .map((e) => VideoSnippet.fromJson(e))
          .toList();
      return mapped;
    }
    return [];
  }

  Future<List<VideoSnippet>> suggestions(String search) async {
    String uriString = '$baseUrl/search?part=snippet';
    if (search != null && search.isNotEmpty) {
      uriString += '&q=$search';
    } else {
      return [];
    }

    uriString += '&key=$API_KEY';
    var uri = Uri.parse(uriString);

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonMap = json.decode(response.body) as Map<String, dynamic>;
      var mapped = (jsonMap['items'] as List)
          .map((e) => VideoSnippet.fromJson(e))
          .toList();
      return mapped;
    }
    return [];
  }
}
