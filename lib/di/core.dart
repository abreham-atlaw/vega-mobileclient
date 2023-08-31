


import 'package:vega/configs/data_configs.dart';
import 'package:vega/lib/network/network_client.dart';

class CoreProviders{
  
  static NetworkClient provideNetworkClient(){
    return NetworkClient(apiHost);
  }
  
}