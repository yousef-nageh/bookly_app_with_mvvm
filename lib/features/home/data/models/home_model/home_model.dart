class HomeModel{
 late final String kind;
 late final int totalItems ;
 late  List<HomeModelItems>  items;
HomeModel.fromJson(Map<String,dynamic> json){
 kind = json['kind'];
 totalItems = json['totalItems'];
 items = (json['items'] as List)
     .map((e) => HomeModelItems.fromJson(e))
     .toList();
}

}

class HomeModelItems{
 late final String kind;

late final String id;

late final String etag;

late final String selfLink;

 HomeModelItemsVolumeInfo ?volumeInfo;
 HomeModelItems.fromJson(Map<String,dynamic> json){

  kind=json['kind'];
  id=json['id'];
  etag=json['etag'];
  selfLink=json['selfLink'];
  volumeInfo= (json ["volumeInfo"] !=null?HomeModelItemsVolumeInfo.fromJson(json['volumeInfo']) :null)!;
 }


}


class HomeModelItemsVolumeInfo{

 late final String title;
 late final dynamic publisher;

late final String publishedDate;

late final String description;
HomeModelItemsVolumeInfoImageLink ?imageLinks;
 HomeModelItemsVolumeInfo.fromJson(Map<String,dynamic> json){

  title=json['title'];
  publisher=json['publisher'];
  publishedDate=json['publishedDate'];
  description=json['description'];
  imageLinks=HomeModelItemsVolumeInfoImageLink.fromJson(json['imageLinks']);
 }



}
class  HomeModelItemsVolumeInfoImageLink{
 late final String smallThumbnail;
 late final String thumbnail;
 HomeModelItemsVolumeInfoImageLink.fromJson(Map<String,dynamic> json){

  smallThumbnail=json['smallThumbnail'];
  thumbnail=json['thumbnail'];
 }

}