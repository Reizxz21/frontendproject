// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'surah_details_page.dart'; // Pastikan file ini diimport

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> surahList = [
    {'name': 'Al-Fatihah', 'type': 'Meccan - 7 Ayat', 'text': 'Bismillahir Rahmanir Rahim\n[All] praise is [due] to Allah, Lord of the worlds -'},
    {'name': 'Al-Baqarah', 'type': 'Medinan - 286 Ayat', 'text': 'Alif Lam Meem\nThis is the Book about which there is no doubt, a guidance for those conscious of Allah -'},
    {'name': 'Al-Imran', 'type': 'Medinan - 200 Ayat', 'text': 'Alif Lam Meem\nAllah - there is no deity except Him, the Ever-Living, the Sustainer of existence.'},
    {'name': 'An-Nisa', 'type': 'Medinan - 176 Ayat', 'text': 'O mankind, fear your Lord, who created you from one soul and created from it its mate...'},
  ];

  List<Map<String, String>> filteredSurahList = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    filteredSurahList = surahList;
  }

  void searchSurah(String query) {
    final results = surahList
        .where((surah) =>
            surah['name']!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredSurahList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Quran', style: TextStyle(color: Colors.white)
        ),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearchDialog(context);
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: filteredSurahList.length,
              itemBuilder: (context, index) {
                final surah = filteredSurahList[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        surah['name']!,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        surah['type']!,
                        style: TextStyle(color: Colors.white70),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SurahDetailsPage(
                              surahName: surah['name']!,
                              surahText: surah['text']!,
                              surahIndex: index,
                            ),
                          ),
                        );
                      },
                    ),
                    Divider(color: Colors.white24),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/bookmarks');
              break;
            case 1:
              Navigator.pushNamed(context, '/favorites');
              break;
            case 2:
              Navigator.pushNamed(context, '/progress');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
        ],
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
      ),
    );
  }

  void showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFF1A1A2E),
          title: Text(
            'Cari Surah',
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: searchController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Ketik nama surah...',
              hintStyle: TextStyle(color: Colors.white54),
              border: OutlineInputBorder(),
            ),
            onChanged: (query) {
              searchSurah(query);
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup', style: TextStyle(color: Colors.purple)),
            ),
          ],
        );
      },
    );
  }
}
