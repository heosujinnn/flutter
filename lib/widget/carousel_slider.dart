
import 'package:carousel_slider/carousel_slider.dart';
import 'package:contact/model/model_movie.dart';
import 'package:contact/screen/detail_screen.dart';
import 'package:flutter/material.dart';



class CarouselImage extends StatefulWidget{ //statefulwidget 으로 하는 이유는 정보버튼+ 디테일 페이지 띄우는 기능을 담고 있으니까
  final List<Movie> movies; //임포트 해주고
  //홈화면에서 carouseImage로 movie를 넘겨 받아야 한다.
  CarouselImage({ required this.movies});
  _CarouselImageState createState()=> _CarouselImageState();

}
class _CarouselImageState extends State<CarouselImage>{
   late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;
  int _currentPage=0; //이미지에서 어느 위치에 있는지 인덱스를 저장할 페이지
  late String _currentKeyword; //키워드도 가져와야함~


  @override
  void initState(){
    super.initState();
    //초깃값 설정
    movies=widget.movies;
    images=movies.map((m) => Image.asset('./images/'+m.poster,)).toList();
    keywords=movies.map((m)=>m.keyword).toList();
    likes=movies.map((m)=>m.like).toList();
    _currentKeyword=keywords[0];

  }
  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          Container(padding: EdgeInsets.all(20),

          ),
          CarouselSlider(items: images, options: CarouselOptions(onPageChanged: (index,reason){
            setState(() {

              _currentPage=index;
              _currentKeyword=keywords[_currentPage];
            });
          }),),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(_currentKeyword,style: TextStyle(fontSize: 11),),),
          //메뉴바
          Container(child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Container(child: Column(children: [
              //찜하기 버튼 눌럿냐 안눌렀냐?에 따른 체크버튼 또는 플러스 버튼
              likes[_currentPage]
              ? IconButton(icon:Icon(Icons.check),onPressed: (){},) //온프레스드는 빈 형태로 만듦
              : IconButton(icon:Icon(Icons.add),onPressed: (){},),
              Text('내가 찜한 콘텐츠',style: TextStyle(fontSize: 11),)
            ],)),
              //재생버튼~
              Container(padding: EdgeInsets.only(right: 10),
                child: ElevatedButton( style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),onPressed:(){},child:Row(
                  children: <Widget>[Icon(Icons.play_arrow, color: Colors.black,),
                    Padding(padding: EdgeInsets.all(3),),
                    Text('재생',style: TextStyle(color:Colors.black),),
                  ],
                )),
              ),
              //목록 버튼 : 컨테이너 만들고 패딩적용하고 child는 column으로 해보자.
              Container(padding: EdgeInsets.only(right: 10),child: Column(children: [
                IconButton(onPressed: (){
                  //정보버튼을 눌렀을 때 해당 파라미터에 해당 영화 정보가 인자로 넘어가서 detailScreen화면이 보이게 됨.
                  Navigator.of(context).push(MaterialPageRoute(fullscreenDialog: true,builder: (BuildContext context){
                    return DetailScreen(movie: movies[_currentPage],
                    );
                  })
                  );
                }, icon: Icon(Icons.info),),
                Text('정보',style: TextStyle(fontSize: 11),),
              ],),)
            ],
          )),
          Container(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: makeIndicator(likes, _currentPage,),))
          ],
      ),
    );
  }
}

//indicator는 별도의 함수를 만들어 관리하자.
List<Widget> makeIndicator(List list, int _currentPage){
  List<Widget> results=[]; //list만들어주고  results에 컨테이너를 add하는 방식이다.
  for(var i=0; i<list.length; i++){
    results.add(Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
    //높이 너비 마진을 넣어줌
      //데코레이션은 박스 데코레이션을 선언하고 박스 쉐이프는 설클 모양으로 만들고, 현재 페이지를 가리키고 있다면?
    decoration: BoxDecoration(shape: BoxShape.circle,
      color: _currentPage==i?
      Color.fromRGBO(255,255,255,0.9)// 0.9
      :Color.fromRGBO(255, 255, 255, 0.4),
       ),//아니라면0.4로 맞춰준다.
    ));
  }
  return results;
}

