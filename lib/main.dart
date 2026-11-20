import 'package:flutter/material.dart';

void main() => runApp(ViewMintApp());

class ViewMintApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoginPage(), 
    ); 
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  final List<Widget> _pages = [
    HomePage(),
    FriendsPage(),
    CameraPage(),
    InboxPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (i) => setState(() => _index = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Friends'),
          BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)), child: Icon(Icons.add, color: Colors.black)), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// HOME - Video Feed
class HomePage extends StatelessWidget {
  final videos = [
    {'name': 'Dubai vibes', 'user': '@king.of.uk15', 'color': Colors.purple},
    {'name': 'Sunset', 'user': '@waleed', 'color': Colors.teal},
    {'name': 'Beach', 'user': '@dubai_boy', 'color': Colors.orange},
  ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (c, i) {
        return Container(
          color: videos[i]['color'] as Color,
          child: Stack(
            children: [
              Center(child: Text(videos[i]['name'] as String, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
              Positioned(bottom: 20, left: 12, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(videos[i]['user'] as String, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), SizedBox(height: 6), Text('#ViewMint #ForYou')])),
              Positioned(bottom: 20, right: 12, child: Column(children: [Icon(Icons.favorite, size: 32), Text('91'), SizedBox(height: 16), Icon(Icons.comment, size: 32), Text('12'), SizedBox(height: 16), Icon(Icons.share, size: 32)])),
            ],
          ),
        );
      },
    );
  }
}

// FRIENDS - Ab khali nahi, list aayegi
class FriendsPage extends StatelessWidget {
  final friends = ['Waleed Ahmed', 'Dubai Boy', 'King of UK', 'Sara Khan', 'Ali Raza'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Friends'), backgroundColor: Colors.black),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (c, i) => ListTile(
          leading: CircleAvatar(child: Text(friends[i][0])),
          title: Text(friends[i]),
          subtitle: Text('@user${i + 1} • Following you'),
          trailing: ElevatedButton(onPressed: () {}, child: Text('Follow Back'), style: ElevatedButton.styleFrom(backgroundColor: Colors.pink)),
        ),
      ),
    );
  }
}

// CAMERA - LIVE + PHOTO + CREATE
class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(child: Text('Camera - Apna Chehra Yahan Aayega', textAlign: TextAlign.center)),
          Positioned(top: 40, left: 16, child: Icon(Icons.close, size: 30)),
          Positioned(top: 40, right: 16, child: Column(children: [Icon(Icons.cameraswitch, size: 30), SizedBox(height: 20), Icon(Icons.flash_off, size: 30), SizedBox(height: 20), Icon(Icons.timer, size: 30)])),
          Positioned(bottom: 100, left: 0, right: 0, child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [Text('LIVE', style: TextStyle(fontSize: 16)), Text('CAMERA', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text('CREATE', style: TextStyle(fontSize: 16))])),
          Positioned(bottom: 20, left: 0, right: 0, child: Center(child: Container(width: 80, height: 80, decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: Colors.pink, width: 4))))),
        ],
      ),
    );
  }
}

// INBOX - Ab khali nahi
class InboxPage extends StatelessWidget {
  final chats = ['Waleed: Hi bro', 'Sara: Video mast hai', 'Ali: Live kab aaoge?', 'ViewMint: Welcome!'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inbox'), backgroundColor: Colors.black),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (c, i) => ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text(chats[i].split(':')[0]),
          subtitle: Text(chats[i].split(':')[1]),
          trailing: Text('3:25 PM'),
          onTap: () {},
        ),
      ),
    );
  }
}

// PROFILE - King of uk wala
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, title: Text('King of uk', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), iconTheme: IconThemeData(color: Colors.black)),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(16), child: Row(children: [CircleAvatar(radius: 40, child: Text('👳', style: TextStyle(fontSize: 30))), SizedBox(width: 16), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('King of uk', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)), Text('@king.of.uk15', style: TextStyle(color: Colors.grey)), SizedBox(height: 8), Row(children: [Text('197 Following  ', style: TextStyle(color: Colors.black)), Text('104 Followers  ', style: TextStyle(color: Colors.black)), Text('91 Likes', style: TextStyle(color: Colors.black))])]))])),
          Expanded(child: GridView.count(crossAxisCount: 3, children: List.generate(6, (i) => Container(color: [Colors.purple, Colors.teal, Colors.orange, Colors.pink, Colors.blue, Colors.green][i], child: Center(child: Text('Video ${i + 1}', style: TextStyle(color: Colors.white))))))),
        ],
      ),
    );
  }
}
// LOGIN PAGE - A wala
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneController = TextEditingController();
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ViewMint', style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.white)),
            Text('TikTok jaisa apna app', style: TextStyle(color: Colors.grey, fontSize: 16)),
            SizedBox(height: 40),
            // Login / SignUp Switch
            Row(children: [
              Expanded(child: GestureDetector(onTap: () => setState(() => _isLogin = true), child: Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: _isLogin ? Colors.pink : Colors.grey[900], borderRadius: BorderRadius.circular(10)), child: Center(child: Text('Login', style: TextStyle(fontWeight: FontWeight.bold)))))),
              SizedBox(width: 10),
              Expanded(child: GestureDetector(onTap: () => setState(() => _isLogin = false), child: Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: !_isLogin ? Colors.pink : Colors.grey[900], borderRadius: BorderRadius.circular(10)), child: Center(child: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold)))))),
            ]),
            SizedBox(height: 20),
            TextField(controller: _phoneController, keyboardType: TextInputType.phone, style: TextStyle(color: Colors.white), decoration: InputDecoration(hintText: 'Phone Number - 050 123 4567', hintStyle: TextStyle(color: Colors.grey), filled: true, fillColor: Colors.grey[900], border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none))),
            SizedBox(height: 12),
            TextField(obscureText: true, style: TextStyle(color: Colors.white), decoration: InputDecoration(hintText: 'Password', hintStyle: TextStyle(color: Colors.grey), filled: true, fillColor: Colors.grey[900], border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none))),
            SizedBox(height: 20),
            // Main Button
            SizedBox(width: double.infinity, height: 50, child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => MainScreen()));
              },
              child: Text(_isLogin ? 'LOGIN' : 'CREATE ACCOUNT', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            )),
            SizedBox(height: 20),
            Text('OR', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            SizedBox(width: double.infinity, height: 50, child: ElevatedButton.icon(icon: Icon(Icons.g_mobiledata, size: 28), label: Text('Continue with Google'), style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black), onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => MainScreen()));
            })),
            SizedBox(height: 12),
            Text(_isLogin ? 'Naya ho? Sign Up dabao' : 'Pehle se account hai? Login dabao', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
