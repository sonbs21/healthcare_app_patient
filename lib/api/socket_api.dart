import 'package:socket_io_client/socket_io_client.dart' as IO;

// IO.Socket socketIO = IO.io('http://localhost:5000', IO.OptionBuilder()
//       .setTransports(['websocket']) // Sử dụng websocket để kết nối
//       .setQuery({'Authorization': 'YOUR_AUTHORIZATION_TOKEN'}) // Truyền Authorization Token
//       .build());

// // ignore: use_function_type_syntax_for_parameters
// socketIO.onConnect((_) {
//   print('connect');
//   socketIO.emit('msg', 'test');
// })

// socketIO.on('newMessage', (data) => print('Data received: $data'));

// socketIO.onDisconnect((_) => print('disconnect'));

// socketIO.on('fromServer', (_) => print(_));

// main() {
//   // Dart client
//   IO.Socket socket = IO.io('http://10.0.2.2:5000', {
//     IO.OptionBuilder().setTransports(['websocket']).build(),
//     IO.OptionBuilder().setQuery('Authorization=${LocalStorageService.getRefreshToken()}' as Map)
//   });
//   socket.onConnect((_) {
//     print('connect');
//     socket.emit('msg', 'test');
//   });
//   socket.on('newMessage', (data) => print('0909${data}'));
//   socket.onDisconnect((_) => print('disconnect'));
//   socket.on('fromServer', (_) => print(_));
// }