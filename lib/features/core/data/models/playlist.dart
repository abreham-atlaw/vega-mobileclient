import 'package:vega/features/core/data/models/song.dart';

class Playlist{

  String id;
  String title;
  String cover;
  List<Song> songs;

  Playlist({
    required this.id,
    required this.title,
    required this.cover,
    required this.songs
  });

}