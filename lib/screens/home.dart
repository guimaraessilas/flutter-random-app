import 'package:flutter/material.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  var jsonData =
      '[{ "title" : "BoJack Horseman", "seasons" : "6", "picture": "https://media-manager.noticiasaominuto.com/1920/1569828741/naom_5d91af55df2fe.jpg?crop_params=eyJwb3J0cmFpdCI6eyJjcm9wV2lkdGgiOjQ4MCwiY3JvcEhlaWdodCI6NzIwLCJjcm9wWCI6NDA4LCJjcm9wWSI6MH0sImxhbmRzY2FwZSI6eyJjcm9wV2lkdGgiOjEyNjAsImNyb3BIZWlnaHQiOjcwOCwiY3JvcFgiOjgsImNyb3BZIjo0fX0="} , { "title" : "The 100", "seasons" : "5", "picture": "https://mytvexperience.files.wordpress.com/2014/05/the-100-banner.png?w=640" }, {"title": "The Witcher", "seasons": "1", "picture": "https://i0.wp.com/mixdeseries.com.br/wp-content/uploads/2019/12/The-Witcher-Assistir-Netflix.jpg?fit=1050%2C600&ssl=1"}, {"title": "Unbreakable Kimmy Schmidt", "seasons": "3", "picture": "https://www.seriesdatv.pt/wp-content/uploads/2016/04/Kimmy.jpg"} ]';

  @override
  Widget build(BuildContext context) {
    var items = json.decode(jsonData);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6600ff),
          title: Text("Best Flix",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
              )),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              width: 395,
              height: 200,
              child: Card(
                elevation: 5.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: NetworkImage(
                          '${items[index]['picture']}',
                        ),
                        fit: BoxFit.fill),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            '${items[index]['title']}',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          )),
                      new Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'Nº de Temporadas: ${items[index]['seasons']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ))),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
