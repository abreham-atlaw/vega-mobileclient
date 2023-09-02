


import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:vega/apps/core/application/utils/audio_handler.dart';
import 'package:vega/configs/data_configs.dart';
import 'package:vega/lib/network/network_client.dart';

class CoreProviders{

  static VegaAudioHandler? _audioHandler;
  static AudioSession? session;

  static NetworkClient provideNetworkClient(){
    return NetworkClient(apiHost, baseUrl: apiBaseUrl);
  }

  static Future<VegaAudioHandler> provideAudioHandler() async{
    _audioHandler ??= await AudioService.init(
        builder: () => VegaAudioHandler(),
        config: const AudioServiceConfig(
          androidNotificationChannelName: "Vega Music",
          androidNotificationChannelId: "com.vega.vega.channel.audio"
        )
    );

    return _audioHandler!;
  }

  static Future<AudioSession> provideAudioSession() async{
    if(session == null){
      session = await AudioSession.instance;
      await session!.configure(AudioSessionConfiguration.music());
    }
    return session!;
  }

}