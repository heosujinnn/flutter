import 'package:contact/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:contact/model/model_movie.dart';

//StatelessWidget : 상태의 변화가 없는 위젯인 경우

//home_screen.dart 에서 movies를 넘겨 받아야 함. 원형으로 영화 보이게 하는 부분~
class CircleSlider extends StatelessWidget{
  final List<Movie>movies;
  CircleSlider({required this.movies});


  @override
  Widget build(BuildContext context){
    //컨테이너 안에 컬럼을 넣는다.
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('미리보기'),
        //리스트뷰 넣어야 됨
        Container(height: 120,child: ListView(
          scrollDirection: Axis.horizontal, //좌우 스크롤
          children: makeCircleImages(context,movies),
        ),)
      ],),
    );
  }
}
List<Widget> makeCircleImages(BuildContext context,List<Movie> movies){
  List<Widget> result=[];
  //각 위젯들을 클릭이 가능하도록 InkWell 위젯으로 만들어준다.
  for(var i = 0; i<movies.length; i++){
    result.add(InkWell(onTap: (){
      Navigator.of(context).push(MaterialPageRoute(fullscreenDialog: true,builder: (BuildContext context){
        return DetailScreen(movie: movies[i],
        );
      })
      );
    },child: Container(
      padding: EdgeInsets.only(right: 10),
      child: Align(alignment: Alignment.centerLeft,
        child: CircleAvatar(backgroundImage: AssetImage('images/'+movies[i].poster),
        radius: 48,),),

    ),));
  }
  return result;
}