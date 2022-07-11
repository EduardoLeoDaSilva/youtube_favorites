class VideoSnippet {
  late String channelId;
  late String id;
  late String title;
  late String description;
  late String thumbnail;

  VideoSnippet.fromJson(Map<String, dynamic> map) {
    channelId = map['snippet']['channelId'] ?? "";
    id = map['id']['videoId'] ?? "";
    title = map['snippet']['title'] ?? "";
    description = map['snippet']['description'] ?? "";
    thumbnail = map['snippet']['thumbnails']['high']['url'] ?? "";
  }

  Map<String, dynamic> toJson() {
    return {
      'channelId': channelId,
      'id': id,
      'title': title,
      'description': description,
      'thumbnail': thumbnail
    };
  }
}
