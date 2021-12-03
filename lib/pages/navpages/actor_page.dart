import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sakil/model/data_model.dart';
import 'package:sakil/pages/detail_page.dart';
class ActorPage extends StatefulWidget {
  ActorPage({Key? key}) : super(key: key);

  @override
  State<ActorPage> createState() => _ActorPageState();
}

class _ActorPageState extends State<ActorPage> {
  List<DataModel> movies=[];

  bool search=false;

  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.05),
      appBar: AppBar(
        title: !search?Text("Search App"):
        TextField(
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          onSubmitted: (String query){
            getMovies(query);
          },
          decoration: InputDecoration(
            hintText: "Busqueda",
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          ),

        ),
        actions: <Widget>[
          IconButton(
            icon: search?Icon(Icons.close):Icon(Icons.search),
            onPressed: () {
              setState(() {

                search=!search;
              });
            },
          ),
        ],
      ),
      drawer: Drawer(),
      body: Container(
        child:  GridView.count(
            crossAxisCount: 2,
            childAspectRatio: ((size.width/3) / 150),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: EdgeInsets.all(10),
            children: movies.map((DataModel data) {
              return
                GestureDetector(
                  onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailPage(movie: data)));
                  },
                  child: Container(
                    decoration: BoxDecoration(image:
                    DecorationImage(
                        image: NetworkImage("http://picsum.photos/600/${600+Random().nextInt(100)}"),
                        fit: BoxFit.cover
                    ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: size.width,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                          ),
                          child: Column(
                            children: [
                              Text(data.title,style: TextStyle(color: Colors.black),),
                              Text(data.releaseYear.toString(),style: TextStyle(color: Colors.red),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
            }).toList()
        ),
      ),
    );
  }

  getMovies(query)async{

    String baseUrl = "http://192.168.100.15:8083";
    var apiUrl = '/film?country_id=8&page=0&actor=${query}';
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(res.statusCode==200){
        List<dynamic> list = json.decode(res.body);
        print(list);
        setState(() {

          movies=list.map((e) => DataModel.fromJson(e)).toList();
        });
      }
      return <DataModel>[];
    }catch(e){
      return <DataModel>[];
    }
  }
}

