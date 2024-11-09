import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/styles/text_style.dart';

class AudioTileWidget extends StatefulWidget {
  final String title;
  final String artist;
  final String audioPath;

  const AudioTileWidget({
    super.key,
    required this.title,
    required this.artist,
    required this.audioPath,
  });

  @override
  State<AudioTileWidget> createState() => _AudioTileWidgetState();
}

class _AudioTileWidgetState extends State<AudioTileWidget> {
  bool isFavorite = true;
  bool isPlaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future _togglePlayPause() async {
    try {
      if (isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.play(AssetSource(widget.audioPath));
      }
      setState(() {
        isPlaying = !isPlaying;
      });
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  () {
        setState(() {
          _togglePlayPause();
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isPlaying ? Colors.white.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppTextStyle.font16WhiteBold,
                ),
                Text(
                  widget.artist,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.white : Colors.red,
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _togglePlayPause();
                    });
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
