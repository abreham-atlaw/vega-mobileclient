


import 'package:vega/common/async_bloc/async_events.dart';

class GenerateBaseEvent extends AsyncEvent{

}

class BackEvent extends GenerateBaseEvent{

}

class SkipEvent extends GenerateBaseEvent{

}

class AutoCompleteEvent extends GenerateBaseEvent{

}

class SelectGenreEvent extends GenerateBaseEvent{

  final String? genre;
  SelectGenreEvent(this.genre);

}

class SelectEraEvent extends GenerateBaseEvent{
  final String era;
  SelectEraEvent(this.era);
}

class SelectMoodEvent extends GenerateBaseEvent{
  final String mood;
  SelectMoodEvent(this.mood);
}

class SelectInstrumentsEvent extends GenerateBaseEvent{

  final List<String> instruments;
  SelectInstrumentsEvent(this.instruments);

}

class SelectLyricsTypeEvent extends GenerateBaseEvent{

  final List<String> lyricsTypes;
  SelectLyricsTypeEvent(this.lyricsTypes);
}

class GenerateEvent extends GenerateBaseEvent{

}


class PlayEvent extends GenerateBaseEvent{

  final String songId;
  PlayEvent(this.songId);
  
}