import 'package:contact/screen/home_screen.dart';
import 'package:contact/widget/bottom_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget{
  _MyAppState createState()=>_MyAppState();

}
class _MyAppState extends State<MyApp>{
 // TabController controller;
  @override
  Widget build(BuildContext context){
    return MaterialApp(title: 'jinFlix',
    theme: ThemeData(brightness: Brightness.dark,
        primaryColor: Colors.black,
    ),
      home: DefaultTabController(length: 4, child: Scaffold(body: TabBarView(physics: NeverScrollableScrollPhysics(),
        children:
        [
          HomeScreen(),
          Container(child: Center(child: Text('홈'),)),Container(child: Center(child: Text('2'),),)
        ,Container(child: Center(child: Text('3'),),)
        ,Container(child: Center(child:Text('4')),)
      ],
      ),
        //네비게이션 바
        bottomNavigationBar: Bottombar(),
      ),
      )
    );
  }
}