import 'package:get/get.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService extends GetxService {
  late IO.Socket socket;

  void connect() {
    try {
      socket = IO.io('http://10.0.2.2:5000', <String, dynamic>{
        "transports": ["websocket"],
        "autoConnect": false,
        "query": "Authorization=${LocalStorageService.getRefreshToken()}"
      });
      print('Authorization=${LocalStorageService.getRefreshToken()}');
      print('Authorization=${socket.connected}');

      socket.connect();

      // socket.onConnect((data) {
      //   print('Connected to Socket.io server');
      //   // socket.on('newMessage', (data) {
      //   //   print('Received message: $data');
      //   // });
      // });
    } catch (e) {
      print('Error connecting to Socket.io server: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    connect();
  }

  @override
  void onClose() {
    socket.disconnect();
    super.onClose();
  }
}
