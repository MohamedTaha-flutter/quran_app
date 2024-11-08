import 'package:flutter/material.dart';
import 'package:quran_app/core/styles/text_style.dart';

class AudioTileWidget extends StatefulWidget {
  final String title;
  final String artist;

  const AudioTileWidget({
    super.key,
    required this.title,
    required this.artist,
  });

  @override
  State<AudioTileWidget> createState() => _AudioTileWidgetState();
}

class _AudioTileWidgetState extends State<AudioTileWidget> {
   bool isFavorite = true;
   bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isPlaying
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
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
                  style: AppTextStyle.font16WhiteBold
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
                      Icons.favorite_border,
                      color: isFavorite ? Colors.white : Colors.red,
                    )),
                SizedBox(width: 16),
                IconButton(
                    onPressed: ()
                    {
                    setState(() {
                      isPlaying = !isPlaying ;
                    });
                    },
                    icon: Icon(
                    isPlaying ? Icons.play_arrow : Icons.pause,
                      color: Colors.white,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
