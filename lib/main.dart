import 'package:flutter/material.dart';

void main() {
  runApp(MyMusicApp());
}

class MyMusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SongListPage(),
    );
  }
}

class SongListPage extends StatelessWidget {
  final List<String> songs = ['Song 1', 'Song 2', 'Song 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Music App'),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                // Tambahkan fungsi jika diperlukan
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(songs[index]),
            leading: Icon(Icons.music_note),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SongDetailPage(songTitle: songs[index]),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Liked',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'News',
          ),
        ],
        onTap: (index) {
          // Tambahkan fungsi navigasi sesuai kebutuhan
          if (index == 0) {
            // Fungsi pencarian
          } else if (index == 1) {
            // Fungsi musik disukai
          } else if (index == 2) {
            // Fungsi berita musik
          }
        },
      ),
    );
  }
}

class SongDetailPage extends StatefulWidget {
  final String songTitle;

  SongDetailPage({required this.songTitle});

  @override
  _SongDetailPageState createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  bool isPlaying = false;

  void togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.songTitle),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                // Tambahkan fungsi jika diperlukan
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isPlaying ? Icons.pause_circle : Icons.play_circle,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              isPlaying ? 'Playing ${widget.songTitle}' : 'Paused',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: togglePlayPause,
              child: Text(isPlaying ? 'Pause' : 'Play'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Liked',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'News',
          ),
        ],
        onTap: (index) {
          // Tambahkan fungsi navigasi sesuai kebutuhan
          if (index == 0) {
            // Fungsi pencarian
          } else if (index == 1) {
            // Fungsi musik disukai
          } else if (index == 2) {
            // Fungsi berita musik
          }
        },
      ),
    );
  }
}
