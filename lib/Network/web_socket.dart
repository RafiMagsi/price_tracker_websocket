import 'package:web_socket_channel/web_socket_channel.dart';

// Singleton class to manage socket data
class AppSocket {
  static String socketServerUrl = 'wss://ws.binaryws.com/websockets/v3?app_id=1089';
  WebSocketChannel? _channel;

  AppSocket._privateConstructor();

  static final AppSocket _instance = AppSocket._privateConstructor();

  static AppSocket get instance => _instance;

  // Always returns the shared socket channel
  WebSocketChannel? get channel {
    _channel ??= WebSocketChannel.connect(Uri.parse(socketServerUrl));

    return _channel;
  }
}
