import 'package:flutter/material.dart';
import 'package:quran_app/core/styles/text_style.dart';
import 'package:quran_app/features/play_list_feature/presentation/widget/audio_tile_widget.dart';

class PlaylistView extends StatelessWidget {
  const PlaylistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quran',
                    style: AppTextStyle.font20WhiteBold,
                  ),
                ],
              ),
              AudioTileWidget(
                  title: 'Al-Fatihah',
                  artist: 'AbdulBaset AbdulSamad [Warsh]',
                  audioPath: 'quran/1.mp3',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
