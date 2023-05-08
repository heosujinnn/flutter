import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Center(child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            child: CircleAvatar(radius: 100, backgroundImage: AssetImage('ddd.png'),),
          ),
          Container(padding: EdgeInsets.only(top: 15),
            child: Text('SOOJIN',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
          ),
          Container(padding: EdgeInsets.all(10),width: 140,height: 5,color: Colors.red,), //밑줄
          Container(padding: EdgeInsets.all(10), child: Linkify(onOpen: (link)async{
            if(await canLaunchUrl(link.url as Uri)){
              await launchUrl(link.url as Uri);
            }
          },
          text: "https://github.com/heosujinnn",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            linkStyle: TextStyle(color: Colors.white),
          ),
            //주소를 클릭할 수 있게 하는 방법 : Linkify패키지를 사용하자~~
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(onPressed: (){},
            child: Container(
              color: Colors.red,
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit, color: Colors.white,),
              Text('프로필 수정하기',style: TextStyle(color: Colors.white),)
            ],),),),
          ),
          Container(padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: TextButton(
                  onPressed: (){},
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.check,color: Colors.white,),
                        Text('  내가 찜한 콘텐츠',style: TextStyle(color: Colors.white60),),
                      ],
                    ),
              )
              )
          ),
          Container(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextButton(
            onPressed: (){}, child: Container(
            child: Row(
              children: [
                Icon(Icons.settings,color: Colors.white,),
                Text('  앱 설정',style: TextStyle(color: Colors.white60),)
              ],
            ),),),),
          Container(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextButton(
            onPressed: (){},
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.man,color: Colors.white,),
                  Text('  계정',style: TextStyle(color: Colors.white60),)
                ],
              ),
            ),
          ),),
          Container(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextButton(
              onPressed: (){},
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.help_center,color: Colors.white,),
                    Text('  고객센터',style: TextStyle(color: Colors.white60),)
                  ],
                ),
              ),
            ),),
        ],
      ),
      ),
    );
  }
}
