import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final List<Map<String, String>> favoriteItems = [
    {'name': 'Al-Fatihah', 'type': 'Meccan - 7 Verses'},
    {'name': 'Al-Baqarah', 'type': 'Medinan - 286 Verses'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: favoriteItems.isEmpty
          ? Center(
              child: Text(
                'No Favorites Added Yet!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        item['name']!,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        item['type']!,
                        style: TextStyle(color: Colors.white70),
                      ),
                      trailing: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onTap: () {
                        // Tambahkan aksi jika diperlukan
                      },
                    ),
                    Divider(color: Colors.white24),
                  ],
                );
              },
            ),
    );
  }
}
