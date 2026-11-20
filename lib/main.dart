import 'package:flutter/material.dart';

void main() {
  runApp(ViewMintApp());
}

class ViewMintApp extends StatefulWidget {
  @override
  _ViewMintAppState createState() => _ViewMintAppState();
}

class _ViewMintAppState extends State<ViewMintApp> {
  int coins = 1250;
  int selectedIndex = 0;
  bool liked = false;

  void addCoins() {
    setState(() {
      if (!liked) {
        coins += 10;
        liked = true;
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('10 Coins mil gaye! Total: $coins')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('ViewMint', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(20)),
              child: Row(children: [
                Icon(Icons.attach_money, color: Colors.black),
                Text('$coins', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
              ]),
            ),
          ],
        ),
        body: selectedIndex == 0 ? homePage() : selectedIndex == 1 ? balancePage() : profilePage(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex,
          onTap: (i) {
            setState(() {
              selectedIndex = i;
              liked = false;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Balance'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget homePage() {
    return Stack(
      children: [
        Container(color: Colors.grey[900], child: Center(child: Icon(Icons.play_circle_fill, size: 100, color: Colors.white))),
        Positioned(
          right: 16, bottom: 100,
          child: Column(children: [
            IconButton(icon: Icon(Icons.favorite, color: liked ? Colors.red : Colors.white, size: 40), onPressed: addCoins),
            Text('+10', style: TextStyle(color: Colors.white)),
            SizedBox(height: 20),
            Icon(Icons.comment, color: Colors.white, size: 35),
            SizedBox(height: 20),
            Icon(Icons.share, color: Colors.white, size: 35),
          ]),
        ),
        Positioned(
          left: 16, bottom: 30,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('@viewmint_user', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
            Text('Video dekho, Coins jeeto', style: TextStyle(color: Colors.white, fontSize: 16)),
            SizedBox(height: 10),
            Text(liked ? 'Liked! +10 Coins' : 'Dil dabao, Coins jeeto', style: TextStyle(color: Colors.yellow)),
          ]),
        ),
      ],
    );
  }

  Widget balancePage() {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.account_balance_wallet, size: 80, color: Colors.amber),
        SizedBox(height: 20),
        Text('Total Coins', style: TextStyle(color: Colors.white, fontSize: 20)),
        Text('$coins', style: TextStyle(color: Colors.amber, fontSize: 50, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        ElevatedButton(onPressed: () {}, child: Text('Withdraw')),
      ]),
    );
  }

  Widget profilePage() {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
        SizedBox(height: 15),
        Text('@viewmint_user', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
        Text('Coins: $coins', style: TextStyle(color: Colors.white, fontSize: 18)),
      ]),
    );
  }
}
