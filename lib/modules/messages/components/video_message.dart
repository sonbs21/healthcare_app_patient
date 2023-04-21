import 'dart:math';

import 'package:flutter/material.dart';
import 'package:healthcare_mobile/models/chats/chat_response.dart';
import 'package:healthcare_mobile/modules/messages/messages_controller.dart';
import 'package:healthcare_mobile/service/local_storage_service.dart';
import 'package:healthcare_mobile/utils/constant.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';

class VideoMessage extends StatefulWidget {
  VideoMessage({Key? key, required this.message}) : super(key: key) {}
  final DataMessageResponse message;

  @override
  State<VideoMessage> createState() => _VideoMessageState();
}

class _VideoMessageState extends State<VideoMessage> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    _initPlayer(widget.message);

    super.initState();
  }

  void _initPlayer(DataMessageResponse message) async {
    videoPlayerController =
        VideoPlayerController.network(message.file![0].url as String);
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );

    setState(() {});
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: chewieController != null
            ? Chewie(
                controller: chewieController!,
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
