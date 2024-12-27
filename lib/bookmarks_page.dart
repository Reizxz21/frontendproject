import 'package:flutter/material.dart';

class BookmarksPage extends StatelessWidget {
  final List<Map<String, String>> bookmarks = [
    {'ayat': '1:1', 'details': 'Al-Fatihah - Ayat 1'},
    {'ayat': '2:1', 'details': 'Al-Baqarah - Ayat 1'},
    {'ayat': '3:1', 'details': 'Al-Imran - Ayat 1'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmarks',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Color(0xFF1A1A2E), // Warna latar belakang utama
        child: ListView.separated(
          itemCount: bookmarks.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[800], // Warna pembatas antar item
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          itemBuilder: (context, index) {
            final bookmark = bookmarks[index];
            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Text(
                'Ayat ${bookmark['ayat']}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                bookmark['details']!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
