class QuranModel {
  final int id;

  final String audioPath;

  final String audioName;
  final String man;

  QuranModel({
    required this.id,
    this.audioPath = "",
    required this.audioName,
    required this.man,
  });
}

List<QuranModel> quranList = [
  QuranModel(
    id: 0,
    audioPath: "assets/quran/1.mp3",
    audioName: "Al-Fatihah",
    man: "AbdulBaset AbdulSamad [Warsh]",
  ),
  QuranModel(
    id: 1,
    audioPath: "assets/quran/113.mp3",
    audioName: "Al-Falaq",
    man: "AbdulBaset AbdulSamad [Warsh]",
  ),
];
