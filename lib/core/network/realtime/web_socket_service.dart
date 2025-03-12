import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

@singleton
class WebSocketService {
  WebSocketChannel? _channel;
  bool _isConnected = false;

  Future<void> connect(String url) async {
    if (!_isConnected) {
      try {
        _channel = WebSocketChannel.connect(Uri.parse(url));
        _isConnected = true;
      } catch (e) {
        print('WebSocket connection error: $e');
        _isConnected = false;
      }
    }
  }

  void disconnect() {
    _channel?.sink.close(status.goingAway);
    _isConnected = false;
  }

  Stream get stream => _channel!.stream;

  void send(dynamic data) {
    if (_isConnected) {
      _channel?.sink.add(data);
    }
  }

  bool get isConnected => _isConnected;
}
