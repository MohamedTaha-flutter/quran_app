import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RunPlayAudioView extends StatefulWidget {
  final String audioPath;
  final String artist;
  final String title;
  final String image;

  const RunPlayAudioView({
    super.key,
    required this.audioPath,
    required this.artist,
    required this.title, required this.image,
  });

  @override
  State<RunPlayAudioView> createState() => _RunPlayAudioViewState();
}

class _RunPlayAudioViewState extends State<RunPlayAudioView> {
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
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  // Replace with your asset path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            Text(
              widget.artist,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Slider(
                    value: 30,
                    min: 0,
                    max: 100,
                    onChanged: (value) {},
                    activeColor: Colors.orange,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("1:23", style: TextStyle(color: Colors.grey)),
                      Text("-2:45", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  iconSize: 36,
                  onPressed: () {},
                ),
                IconButton(
                  icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                  iconSize: 48,
                  color: Colors.deepOrange,
                  onPressed: ()
                  {
                    setState(() {
                      _togglePlayPause() ;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  iconSize: 36,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.shuffle),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
