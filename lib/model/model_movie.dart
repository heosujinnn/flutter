class Movie{
  //영화에 들어갈 요소들 제목 키워드 포스터 찜
  final String title;
  final String keyword;
  final String poster;
  final bool like;

  Movie.fromMap(Map<String, dynamic>map) //무비 클래스에 대한 프롬 맵 메서드 정의
  : title=map['title'],
  keyword=map['keyword'],
  poster=map['poster'],
  like=map['like'];

  //해당 클래스 프린트를 용이하게 하기 위해
  @override
  String toString()=> "Movie<$title:$keyword>";


}