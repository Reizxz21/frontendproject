import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'home_page.dart';
import 'surah_details_page.dart';
import 'bookmarks_page.dart';
import 'favorite_page.dart';
import 'progress_page.dart';

void main() {
  runApp(QuranApp());
}

class QuranApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Color(0xFF1A1A2E),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        // Handle routes with arguments
        if (settings.name == '/surah-details') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => SurahDetailsPage(
              surahName: args['surahName'],
              surahText: args['surahText'],
              surahIndex: args['surahIndex'],
            ),
          );
        }
        return null; // Default case if no match
      },
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/bookmarks': (context) => BookmarksPage(),
        '/favorites': (context) => FavoritePage(),
        '/progress': (context) => ProgressPage(),
      },
    );
  }
}
