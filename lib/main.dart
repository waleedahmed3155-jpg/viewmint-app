import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(ViewMintApp());

class ViewMintApp extends StatefulWidget {
  @override
  _ViewMintAppState createState() => _ViewMintAppState();
}

class _ViewMintAppState extends State<ViewMintApp> {
  int coins = 1250;
  int selectedIndex = 0;

  List<Map<String, dynamic>> videos = [
    {'url': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4', 'user': 'Your friend', 'caption': 'EGO 💀🔥', 'hashtag': '#CapCut foryou❤️❤️', 'likes': '28', 'comments': '21', 'saves': '2', 'shares': '30'},
    {'url': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4', 'user': 'ViewMint Official', 'caption': 'Video dekho Coins jeeto', 'hashtag': '#ViewMint #Earn', 'likes': '156', 'comments': '42', 'saves': '12', 'shares': '18'},
    {'url': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4', 'user': 'Dubai Vlogs', 'caption': 'Dubai Night View', 'hashtag': '#Dubai #ForYou', 'likes': '89', 'comments': '15', 'saves': '5', 'shares': '22'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (ctx) => Scaffold(
          backgroundColor: selectedIndex == 4 ? Colors.white : Colors.black,
          extendBody: true,
          endDrawer: profileMenu(),
          body: selectedIndex == 0 ? tiktokHome() : selectedIndex == 1 ? friendsPage() : selectedIndex == 3 ? inboxPage() : selectedIndex == 4 ? profilePage(ctx) : friendsPage(),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: (i) { if (i == 2) return; setState(() => selectedIndex = i); },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Friends'),
              BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)), child: Icon(Icons.add, color: Colors.black)), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Inbox'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget tiktokHome() {
    return Stack(children: [
      PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          var v = videos[index];
          return VideoTile(url: v['url'], user: v['user'], caption: v['caption'], hashtag: v['hashtag'], likes: v['likes'], comments: v['comments'], saves: v['saves'], shares: v['shares'], onLike: () {
            setState(() => coins += 10);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('10 Coins! Total: $coins'), duration: Duration(seconds: 1)));
          });
        },
      ),
      Positioned(top: 35, left: 0, right: 0, child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Community', style: TextStyle(color: Colors.white70, fontSize: 16)), SizedBox(width: 12),
        Text('Nearby', style: TextStyle(color: Colors.white70, fontSize: 16)), SizedBox(width: 12),
        Text('Following', style: TextStyle(color: Colors.white70, fontSize: 16)), SizedBox(width: 12),
        Column(children: [Text('For You', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)), Container(height: 3, width: 30, color: Colors.white)]),
        SizedBox(width: 12), Icon(Icons.search, color: Colors.white, size: 26),
      ])),
      Positioned(top: 35, right: 12, child: Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(20)), child: Text('🪙 $coins', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
    ]);
  }

  Widget friendsPage() => Center(child: Text('Friends', style: TextStyle(color: Colors.white, fontSize: 24)));
  Widget inboxPage() => Center(child: Text('Inbox', style: TextStyle(color: Colors.white, fontSize: 24)));

  Widget profilePage(BuildContext ctx) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(padding: EdgeInsets.only(top: 35, left: 12, right: 12), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Icon(Icons.edit, size: 26),
          Row(children: [
            Stack(children: [CircleAvatar(radius: 16, backgroundImage: NetworkImage('https://picsum.photos/100')), Positioned(right: 0, bottom: 0, child: CircleAvatar(radius: 8, backgroundColor: Colors.red, child: Text('52', style: TextStyle(fontSize: 7, color: Colors.white))))]),
            SizedBox(width: 12), Icon(Icons.person_add, size: 28),
            SizedBox(width: 12),
            IconButton(icon: Icon(Icons.menu, size: 28), onPressed: () => Scaffold.of(ctx).openEndDrawer()),
          ]),
        ])),
        Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [Text('King of uk', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)), SizedBox(width: 6), Container(padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(12)), child: Text('9+', style: TextStyle(color: Colors.white, fontSize: 12)))]),
            Text('@king.of.uk15', style: TextStyle(color: Colors.grey, fontSize: 15)),
            SizedBox(height: 12),
            Row(children: [_stat('197', 'Following'), SizedBox(width: 20), _stat('104', 'Followers'), SizedBox(width: 20), _stat('91', 'Likes')]),
          ])),
          Stack(children: [
            CircleAvatar(radius: 45, backgroundImage: NetworkImage('https://picsum.photos/200')),
            Positioned(bottom: 0, right: 0, child: CircleAvatar(radius: 14, backgroundColor: Colors.blue, child: Icon(Icons.add, color: Colors.white, size: 18))),
          ]),
        ])),
        SizedBox(height: 12),
        Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(20)), child: Row(children: [Text('+ Add bio', style: TextStyle(fontWeight: FontWeight.bold)), Text('  ·  ', style: TextStyle(color: Colors.grey)), Icon(Icons.favorite, color: Colors.red, size: 16), Text(' My hobbies are...', style: TextStyle(color: Colors.grey))]))),
        SizedBox(height: 10),
        Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Row(children: [Icon(Icons.star, color: Colors.blue, size: 18), SizedBox(width: 6), Expanded(child: Text('Create Story Highlights for your profile', style: TextStyle(fontWeight: FontWeight.bold))), Icon(Icons.close)])),
        SizedBox(height: 12),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [Icon(Icons.grid_view, size: 28), Icon(Icons.lock_outline, size: 28), Icon(Icons.repeat, size: 28), Icon(Icons.bookmark_border, size: 28), Icon(Icons.favorite_border, size: 28)]),
        SizedBox(height: 8),
        GridView.count(
          shrinkWrap: true, physics: NeverScrollableScrollPhysics(), crossAxisCount: 3, crossAxisSpacing: 1, mainAxisSpacing: 1,
          children: [
            _videoThumb('https://picsum.photos/300/400?1', 'Drafts: 1'),
            _videoThumb('https://picsum.photos/300/400?2', '121'),
            _videoThumb('https://picsum.photos/300/400?3', '190'),
            _videoThumb('https://picsum.photos/300/400?4', '698'),
            _videoThumb('https://picsum.photos/300/400?5', '247'),
            _videoThumb('https://picsum.photos/300/400?6', '153'),
          ],
        ),
        SizedBox(height: 80),
      ]),
    );
  }

  Widget _stat(String num, String label) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(num, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text(label, style: TextStyle(color: Colors.grey, fontSize: 13))]);

  Widget _videoThumb(String img, String views) => Stack(children: [
    Image.network(img, fit: BoxFit.cover, width: double.infinity, height: double.infinity),
    Positioned(bottom: 4, left: 4, child: Row(children: [Icon(Icons.play_arrow, color: Colors.white, size: 16), Text(views, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))])),
  ]);

  Widget profileMenu() {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(padding: EdgeInsets.only(top: 50, left: 16, right: 16), children: [
        Text('Assets', style: TextStyle(color: Colors.grey, fontSize: 16)),
        SizedBox(height: 10),
        _menuItem(Icons.account_balance_wallet_outlined, 'Balance', '🪙 $coins Coins'),
        Divider(),
        Text('Personal tools', style: TextStyle(color: Colors.grey, fontSize: 16)),
        _menuItem(Icons.history, 'Activity center', ''),
        _menuItem(Icons.cloud_download_outlined, 'Offline videos', ''),
        _menuItem(Icons.qr_code, 'Your QR code', ''),
        Divider(),
        Text('Creation & business tools', style: TextStyle(color: Colors.grey, fontSize: 16)),
        _menuItem(Icons.person_outline, 'ViewMint Studio', ''),
        Divider(),
        _menuItem(Icons.settings, 'Settings and privacy', ''),
      ]),
    );
  }

  Widget _menuItem(IconData icon, String title, String trailing) => ListTile(
    leading: Icon(icon, size: 28), title: Text(title, style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
    trailing: Row(mainAxisSize: MainAxisSize.min, children: [if (trailing.isNotEmpty) Text(trailing, style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)), Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey)]),
    onTap: () {},
  );
}

