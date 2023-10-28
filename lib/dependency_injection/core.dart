import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vega/features/core/application/utils/audio_handler.dart';
import 'package:vega/configs/data_configs.dart';
import 'package:vega/common/network/network_client.dart';

import 'auth.dart';

class CoreProviders{

  static VegaAudioHandler? _audioHandler;
  static AudioSession? session;
  static NetworkClient? _authenticatedNetworkClient;

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
      await session!.configure(const AudioSessionConfiguration.music());
    }
    return session!;
  }


  static Future<NetworkClient> provideAuthenticatedNetworkClient() async {
    CoreProviders._authenticatedNetworkClient ??= NetworkClient(apiHost,
        baseUrl: apiBaseUrl,
        clientVersion: await CoreProviders.provideClientVersion(),
        token: await AuthProviders.provideTokenStorage().getToken());
    return CoreProviders._authenticatedNetworkClient!;
  }

  static Future<String> provideClientVersion() async{
    return (await PackageInfo.fromPlatform()).version;
  }

  static reset() {
    CoreProviders._authenticatedNetworkClient = null;
  }

}