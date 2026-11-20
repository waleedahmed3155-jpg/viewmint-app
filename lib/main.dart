import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int i = 0;

  final List<Map<String, String>> v = [
    {
      'img': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
      'name': '@Ali',
      'cap': 'Dubai vibes #fyp',
      'like': '1.2K'
    },
    {
      'img': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=800',
      'name': '@Sara',
      'cap': 'New dance #viral',
      'like': '28'
    },
    {
      'img': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
      'name': '@Ahmed',
      'cap': 'Al Ain sunset #foryou',
      'like': '190'
    },
  ];

  Widget feed() {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: v.length,
      itemBuilder: (c, idx) {
        var d = v[idx];
        return Stack(
          children: [
            Positioned.fill(
                child: Image.network(d['img']!, fit: BoxFit.cover)),
            const Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Following  ',
                      style: TextStyle(color: Colors.white70)),
                  Text('For You',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                ],
              ),
            ),
            Positioned(
              right: 10,
              bottom: 110,
              child: Column(
                children: [
                  CircleAvatar(
                      backgroundImage: NetworkImage(d['img']!)),
                  const SizedBox(height: 15),
                  const Icon(Icons.favorite, color: Colors.white, size: 32),
                  Text(d['like']!,
                      style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 12),
                  const Icon(Icons.comment, color: Colors.white, size: 32),
                  const Text('21', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 12),
                  const Icon(Icons.share, color: Colors.white, size: 32),
                  const Text('30', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Positioned(
              left: 12,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(d['name']!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  Text(d['cap']!,
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget profile() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('King of uk'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          CircleAvatar(
              radius: 45, backgroundImage: NetworkImage(v[0]['img']!)),
          const Text('King of uk',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const Text('@king.of.uk15',
              style: TextStyle(color: Colors.grey)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('197 Following  '),
              Text('104 Followers  '),
              Text('91 Likes'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  child: SizedBox(
                      height: 100,
                      child:
                          Image.network(v[0]['img']!, fit: BoxFit.cover))),
              Expanded(
                  child: SizedBox(
                      height: 100,
                      child:
                          Image.network(v[1]['img']!, fit: BoxFit.cover))),
              Expanded(
                  child: SizedBox(
                      height: 100,
                      child:
                          Image.network(v[2]['img']!, fit: BoxFit.cover))),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: i == 4
          ? profile()
          : i == 2
              ? const CameraScreen()
              : feed(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: i > 2 ? 4 : i,
        onTap: (x) {
          setState(() {
            i = x == 4 ? 4 : x;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.group), label: 'Friends'),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: const Icon(Icons.add, color: Colors.white),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.inbox), label: 'Inbox'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});
  @override
  State<CameraScreen> createState() => _CameraState();
}

class _CameraState extends State<CameraScreen> {
  String mode = 'Camera';
  String filter = 'No Filter';
  String sound = 'Add Sound';
  bool rec = false;

  final List<String> filters = [
    'No Filter',
    'Beauty',
    'Vivid',
    'Warm',
    'Cool',
    'Black & White',
    'Vintage'
  ];
  final List<String> sounds = [
    'Add Sound',
    'Trending - Ego',
    'Dubai Vibes',
    'Viral Beat',
    'Arabic Remix',
    'Love Song'
  ];

  void pickSound() {
    showModalBottomSheet(
      context: context,
      builder: (c) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Add Sound',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            for (var s in sounds)
              ListTile(
                leading: const Icon(Icons.music_note, color: Colors.red),
                title: Text(s),
                onTap: () {
                  setState(() {
                    sound = s;
                  });
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
    );
  }

  void pickFilter() {
    showModalBottomSheet(
      context: context,
      builder: (c) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Filters',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: [
                for (var f in filters)
                  ChoiceChip(
                    label: Text(f),
                    selected: filter == f,
                    onSelected: (_) {
                      setState(() {
                        filter = f;
                      });
                      Navigator.pop(context);
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color tint = Colors.transparent;
    if (filter == 'Warm') tint = Colors.orange.withOpacity(0.25);
    if (filter == 'Cool') tint = Colors.blue.withOpacity(0.25);
    if (filter == 'Black & White') tint = Colors.grey.withOpacity(0.4);
    if (filter == 'Vivid') tint = Colors.pink.withOpacity(0.2);
    if (filter == 'Vintage') tint = Colors.brown.withOpacity(0.25);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(child: Container(color: tint)),
          Positioned(
            top: 40,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.close, color: Colors.white),
                Text(sound, style: const TextStyle(color: Colors.white)),
                const Icon(Icons.flash_off, color: Colors.white),
              ],
            ),
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var m in ['Live', 'Camera', 'Story'])
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        mode = m;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: mode == m ? Colors.white : Colors.black45,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(m,
                          style: TextStyle(
                              color:
                                  mode == m ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
              ],
            ),
          ),
          if (mode == 'Live')
            const Positioned(
              top: 140,
              left: 12,
              child: Text('LIVE  1.2K watching',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: pickSound,
                      icon: const Icon(Icons.music_note),
                      label: Text(sound),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black54,
                          foregroundColor: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: pickFilter,
                      icon: const Icon(Icons.face),
                      label: Text('Filter: $filter'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black54,
                          foregroundColor: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=200'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 25),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          rec = !rec;
                        });
                      },
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Colors.white, width: 4),
                          color: rec
                              ? Colors.red
                              : Colors.red.withOpacity(0.7),
                        ),
                        child: Center(
                          child: rec
                              ? const Text('STOP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                              : const Icon(Icons.videocam,
                                  color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 25),
                    const Column(
                      children: [
                        Icon(Icons.upload, color: Colors.white),
                        Text('Upload',
                            style: TextStyle(
                                color: Colors.white, fontSize: 11)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text('Mode: $mode | Filter: $filter | Sound: $sound',
                    style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
