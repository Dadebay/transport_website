import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:transport_website/app/modules/home/components/custom_nav_bar.dart';
import 'package:transport_website/constants/customWidget/constants.dart';
import 'package:transport_website/constants/customWidget/custom_button.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({super.key});

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  VideoPlayerController? _videoController;
  int _currentVideoIndex = 0;
  bool _isVideoInitialized = false;
  final List<String> _videoUrls = [
    'assets/videos/video-1.mp4',
    'assets/videos/video-2.mp4',
    'assets/videos/video-3.mp4',
    'assets/videos/2.mp4',
    'assets/videos/3.mp4',
    'assets/videos/4.mp4',
  ];
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo(_videoUrls[_currentVideoIndex]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_videoController != null && !_videoController!.value.isPlaying) {
      _videoController!.play();
      debugPrint('Video otomatik oynatılmaya başladı (didChangeDependencies)');
    }
  }

  Future<void> _initializeVideo(String videoPath) async {
    setState(() {
      _isAnimating = true;
    });
    if (_videoController != null) {
      if (_videoController!.value.isInitialized) {
        await _videoController!.pause();
      }
      _videoController!.removeListener(_checkVideoEnd);
      await _videoController!.dispose();
    }

    _videoController = VideoPlayerController.asset(videoPath);

    try {
      await _videoController!.initialize();
      setState(() {
        _isVideoInitialized = true;
        _videoController!.play();
        _isAnimating = false;
        debugPrint('Video oynatılmaya başladı (_initializeVideo)');
      });
      _videoController!.addListener(_checkVideoEnd);
    } catch (e) {
      setState(() {
        _isVideoInitialized = false;
        _isAnimating = false;
      });
      debugPrint('Video yüklenirken hata oluştu: $e');
    }
  }

  void _checkVideoEnd() {
    if (_videoController != null && _videoController!.value.isInitialized && _videoController!.value.position >= _videoController!.value.duration) {
      _nextVideo();
    }
  }

  void _nextVideo() {
    setState(() {
      _currentVideoIndex = (_currentVideoIndex + 1) % _videoUrls.length;
    });
    _initializeVideo(_videoUrls[_currentVideoIndex]);
  }

  void _goToVideo(int index) {
    setState(() {
      _currentVideoIndex = index;
    });
    _initializeVideo(_videoUrls[_currentVideoIndex]);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedSwitcher(
              switchInCurve: Curves.easeInOut,
              duration: const Duration(milliseconds: 500),
              child: _isVideoInitialized && _videoController != null
                  ? SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _videoController!.value.size.width,
                          height: _videoController!.value.size.height,
                          child: VideoPlayer(_videoController!),
                        ),
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          _textPart(),
          dots(screenWidth),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: CustomNavbar(isAppBarPinned: false),
          ),
        ],
      ),
    );
  }

  Center _textPart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInUp(
            key: ValueKey('title_$_currentVideoIndex'),
            duration: const Duration(milliseconds: 500),
            child: Text(
              '*  TRANSPORT AND LOGISTICS COMPANY  *',
              style: TextStyle(color: AppColors.whiteMainColor, fontSize: AppFontSizes.getFontSize(1.5)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppFontSizes.getFontSize(1.5)),
            child: FadeInUp(
              key: ValueKey('subtitle_$_currentVideoIndex'),
              duration: const Duration(milliseconds: 700),
              child: Text(
                'transport and logistics solutions\nfor your business'.toUpperCase(),
                style: TextStyle(color: AppColors.whiteMainColor, fontSize: AppFontSizes.getFontSize(2.5), fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          FadeInUp(
            key: ValueKey('buttons_$_currentVideoIndex'),
            duration: const Duration(milliseconds: 900),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(color: AppColors.darkMainColor, text: 'Track Order'),
                const SizedBox(width: 50),
                CustomButton(color: AppColors.brandYellow, text: 'Our Service'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Positioned dots(double screenWidth) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _videoUrls.length,
          (index) => GestureDetector(
            onTap: () => _goToVideo(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: _currentVideoIndex == index ? 40 : 10,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_currentVideoIndex == index ? 5 : 10),
                color: _currentVideoIndex == index ? AppColors.brandYellow : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }
}
