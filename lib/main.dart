import 'package:flutter/material.dart';
void main(){runApp(MyApp());}
class MyApp extends StatelessWidget{
@override Widget build(BuildContext c){return MaterialApp(home:Home(),debugShowCheckedModeBanner:false);}}
class Home extends StatefulWidget{@override _H createState()=>_H();}
class _H extends State<Home>{
int i=0;
List<Map> v=[
{'img':'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800','name':'@Ali','cap':'Dubai vibes #fyp ❤️','like':'1.2K'},
{'img':'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=800','name':'@Sara','cap':'New dance #viral 🔥','like':'28'},
{'img':'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800','name':'@Ahmed','cap':'Al Ain sunset #foryou','like':'190'},];
Widget feed(){return PageView.builder(scrollDirection:Axis.vertical,itemCount:v.length,itemBuilder:(c,idx){
var d=v[idx];
return Stack(children:[
Positioned.fill(child:Image.network(d['img'],fit:BoxFit.cover)),
Positioned(top:40,left:0,right:0,child:Row(mainAxisAlignment:MainAxisAlignment.center,children:[Text('Following  ',style:TextStyle(color:Colors.white70)),Text('For You',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:17)),Icon(Icons.search,color:Colors.white)])),
Positioned(right:10,bottom:110,child:Column(children:[CircleAvatar(backgroundImage:NetworkImage(d['img'])),SizedBox(height:15),Icon(Icons.favorite,color:Colors.white,size:32),Text(d['like'],style:TextStyle(color:Colors.white)),SizedBox(height:12),Icon(Icons.comment,color:Colors.white,size:32),Text('21',style:TextStyle(color:Colors.white)),SizedBox(height:12),Icon(Icons.bookmark,color:Colors.white,size:32),Text('2',style:TextStyle(color:Colors.white)),SizedBox(height:12),Icon(Icons.share,color:Colors.white,size:32),Text('30',style:TextStyle(color:Colors.white))])),
Positioned(left:12,bottom:20,child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(d['name'],style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:18)),Text(d['cap'],style:TextStyle(color:Colors.white))]))]);});}
Widget profile(){return Scaffold(appBar:AppBar(title:Text('King of uk'),centerTitle:true,backgroundColor:Colors.white,foregroundColor:Colors.black),body:Column(children:[SizedBox(height:10),CircleAvatar(radius:45,backgroundImage:NetworkImage(v[0]['img'])),Text('King of uk',style:TextStyle(fontSize:22,fontWeight:FontWeight.bold)),Text('@king.of.uk15',style:TextStyle(color:Colors.grey)),Row(mainAxisAlignment:MainAxisAlignment.center,children:[Text('197 Following  '),Text('104 Followers  '),Text('91 Likes')]),SizedBox(height:10),Row(children:[Expanded(child:Container(height:100,child:Image.network(v[0]['img'],fit:BoxFit.cover))),Expanded(child:Container(height:100,child:Image.network(v[1]['img'],fit:BoxFit.cover))),Expanded(child:Container(height:100,child:Image.network(v[2]['img'],fit:BoxFit.cover)))])]));}
@override Widget build(BuildContext c){return Scaffold(body:i==4?profile():i==2?CameraScreen():feed(),bottomNavigationBar:BottomNavigationBar(currentIndex:i>2?4:i,onTap:(x){setState((){i=x==4?4:x;});},type:BottomNavigationBarType.fixed,selectedItemColor:Colors.black,items:[BottomNavigationBarItem(icon:Icon(Icons.home),label:'Home'),BottomNavigationBarItem(icon:Icon(Icons.group),label:'Friends'),BottomNavigationBarItem(icon:Container(decoration:BoxDecoration(color:Colors.black,borderRadius:BorderRadius.circular(8)),padding:EdgeInsets.symmetric(horizontal:12,vertical:2),child:Icon(Icons.add,color:Colors.white)),label:''),BottomNavigationBarItem(icon:Icon(Icons.inbox),label:'Inbox'),BottomNavigationBarItem(icon:Icon(Icons.person),label:'Profile')]));}}
// ===== CAMERA SCREEN - LIVE + FILTER + SOUND =====
class CameraScreen extends StatefulWidget{@override _C createState()=>_C();}
class _C extends State<CameraScreen>{
String mode='Camera'; String filter='No Filter'; String sound='Add Sound'; bool rec=false;
List<String> filters=['No Filter
