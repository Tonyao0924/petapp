import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetInsertpage extends StatefulWidget {
  @override
  _PetInsertpage createState() => _PetInsertpage();
}

class _PetInsertpage extends State<PetInsertpage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '加入新的寵物',
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
        body:
        Scrollbar(
          thumbVisibility: true,
          child: ListView.builder(
              primary: true,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Container(
                      margin:
                      EdgeInsets.only(left: 0, top: 30, right: 0, bottom: 0),
                      child:
                      Text('加入新的寵物',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
                      width: 341,
                    ),
                    Container(
                      margin:
                      EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                      child:
                      Text('請您將新的寵物資訊完整填入以下欄位。',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),),
                      width: 341,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin:
                          EdgeInsets.only(left: 30, top: 30, right: 20, bottom: 0),
                          color: Colors.grey,
                          child: Center(
                            child: Text('照片'),
                          ),
                          width: 142,
                          height: 120,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0, top: 25, right: 0, bottom: 0),
                          width: 176.0,
                          height: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 0, top: 0, right: 0, bottom: 0),
                                  child: const TextField(
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        isCollapsed: true,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 15),
                                        hintText: '寵物名稱',
                                        hintStyle: TextStyle(
                                          color: Color(0xFFfd9340),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(13),
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(0xFFDADADA),
                                            width: 1,
                                          ),
                                        ),
                                      ))),
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 0, top: 14, right: 0, bottom: 0),
                                  child: const TextField(
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        isCollapsed: true,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 15),
                                        hintText: '出生年月日',
                                        hintStyle: TextStyle(
                                          color: Color(0xFFfd9340),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(13),
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(0xFFDADADA),
                                            width: 1,
                                          ),
                                        ),
                                      ))),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                        width: 341,
                        alignment: Alignment.bottomLeft,
                        margin:
                        const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                        child: const TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                              hintText: '寵物類別',
                              hintStyle: TextStyle(
                                color: Color(0xFFfd9340),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFDADADA),
                                  width: 1,
                                ),
                              ),
                            ))),
                    Container(
                        width: 341,
                        alignment: Alignment.bottomLeft,
                        margin:
                        const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                        child: const TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                              hintText: '寵物品種',
                              hintStyle: TextStyle(
                                color: Color(0xFFfd9340),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFDADADA),
                                  width: 1,
                                ),
                              ),
                            ))),
                    Container(
                        width: 341,
                        alignment: Alignment.bottomLeft,
                        margin:
                        const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                        child: const TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                              hintText: '寵物性別',
                              hintStyle: TextStyle(
                                color: Color(0xFFfd9340),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFDADADA),
                                  width: 1,
                                ),
                              ),
                            ))),
                    Container(
                        width: 341,
                        alignment: Alignment.bottomLeft,
                        margin:
                        const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                        child: const TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                              hintText: '飼料熱量(每100克)',
                              hintStyle: TextStyle(
                                color: Color(0xFFfd9340),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFDADADA),
                                  width: 1,
                                ),
                              ),
                            ))),
                    Container(
                        width: 341,
                        alignment: Alignment.bottomLeft,
                        margin:
                        const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                        child: const TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                              hintText: '寵物體重',
                              hintStyle: TextStyle(
                                color: Color(0xFFfd9340),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFDADADA),
                                  width: 1,
                                ),
                              ),
                            ))),
                    Container(
                        width: 341,
                        alignment: Alignment.bottomLeft,
                        margin:
                        const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                        child: const TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                              hintText: '機器綁定碼',
                              hintStyle: TextStyle(
                                color: Color(0xFFfd9340),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFDADADA),
                                  width: 1,
                                ),
                              ),
                            ))),
                    Container(
                      margin:
                      const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                      width: 341,
                      height: 81,
                      child: Column(
                        children: [
                          ClipRRect(
                            // Put the TextButton on the Gradient Container
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                // Container
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFFBAB7E),
                                          Color(0xFFF7CE68),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                    ),
                                  ),
                                ),
                                // TextButton_Gradient
                                Container(
                                  width: 341,
                                  height: 51,
                                  child: TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(18.76)))),
                                    onPressed: () {},
                                    child: Text(
                                      '新增寵物',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        )
    );
  }
}