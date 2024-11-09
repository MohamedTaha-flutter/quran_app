class QuranModel {

  final String audioPath;

  final String audioName;
  final String man;

  QuranModel({
    required this.audioPath,
    required this.audioName,
    required this.man,
  });
}

List<QuranModel> quranList = [
  QuranModel(
    audioPath: "assets/quran/1.mp3",
    audioName: "Al-Fatihah",
    man: "AbdulBaset AbdulSamad [Warsh]",
  ),
  QuranModel(
    audioPath: "assets/quran/113.mp3",
    audioName: "Al-Falaq",
    man: "AbdulBaset AbdulSamad [Warsh]",
  ),
];
