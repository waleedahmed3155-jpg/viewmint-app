import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(ViewMintApp());

class ViewMintApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int coins = 1250;
  int selectedIndex = 0;

  final List<String> videos = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return VideoCard(url: videos[index], onCoin: () {
                setState(() => coins += 10);
              });
            },
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ViewMint', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(20)),
                    child: Row(children: [
                      Icon(Icons.monetization_on, color: Colors.black, size: 18),
                      SizedBox(width: 4),
                      Text('$coins', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: (i) => setState(() => selectedIndex = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Balance'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class VideoCard extends StatefulWidget {
  final String url;
  final VoidCallback onCoin;
  VideoCard({required this.url, required this.onCoin});
  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }
  @override
  void dispose() { _controller.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _controller.value.isInitialized
            ? FittedBox(fit: BoxFit.cover, child: SizedBox(width: _controller.value.size.width, height: _controller.value.size.height, child: VideoPlayer(_controller)))
            : Center(child: CircularProgressIndicator(color: Colors.white)),
        Positioned(
          right: 12, bottom: 100,
          child: Column(children: [
            IconButton(icon: Icon(Icons.favorite, color: Colors.red, size: 32), onPressed: widget.onCoin),
            Text('+10', style: TextStyle(color: Colors.white)),
            SizedBox(height: 16),
            Icon(Icons.comment, color: Colors.white, size: 32),
            SizedBox(height: 16),
            Icon(Icons.share, color: Colors.white, size: 32),
          ]),
        ),
        Positioned(
          left: 12, bottom: 20,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('@viewmint_user', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            Text('Video dekho, Coins jeeto', style: TextStyle(color: Colors.white)),
          ]),
        ),
      ],
    );
  }
}
