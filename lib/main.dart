import 'package:flutter/material.dart';
void main(){runApp(MyApp());}
class MyApp extends StatelessWidget{
@override Widget build(BuildContext c){
return MaterialApp(home:Home(),debugShowCheckedModeBanner:false);}}
class Home extends StatefulWidget{
@override _HomeState createState()=>_HomeState();}
class _HomeState extends State<Home>{
int i=0;
Widget feed(){
return ListView(children:[
video('Ali','Dubai vibes #fyp'),
video('Sara','New dance #viral'),
video('Ahmed','Al Ain #tiktok')]);}
Widget video(String n,String cap){
return Container(height:600,color:Colors.black,child:Stack(children:[
Center(child:Icon(Icons.play_circle,size:100,color:Colors.white24)),
Positioned(left:12,bottom:20,child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
Text('@$n',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold)),
Text(cap,style:TextStyle(color:Colors.white))])),
Positioned(right:12,bottom:100,child:Column(children:[
Icon(Icons.favorite,color:Colors.white,size:30),Text('1.2K',style:TextStyle(color:Colors.white)),
SizedBox(height:15),Icon(Icons.comment,color:Colors.white,size:30),Text('200',style:TextStyle(color:Colors.white))]))]));}
@override Widget build(BuildContext c){
return Scaffold(body:i==0?feed():Camera(),bottomNavigationBar:BottomNavigationBar(currentIndex:i,onTap:(v){setState((){i=v;});},items:[
BottomNavigationBarItem(icon:Icon(Icons.home),label:'Home'),
BottomNavigationBarItem(icon:Icon(Icons.add_box),label:'Camera')]));}}
class Camera extends StatelessWidget{
@override Widget build(BuildContext c){
return Scaffold(backgroundColor:Colors.black,body:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
Icon(Icons.camera_alt,color:Colors.white,size:80),
Text('Camera Ready',style:TextStyle(color:Colors.white,fontSize:22)),
SizedBox(height:20),
ElevatedButton(onPressed:(){},child:Text('Record'))])));}}
