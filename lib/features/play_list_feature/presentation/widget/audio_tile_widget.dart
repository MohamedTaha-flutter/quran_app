import 'package:flutter/material.dart';
import 'package:quran_app/core/constant/constant.dart';
import 'package:quran_app/core/styles/text_style.dart';
import 'package:quran_app/features/play_list_feature/presentation/view/run_play_audio_view.dart';

class AudioTileWidget extends StatefulWidget {
  final String title;
  final String artist;
  final String audioPath;
  final String image;

  const AudioTileWidget({
    super.key,
    required this.title,
    required this.artist,
    required this.audioPath, required this.image,
  });

  @override
  State<AudioTileWidget> createState() => _AudioTileWidgetState();
}

class _AudioTileWidgetState extends State<AudioTileWidget> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goTo(
            context,
            (context) => RunPlayAudioView(
                  audioPath: widget.audioPath,
                  artist: widget.artist,
                  title: widget.title, image: widget.image,
                ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1) ,
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
                const SizedBox(width: 16),
                Icon(Icons.arrow_forward_ios,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
