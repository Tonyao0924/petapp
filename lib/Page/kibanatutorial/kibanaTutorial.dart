import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../petInsert/pet_api.dart';


class KibanaTutorial extends StatefulWidget {
  @override
  _KibanaTutorial createState() => _KibanaTutorial();
}

class _KibanaTutorial extends State<KibanaTutorial> {
  PetRepository repository = PetRepository();
  Future<List<dynamic>> petList = Future<List<dynamic>>.value(null);
  List _imageUrls = [
    "assets/images/tutorial/1.png",
    "assets/images/tutorial/2.png",
    "assets/images/tutorial/3.png"
  ];
  List<String> descriptions = [
    "點擊Dashboard進入圖表",
    "設定要查詢的時間",
    "設定查詢條件\n可由pet.id指定寵物，type.id指定測量項目",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Kibana使用教學',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              tooltip: 'menu',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a menu')));
              },
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Container(
            width: 500,
            child: Swiper(
              itemCount: _imageUrls.length,
              autoplay: false,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Image.asset(
                      _imageUrls[index],
                      height:500,
                      width:350,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:50.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        descriptions[index],
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ));

  }
}
class OverViewAsset {
  final String src;
  final String type;
  OverViewAsset(this.src,this.type,
      );
}


