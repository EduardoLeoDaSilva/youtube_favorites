import 'package:flutter/material.dart';
import 'package:youtube_favorites/clients/youtube-api.dart';
import 'package:youtube_favorites/models/video_snippet.dart';

class SearchWidget extends SearchDelegate {
  YoutubeApi api = YoutubeApi();

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(onPressed: () {}, icon: Icon(Icons.close))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    if (query != null || query.isEmpty) {
      return FutureBuilder<List<VideoSnippet>>(
        future: api.suggestions(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Future.delayed(Duration(seconds: 0))
                .then((value) => close(context, snapshot.data));
            return Container();
          } else {
            return Container();
          }
        },
      );
    } else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if (query != null || query.isEmpty) {
      return FutureBuilder<List<VideoSnippet>>(
        future: api.suggestions(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    close(context, snapshot.data);
                  },
                  leading: Icon(Icons.ads_click),
                  title: Text(snapshot.data![index].title),
                );
              },
            );
          } else {
            return Container();
          }
        },
      );
    } else {
      return Container();
    }
  }
}
