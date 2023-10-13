

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
  bool gender = true;
  bool is_neutered = true;
  String actvity_level ='low';
  String selectedType = '狗';
  List<String> petTypes = ['狗', '猫', '鼠', '其他'];
  String selectedpetGender = '公';
  List<String> petGender = ['公','母'];
  String selectedNeutered = '是';
  List<String> Neutered = ['是', '否'];
  String selectedActivityLevel = '低';
  List<String> ActivityLevel = ['低','中','高'];
  final TextEditingController Namecontroller = TextEditingController();
  final TextEditingController Keepercontroller = TextEditingController();
  final TextEditingController Typecontroller = TextEditingController();
  final TextEditingController Weightcontroller = TextEditingController();
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
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode()); //點擊空白關閉鍵盤
      },
      child: Scaffold(
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
                      Row(
                        children: [
                          Container(
                            width: 170,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(left: 25, top: 20, right: 20, bottom: 0), // 增加右侧边距
                            child: Row(
                              children: [
                                Text('寵物類型',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),), // 额外文本
                                SizedBox(width: 30),
                                DropdownButton<String>(
                                  value: selectedType,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedType = newValue!;
                                    });
                                  },
                                  items: petTypes.map((type) {
                                    return DropdownMenuItem(
                                      value: type,
                                      child: Text(
                                        type,
                                        style: TextStyle(
                                          color: Color(0xFFfd9340),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 170,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                            child: Row(
                              children: [
                                Text('寵物性別',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),), // 额外文本
                                SizedBox(width: 30),
                                DropdownButton<String>(
                                  value: selectedpetGender,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedpetGender = newValue!;
                                    });
                                    if(selectedpetGender == '公'){
                                      gender = true;
                                    }else{
                                      gender= false;
                                    }
                                  },
                                  items: petGender.map((petGender) {
                                    return DropdownMenuItem(
                                      value: petGender,
                                      child: Text(
                                        petGender,
                                        style: TextStyle(
                                          color: Color(0xFFfd9340),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 170,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(left: 25, top: 20, right: 20, bottom: 0), // 增加右侧边距
                            child: Row(
                              children: [
                                Text('絕育　　',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),), // 额外文本
                                SizedBox(width: 30),
                                DropdownButton<String>(
                                  value: selectedNeutered,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedNeutered = newValue!;
                                    });
                                    if(selectedNeutered == '是'){
                                      is_neutered = true;
                                    }else{
                                      is_neutered= false;
                                    }
                                  },
                                  items: Neutered.map((type) {
                                    return DropdownMenuItem(
                                      value: type,
                                      child: Text(
                                        type,
                                        style: TextStyle(
                                          color: Color(0xFFfd9340),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 170,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                            child: Row(
                              children: [
                                Text('活動量　',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),), // 额外文本
                                SizedBox(width: 30),
                                DropdownButton<String>(
                                  value: selectedActivityLevel,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedActivityLevel = newValue!;
                                    });
                                    switch(newValue){
                                      case '低':actvity_level='low';break;
                                      case '中':actvity_level='moderate';break;
                                      case '高':actvity_level='high';break;
                                    }
                                  },
                                  items: ActivityLevel.map((petGender) {
                                    return DropdownMenuItem(
                                      value: petGender,
                                      child: Text(
                                        petGender,
                                        style: TextStyle(
                                          color: Color(0xFFfd9340),
                                        ),
                                      ),
                                    );
                                  }).toList(),
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
                              controller: Weightcontroller,
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
                      Container(
                          width: 341,
                          alignment: Alignment.bottomLeft,
                          margin:
                          const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                          child: TextField(
                              keyboardType: TextInputType.text,
                              controller: Contentcontroller,
                              decoration: InputDecoration(
                                isCollapsed: true,
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                                hintText: '寵物敘述',
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
                                          'type':selectedType.toString(),
                                          'birthday':dateFormatter.format(selectedDateTime),
                                          'content': Contentcontroller.text,
                                          'image': MultipartFile.fromFile(_path, filename: Namecontroller.text+'.jpg'),
                                          'weight':Weightcontroller.text,
                                          'gender':gender,
                                          'is_neutered':is_neutered,
                                          'activity_level':actvity_level
                                        });
                                        print(_path);
                                        repository.createPet(PetCreateformdata);
                                        print('11131`3131313131313');
                                        print(selectedType.toString());
                                        print(Contentcontroller.text);
                                        print(selectedActivityLevel.toString());
                                        print(is_neutered);
                                        print(gender);
                                        print(PetCreateformdata.toString());
                                        print('----------------------------------------------');
                                        print(dateFormatter.format(selectedDateTime));
                                        print(actvity_level);
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
      ),
    );
  }
}
