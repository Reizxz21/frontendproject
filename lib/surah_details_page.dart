import 'package:flutter/material.dart';

class SurahDetailsPage extends StatefulWidget {
  final String surahName;
  final String surahText;
  final int surahIndex;

  SurahDetailsPage({
    required this.surahName,
    required this.surahText,
    required this.surahIndex,
  });

  @override
  _SurahDetailsPageState createState() => _SurahDetailsPageState();
}

class _SurahDetailsPageState extends State<SurahDetailsPage> {
  bool isBookmarked = false;
  bool isFavorited = false;

  List<Map<String, String>> surahList = [
    {'name': 'Al-Fatihah', 'text': 'Bismillahir Rahmanir Rahim\n[All] praise is [due] to Allah, Lord of the worlds -'},
    {'name': 'Al-Baqarah', 'text': 'Alif Lam Meem\nThis is the Book about which there is no doubt, a guidance for those conscious of Allah -'},
    {'name': 'Al-Imran', 'text': 'Alif Lam Meem\nAllah - there is no deity except Him, the Ever-Living, the Sustainer of existence.'},
  ];

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isBookmarked
            ? 'Surah ditambahkan ke Bookmark'
            : 'Surah dihapus dari Bookmark'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isFavorited
            ? 'Surah ditambahkan ke Favorit'
            : 'Surah dihapus dari Favorit'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void navigateToSurah(int index) {
    if (index >= 0 && index < surahList.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SurahDetailsPage(
            surahName: surahList[index]['name']!,
            surahText: surahList[index]['text']!,
            surahIndex: index,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.surahName,
          style: TextStyle(color: Colors.white), // Menambahkan style untuk warna putih pada judul
        ),
        backgroundColor: Colors.purple,
        actions: [
          // Tombol Bookmark
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.white,
            ),
            onPressed: toggleBookmark,
          ),
          // Tombol Favorit
          IconButton(
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: toggleFavorite,
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Teks Alquran
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  widget.surahText,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
