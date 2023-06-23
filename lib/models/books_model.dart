
class BooksData{
  String? title;
  String? url;
  String? cover;

  BooksData.fromJson(Map<String, dynamic>json){
    title = json['title'];
    url = json['url'];
    cover = json['cover'];

  }



}

