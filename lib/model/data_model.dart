class DataModel{

  String title;
  //int img=200;
  int releaseYear;
  int length;
  String description;
  int count;


  DataModel({

    required this.title,
    //required this.img,
    required this.releaseYear,
    required this.description,
    required this.length,
    required this.count,
  });

  factory DataModel.fromJson(Map<String,dynamic> json){
    return DataModel(

    title: json["title"],
    //img: json["img"],
    releaseYear: json["releaseYear"],
    description: json["description"],
    length: json["length"],
    count: json["count"]
    );

}

}