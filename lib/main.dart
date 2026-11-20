import 'package:flutter/material.dart';
void main(){runApp(MaterialApp(debugShowCheckedModeBanner:false, home:ViewMint()));}
class ViewMint extends StatefulWidget{State<ViewMint> createState()=>_V();}
class _V extends State<ViewMint>{
int idx=0;
int likes=1200;
bool liked=false;
List pages=[];
@override
Widget build(BuildContext context){
pages=[HomePage(liked:liked,likes:likes,onLike:(){setState((){liked=!liked; likes=liked?1201:1200;});}), CameraPage(), ProfilePage()];
return Scaffold(
body: pages[idx],
bottomNavigationBar: BottomNavigationBar(currentIndex: idx, onTap:(i)=>setState(()=>idx=i), type: BottomNavigationBarType.fixed, backgroundColor: Colors.black, selectedItemColor: Colors.white, unselectedItemColor: Colors.grey,
items:[
BottomNavigationBarItem(icon: Icon(Icons.home), label:'Home'),
BottomNavigationBarItem(icon: Icon(Icons.people), label:'Friends'),
BottomNavigationBarItem(icon: Container(padding:EdgeInsets.symmetric(horizontal:8,vertical:2), decoration:BoxDecoration(color:Colors.white, borderRadius:BorderRadius.circular(6)), child:Icon(Icons.add, color:Colors.black)), label:''),
BottomNavigationBarItem(icon: Icon(Icons.inbox), label:'Inbox'),
BottomNavigationBarItem(icon: Icon(Icons.person), label:'Profile'),
]));
}
}
class HomePage extends StatelessWidget{
final bool liked; final int likes; final VoidCallback onLike;
HomePage({required this.liked, required this.likes, required this.onLike});
Widget build(BuildContext context){
return Stack(children:[
Container(color:Colors.black, child:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center, children:[Icon(Icons.play_circle_fill, size:100, color:Colors.white), SizedBox(height:10), Text('Video yahan aayegi', style:TextStyle(color:Colors.white, fontSize:20)), Text('Dubai vibes #fyp', style:TextStyle(color:Colors.grey))] ))),
Positioned(top:40, left:0, right:0, child:Row(mainAxisAlignment:MainAxisAlignment.center, children:[Text('Following', style:TextStyle(color:Colors.grey)), SizedBox(width:20), Text('For You', style:TextStyle(color:Colors.white, fontWeight:FontWeight.bold, fontSize:18))])),
Positioned(bottom:80, left:12, child:Column(crossAxisAlignment:CrossAxisAlignment.start, children:[Text('@Ali', style:TextStyle(color:Colors.white, fontWeight:FontWeight.bold, fontSize:18)), Text('Dubai vibes #fyp', style:TextStyle(color:Colors.white))])),
Positioned(bottom:80, right:12, child:Column(children:[IconButton(icon:Icon(liked?Icons.favorite:Icons.favorite_border, color:liked?Colors.red:Colors.white, size:32), onPressed:onLike), Text('$likes', style:TextStyle(color:Colors.white)), SizedBox(height:15), Icon(Icons.comment, color:Colors.white, size:32), Text('21', style:TextStyle(color:Colors.white)), SizedBox(height:15), Icon(Icons.share, color:Colors.white, size:32), Text('Share', style:TextStyle(color:Colors.white))]))
]);
}
}
class CameraPage extends StatelessWidget{
Widget build(BuildContext context){
return Scaffold(backgroundColor:Colors.black, body:Stack(children:[
Container(color:Color(0xFF222222)),
Positioned(top:40, left:16, child:Icon(Icons.close, color:Colors.white, size:28)),
Positioned(top:35, left:0, right:0, child:Center(child:Container(padding:EdgeInsets.symmetric(horizontal:16,vertical:8), decoration:BoxDecoration(color:Colors.black54, borderRadius:BorderRadius.circular(20)), child:Row(mainAxisSize:MainAxisSize.min, children:[Icon(Icons.music_note, color:Colors.white, size:16), Text(' Add sound', style:TextStyle(color:Colors.white, fontWeight:FontWeight.bold))])))),
Positioned(top:100, right:16, child:Column(children:[Icon(Icons.flip_camera_ios, color:Colors.white, size:28), SizedBox(height:20), Icon(Icons.flash_off, color:Colors.white, size:28), SizedBox(height:20), Icon(Icons.timer, color:Colors.white, size:28), SizedBox(height:20), Icon(Icons.grid_view, color:Colors.white, size:28)])),
Positioned(bottom:110, left:0, right:0, child:Row(mainAxisAlignment:MainAxisAlignment.center, children:[Text('10m', style:TextStyle(color:Colors.grey)), SizedBox(width:20), Text('60s', style:TextStyle(color:Colors.grey)), SizedBox(width:20), Text('15s', style:TextStyle(color:Colors.grey)), SizedBox(width:20), Container(padding:EdgeInsets.symmetric(horizontal:10,vertical:4), decoration:BoxDecoration(color:Colors.white, borderRadius:BorderRadius.circular(12)), child:Text('PHOTO', style:TextStyle(color:Colors.black, fontWeight:FontWeight.bold))), SizedBox(width:20), Text('TEXT', style:TextStyle(color:Colors.grey))])),
Positioned(bottom:20, left:0, right:0, child:Row(mainAxisAlignment:MainAxisAlignment.center, children:[CircleAvatar(radius:22, backgroundColor:Colors.grey), SizedBox(width:30), Container(width:72,height:72, decoration:BoxDecoration(shape:BoxShape.circle, border:Border.all(color:Colors.white, width:3), color:Colors.white)), SizedBox(width:30), CircleAvatar(radius:22, backgroundColor:Colors.green)])),
Positioned(bottom:20, left:0, right:0, child:Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly, children:[Text('LIVE', style:TextStyle(color:Colors.grey)), Text('CAMERA', style:TextStyle(color:Colors.white, fontWeight:FontWeight.bold)), Text('CREATE', style:TextStyle(color:Colors.grey))])),
]));
}
}
class ProfilePage extends StatelessWidget{
Widget build(BuildContext context){
return Scaffold(backgroundColor:Colors.white, body:SingleChildScrollView(child:Column(children:[
SizedBox(height:40),
Padding(padding:EdgeInsets.symmetric(horizontal:16), child:Row(children:[Icon(Icons.edit, size:24), Spacer(), CircleAvatar(radius:18, backgroundColor:Colors.grey), SizedBox(width:12), Icon(Icons.person_add), SizedBox(width:12), Icon(Icons.menu)])),
Padding(padding:EdgeInsets.all(16), child:Row(crossAxisAlignment:CrossAxisAlignment.start, children:[
Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start, children:[
Row(children:[Text('King of uk', style:TextStyle(fontSize:26, fontWeight:FontWeight.bold)), Container(margin:EdgeInsets.only(left:6), padding:EdgeInsets.symmetric(horizontal:6,vertical:2), decoration:BoxDecoration(color:Colors.red, borderRadius:BorderRadius.circular(10)), child:Text('9+', style:TextStyle(color:Colors.white)))]),
Text('@king.of.uk15', style:TextStyle(color:Colors.grey)),
SizedBox(height:12),
Row(children:[Text('197 ', style:TextStyle(fontWeight:FontWeight.bold)), Text('Following  ', style:TextStyle(color:Colors.grey)), Text('104 ', style:TextStyle(fontWeight:FontWeight.bold)), Text('Followers  ', style:TextStyle(color:Colors.grey)), Text('91 ', style:TextStyle(fontWeight:FontWeight.bold)), Text('Likes', style:TextStyle(color:Colors.grey))]),
])),
Stack(children:[CircleAvatar(radius:42, backgroundColor:Colors.blue, child:Text('👳', style:TextStyle(fontSize:40))), Positioned(bottom:0, right:0, child:CircleAvatar(radius:12, backgroundColor:Colors.blue, child:Icon(Icons.add, size:16, color:Colors.white)))])
])),
Padding(padding:EdgeInsets.symmetric(horizontal:16), child:Row(children:[Container(padding:EdgeInsets.symmetric(horizontal:10,vertical:6), decoration:BoxDecoration(color:Colors.grey[200], borderRadius:BorderRadius.circular(20)), child:Text('+ Add bio  •  ♡ I\'m interested in...'))])),
SizedBox(height:12),
Padding(padding:EdgeInsets.symmetric(horizontal:16), child:Row(children:[Icon(Icons.star, color:Colors.blue, size:16), Text(' Create Story Highlights for your profile', style:TextStyle(fontWeight:FontWeight.bold)), Spacer(), Icon(Icons.close, size:16)])),
SizedBox(height:12),
Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly, children:[Icon(Icons.grid_view), Icon(Icons.lock), Icon(Icons.repeat), Icon(Icons.bookmark_border), Icon(Icons.favorite_border)]),
SizedBox(height:10),
GridView.builder(shrinkWrap:true, physics:NeverScrollableScrollPhysics(), gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3, childAspectRatio:0.7), itemCount:9, itemBuilder:(c,i){
List titles=['We\'re Hiring!','Dubai vibes','CV - Waleed','Work from home','Sunset','Beach','City','Food','Travel'];
return Container(margin:EdgeInsets.all(1), color: i%2==0?Colors.purple: i%3==0?Colors.orange:Colors.teal, child:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center, children:[Icon(Icons.play_arrow, color:Colors.white), Text(titles[i], textAlign:TextAlign.center, style:TextStyle(color:Colors.white, fontWeight:FontWeight.bold)), Text('▶ ${100+i*10}', style:TextStyle(color:Colors.white))])));})
])));
}
}
