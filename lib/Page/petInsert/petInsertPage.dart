

import 'package:intl/intl.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/Page/petInsert/pet_api.dart';
import 'package:petapp/Page/petInsert/upload_image_widget.dart';
import '../../model/Pet.dart';
class PetInsertPage extends StatefulWidget {
  @override
  _PetInsertPage createState() => _PetInsertPage();
}

class _PetInsertPage extends State<PetInsertPage> {
  String _path = "";
  String name = "";
  int keeper = 0;
  int type = 0;
  String birthday = "";
  String content = "";
  PetRepository repository = PetRepository();
  final TextEditingController Namecontroller = TextEditingController();
  final TextEditingController Keepercontroller = TextEditingController();
  final TextEditingController Typecontroller = TextEditingController();
  final TextEditingController Contentcontroller = TextEditingController();
  final dateFormatter = DateFormat('yyyy-MM-dd');
  late DateTime selectedDateTime;
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    selectedDateTime = now;
  }
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
                            child: UploadImageWidget(
                              onImagePicked: (path) {
                                setState(() {
                                  _path = path;
                                });
                              },
                              child: _path == ""
                                  ? Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: const Color(0xFFCCCCCC),
                                ),
                                child: Icon(Icons.collections_outlined),
                              )
                                  : SizedBox(
                                height: 100,
                                width: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: Image.file(
                                    File(_path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
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
                                  child: TextField(
                                      keyboardType: TextInputType.text,
                                      controller: Namecontroller,
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
                                alignment:Alignment.centerLeft,
                                width: 200,
                                margin: const EdgeInsets.only(
                                        left: 0, top: 14, right: 0, bottom: 0),
                              decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(
                                          color: Color(0xFFDADADA),
                                          width: 1.0,
                                          style: BorderStyle.solid
                                          ),
                                        ),
                                child: TextButton(
                                  child: Text(
                                    dateFormatter.format(selectedDateTime),
                                    style: TextStyle(color: Colors.black),
                                    textAlign: TextAlign.left,
                                  ),
                                  onPressed: () async{
                                    final result = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2020, 01),
                                        lastDate: DateTime(2100, 12));
                                    if (result != null) {
                                      setState(() {
                                        selectedDateTime = result;
                                      });
                                    }
                                  },
                                ),
                              ),
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
                        child: TextField(
                            keyboardType: TextInputType.text,
                            controller: Typecontroller,
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
                        child: TextField(
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
                        child: TextField(
                            controller: Contentcontroller,
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
                        child: TextField(
                            keyboardType: TextInputType.text,
                            controller: Keepercontroller,
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
                    // API要修改的部分
                    Container(
                        width: 341,
                        alignment: Alignment.bottomLeft,
                        margin:
                        const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                        child: TextField(
                          // API要修改的部分
                            keyboardType: TextInputType.text,
                            controller: Keepercontroller,
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
                                    onPressed: () async {
                                      var PetCreateformdata = FormData.fromMap({
                                        // API要修改的部分
                                        'name': Namecontroller.text,
                                        'keeper': int.parse(Keepercontroller.text),
                                        'type':Typecontroller.text,
                                        'birthday':dateFormatter.format(selectedDateTime),
                                        'content': Contentcontroller.text,
                                        'image': await MultipartFile.fromFile(_path, filename: Namecontroller.text+'.jpg'),
                                      });
                                      print(_path);
                                      repository.createPet(PetCreateformdata);
                                    },
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