class VideoTile extends StatefulWidget {
  final String url, user, caption, hashtag, likes, comments, saves, shares;
  final VoidCallback onLike;
  VideoTile({required this.url, required this.user, required this.caption, required this.hashtag, required this.likes, required this.comments, required this.saves, required this.shares, required this.onLike});
  @override
  _VideoTileState createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  late VideoPlayerController _c;
  bool liked = false;
  @override
  void initState() { super.initState(); _c = VideoPlayerController.networkUrl(Uri.parse(widget.url))..initialize().then((_) { setState(() {}); _c.play(); _c.setLooping(true); }); }
  @override
  void dispose() { _c.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(child: _c.value.isInitialized ? SizedBox.expand(child: FittedBox(fit: BoxFit.cover, child: SizedBox(width: _c.value.size.width, height: _c.value.size.height, child: VideoPlayer(_c)))) : CircularProgressIndicator(color: Colors.white)),
      Positioned(right: 12, bottom: 110, child: Column(children: [
        Stack(children: [CircleAvatar(radius: 24, backgroundImage: NetworkImage('https://picsum.photos/100')), Positioned(bottom: 0, right: 0, child: CircleAvatar(radius: 10, backgroundColor: Colors.red, child: Icon(Icons.add, size: 14, color: Colors.white)))]),
        SizedBox(height: 18),
        IconButton(icon: Icon(Icons.favorite, color: liked ? Colors.red : Colors.white, size: 34), onPressed: () { if (!liked) { setState(() => liked = true); widget.onLike(); } }),
        Text(widget.likes, style: TextStyle(color: Colors.white)),
        SizedBox(height: 12), Icon(Icons.chat_bubble, color: Colors.white, size: 32), Text(widget.comments, style: TextStyle(color: Colors.white)),
        SizedBox(height: 12), Icon(Icons.bookmark, color: Colors.white, size: 32), Text(widget.saves, style: TextStyle(color: Colors.white)),
        SizedBox(height: 12), Icon(Icons.share, color: Colors.white, size: 32), Text(widget.shares, style: TextStyle(color: Colors.white)),
        SizedBox(height: 12), CircleAvatar(radius: 22, backgroundImage: NetworkImage('https://picsum.photos/101')),
      ])),
      Positioned(left: 12, bottom: 15, right: 90, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)), child: Text(widget.user, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
        SizedBox(height: 6), Text(widget.caption, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        Text(widget.hashtag, style: TextStyle(color: Colors.white, fontSize: 15)),
      ])),
    ]);
  }
}
