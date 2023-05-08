import 'package:contact/model/model_movie.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

//createState(), State 클래스 선언, initState(), Widget build 만들기
class DetailScreen extends StatefulWidget{
  final Movie movie;
  DetailScreen({required this.movie});
  _DetailScreenState createState()=> _DetailScreenState();
}
class _DetailScreenState extends State<DetailScreen>{
  bool like = false; //라이크 관리  찜하기

  @override
  void initState(){
    super.initState();
    like=widget.movie.like; //해당 영화에 대한 상태를 가져온다. 찜 하고 있는지 상태를 가져옴.

  }
  @override
  Widget build(BuildContext context){
    //팝업 다이얼로그 형태로 만들겠음.
    return Scaffold(
      body: Container(
        //safeArea : 폰마다 화면 보이는게 다르니까 짤리는 거 없이 보여주기 위해
        child: SafeArea(
          child: ListView(children: [
            Stack(children: [
              Container(width: double.maxFinite,
              decoration: BoxDecoration(image: DecorationImage(
                  image: AssetImage('images/'+widget.movie.poster),fit: BoxFit.cover)),
                child: ClipRect(child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10), //블러처리
                  child: Container(alignment: Alignment.center,
                      color:Colors.black.withOpacity(0.1), //투명도
                    child: Container(child: Column(children: [
                      Container(padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                      child:Image.asset('images/'+widget.movie.poster),
                      height: 300,),
                      Container(padding: EdgeInsets.all(7),
                        child: Text('99% 일치 2023 15+ 시즌 1개', textAlign: TextAlign.center,style: TextStyle(fontSize: 13),),
                      ),
                      Container(padding: EdgeInsets.all(7),
                      child: Text(widget.movie.title,textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),),
                      Container(padding: EdgeInsets.all(3),
                      child: ElevatedButton(onPressed: (){},
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red))
                         ,child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.play_arrow),
                              Text("재생"),
                            ],
                          )
                      ),),
                      Container(padding: EdgeInsets.all(5),child:Text(widget.movie.toString()),
                      ),
                      //출연진 정보
                      Container(padding:EdgeInsets.all(5), alignment: Alignment.centerLeft,
                        child: Text('출연: 현빈, 손예진, 서지혜\n제작자: 이정효, 박지은',
                      style: TextStyle(color:Colors.white60,fontSize: 12,),),)
                    ],),),),

                ),),
              ),
              //내가찜한콘텐츠,평가,공유 버튼 stack의 새로운 child positioned위젯을 만든다. 이 위젯을 통해 앱바를 만들 수 있다.
              Positioned(child: AppBar(
                backgroundColor: Colors.transparent,elevation: 0, //투명색. 그림자농도0
              ))
            ],
            ),
            Container(color: Colors.black26,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(padding: EdgeInsets.fromLTRB(20, 10, 20 , 10),
                child: InkWell(onTap:(){} ,child: Column(
                  children: [
                    like? Icon(Icons.check):Icon(Icons.add),
                    Padding(padding: EdgeInsets.all(5),),
                    Text('내가 찜한 콘텐츠',style: TextStyle(fontSize: 11,color: Colors.white60),),
                  ],
                ),),),
                Container(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Container(child: Column(children: [
                  Icon(Icons.thumb_up),
                  Padding(padding: EdgeInsets.all(5),),
                  Text('평가',style: TextStyle(fontSize: 11,color: Colors.white60),),
                ],),) ,),
                Container(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Container(child: Column(
                  children: [Icon(Icons.send),
                  Padding(padding: EdgeInsets.all(5)),
                  Text("공유",style: TextStyle(fontSize: 11,color: Colors.white60),)],
                ),),
                )
              ],
            ),),
            //makeMenuButton(),
          ],
          ),
        ),

      ),);

  }
}
