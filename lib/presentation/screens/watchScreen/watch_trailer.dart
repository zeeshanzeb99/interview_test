import 'package:adv_test/helper/resources/string_resources.dart';
import 'package:adv_test/helper/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../helper/resources/dimension_resources.dart';

class WatchTrailer extends StatefulWidget {
  const WatchTrailer({super.key});

  @override
  _WatchTrailerState createState() => _WatchTrailerState();
}

class _WatchTrailerState extends State<WatchTrailer> {
  late VideoPlayerController _controller;
  bool _isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(StringResources.STR_VIDEO_URL),
    );

    // Initialize the video player
    _controller.initialize().then((_) {
      setState(() {
        _isLoading = false;
      });
      _controller.play();
    });

    // Listener for when the video completes
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          if (!_isLoading)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width ,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(color: AppColors.SEA_GREEN),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: AppColors.SEA_GREEN,
        child:  Text(
          StringResources.STR_DONE,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.WHITE,
            fontWeight: FontWeight.w600,
            fontSize: Dim.D_14,
          ),
        ),
      ),
    );
  }
}
