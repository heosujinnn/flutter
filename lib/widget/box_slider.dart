import 'package:contact/model/model_movie.dart';
import 'package:contact/screen/detail_screen.dart';
import 'package:flutter/material.dart';

class BoxSlider extends StatelessWidget{
  final List<Movie> movies;
  BoxSlider({required this.movies});
  @override
  Widget build(BuildContext context){
    return Container(padding: EdgeInsets.all(7),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('지금 뜨는 콘텐츠'),
        Container(height: 120,
        child: ListView(scrollDirection: Axis.horizontal,
          children:
          makeBoxImages(context,movies),
        ))
      ],
    ));
  }
}
List<Widget> makeBoxImages(BuildContext context,List<Movie>movies){
  List<Widget>result=[];
  for(var i=0; i<movies.length; i++){
    //클릭할 수 있게 만들고 on Tap 은 비워둔다
    result.add(InkWell(onTap: (){
      Navigator.of(context).push(MaterialPageRoute(fullscreenDialog: true,builder: (BuildContext context){
        return DetailScreen(movie: movies[i],
        );
      })
      );
    },
    child: Container(padding: EdgeInsets.only(right: 10),
    child: Align(
      alignment: Alignment.centerLeft,
        child: Image.asset('images/'+movies[i].poster),
    ),),
    ));
  }
  return result;
}
