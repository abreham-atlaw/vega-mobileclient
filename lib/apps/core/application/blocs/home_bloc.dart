


import 'package:vega/apps/core/application/states/home_state.dart';
import 'package:vega/apps/generation/data/models/generate_query.dart';
import 'package:vega/apps/generation/data/models/generate_query_sample.dart';
import 'package:vega/apps/core/data/models/song.dart';
import 'package:vega/apps/core/data/repositories/song_repository.dart';
import 'package:vega/lib/async_bloc/async_bloc.dart';

class HomeBloc extends AsyncBloc<HomeState>{

  final SongRepository _songRepository = SongRepository();

  HomeBloc(super.initialState);

  @override
  Future<void> onInit() async{
    await super.onInit();

    List<String> songIds = [
      "ddfc1672-0cca-4038-adfd-204a6c83de9a",
      "db899fc5-b2cc-42ae-bf1b-669e51f96c07",
      "ba8b3b41-17c6-494e-855c-0e5ddd4dd23a"
    ];
    state.recent = [];
    for(String id in songIds){
      state.recent!.add(await _songRepository.getSong(id));
    }
    state.populars = [
      GenerateQuerySample(
          genre: "Hip-Hop",
          era: "80s",
          mood: "happy",
          instruments: ["guitar"],
          lyricsType: ["reflective"],
          title: 'Melancholic',
          coverImage: "https://www.dropbox.com/scl/fi/1716txvcn70by2kh1mcze/Rectangle-2_4.png?rlkey=vkqvr9w8ma6wgivpr1fmetudg&dl=0&raw=1"
      ),
      GenerateQuerySample(
          genre: "Hip-Hop",
          era: "80s",
          mood: "happy",
          instruments: ["guitar"],
          lyricsType: ["reflective"],
          title: 'Late Night Drive',
          coverImage: "https://www.dropbox.com/scl/fi/4ayzer8z5u9tgfkfna02b/01.png?rlkey=2ywwc36w38t0noxnppavad0mx&dl=0&raw=1"
      )
    ];
    state.recommendations = [
      GenerateQuerySample(
        genre: "Hip-Hop",
        era: "80s",
        mood: "happy",
        instruments: ["guitar"],
        lyricsType: ["reflective"],
        title: 'Late Night Drive',
        coverImage: "https://www.dropbox.com/scl/fi/4ayzer8z5u9tgfkfna02b/01.png?rlkey=2ywwc36w38t0noxnppavad0mx&dl=0&raw=1"
      )
    ];
  }

}