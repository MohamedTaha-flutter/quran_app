import 'package:flutter/material.dart';
import 'package:quran_app/features/play_list_feature/presentation/view/play_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: " Quran",
      home: PlaylistView(),
    );
  }
}
