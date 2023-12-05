

import 'dart:convert';

import 'package:intl/intl.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/Page/petInfo/petInfoPage.dart';
import 'package:petapp/Page/petInsert/pet_api.dart';
import 'package:petapp/Page/petInsert/upload_image_widget.dart';
class PetEditPage extends StatefulWidget {
  @override
  _PetEditPage createState() => _PetEditPage();
}

class _PetEditPage extends State<PetEditPage> {
  String _path = "";
  String name = "";
  int keeper = 0;
  int type = 0;
  String id = '';
  String birthday = "";
  String content = "";
  PetRepository repository = PetRepository();
  List<String> petTypes = ['狗', '貓', '鼠', '其他'];
  int selectedType = 1;
  String nowselectedType ='';
  bool selectedpetGender = true;
  String nowselectedpetGender = '公';
  List<String> petGender = ['公','母'];
  bool selectedpetis_neutered = true;
  List<bool> is_neutered = [true,false];
  String selectedpetactivity_level = 'low';
  List<String> activity_level = ['low','moderate','high'];
  String image = '';
  final TextEditingController Namecontroller = TextEditingController();
  final TextEditingController Keepercontroller = TextEditingController();
  final TextEditingController Typecontroller = TextEditingController();
  final TextEditingController Contentcontroller = TextEditingController();
  final TextEditingController Weightcontroller = TextEditingController();
  final dateFormatter = DateFormat('yyyy-MM-dd');
  late DateTime selectedDateTime;
  bool _initialized = false;
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    selectedDateTime = now;
  }
  @override
  Widget build(BuildContext contex) {
    if(!_initialized){
      final Petinfo = ModalRoute
          .of(context)!
          .settings
          .arguments as Map<String, dynamic>;

      // 剩下的初始化逻辑
      Namecontroller.text = Petinfo['name'];
      Keepercontroller.text = Petinfo['keeper'].toString();
      selectedDateTime = DateTime.parse(Petinfo['birthday']);
      selectedType = Petinfo['type'];
      print(Petinfo['type']);
      switch (Petinfo['type']) {
        case 1:
          nowselectedType = "狗";
          break;
        case 2:
          nowselectedType = "貓";
          break;
        case 3:
          nowselectedType = "鼠";
          break;
        case 4:
          nowselectedType = "其他";
          break;
      }
      selectedpetGender = Petinfo['gender'];
      if(Petinfo['gender']) {
        nowselectedpetGender = '公';
      }else{
        nowselectedpetGender = '母';
      }
      Contentcontroller.text = Petinfo['content'];
      Weightcontroller.text = Petinfo['weight'];
      selectedpetis_neutered = Petinfo['is_neutered'];
      selectedpetactivity_level = Petinfo['activity_level'];
      _initialized = true;
      image = Petinfo['image'];
      id = Petinfo['id'].toString();
    }

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
                            child: Image.network(image),
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
                          margin: const EdgeInsets.only(left: 25, top: 20, right: 20, bottom: 0), // 增加右側邊距
                          child: Row(
                            children: [
                              Text('寵物類型',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),),
                              SizedBox(width: 30), // 增加垂直間距
                              DropdownButton<String>(
                                value: nowselectedType,
                                onChanged: (newValue) {
                                  setState(() {
                                    nowselectedType = newValue!;
                                    switch(newValue){
                                      case '狗':
                                        selectedType = 1;
                                        break;
                                      case '貓':
                                        selectedType = 2;
                                        break;
                                      case '鼠':
                                        selectedType = 3;
                                        break;
                                      case '其他':
                                        selectedType = 4;
                                        break;
                                    }
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
                              Text('寵物性別',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),),
                              SizedBox(width: 30),
                              DropdownButton<String>(
                                value: nowselectedpetGender,
                                onChanged: (newValue) {
                                  setState(() {
                                    nowselectedpetGender = newValue!;
                                    if(newValue != null && newValue == true){
                                      selectedpetGender = true;
                                    }
                                    else{
                                      selectedpetGender = false;
                                    }
                                  });
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
                          margin: const EdgeInsets.only(left: 25, top: 20, right: 20, bottom: 0), // 增加右側邊距
                          child: Row(
                            children: [
                              Text('活動量',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),),
                              SizedBox(width: 15), // 增加垂直間距
                              DropdownButton<String>(
                                value: selectedpetactivity_level,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedpetactivity_level = newValue!;
                                  });
                                },
                                items: activity_level.map((activity_level) {
                                  return DropdownMenuItem(
                                    value: activity_level,
                                    child: Text(
                                      activity_level,
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
                              Text('是否絕育',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),),
                              SizedBox(width: 30),
                              DropdownButton<bool>(
                                value: selectedpetis_neutered,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedpetis_neutered = newValue!;
                                  });
                                },
                                items: is_neutered.map((is_neutered) {
                                  return DropdownMenuItem(
                                    value: is_neutered,
                                    child: Text(
                                      is_neutered.toString(),
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
                    // Container(
                    //     width: 341,
                    //     alignment: Alignment.bottomLeft,
                    //     margin:
                    //     const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                    //     child: TextField(
                    //         keyboardType: TextInputType.text,
                    //         decoration: InputDecoration(
                    //           isCollapsed: true,
                    //           contentPadding:
                    //           EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    //           hintText: '寵物品種',
                    //           hintStyle: TextStyle(
                    //             color: Color(0xFFfd9340),
                    //           ),
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.all(
                    //               Radius.circular(13),
                    //             ),
                    //             borderSide: BorderSide(
                    //               color: Color(0xFFDADADA),
                    //               width: 1,
                    //             ),
                    //           ),
                    //         ))),
                    // Container(
                    //     width: 341,
                    //     alignment: Alignment.bottomLeft,
                    //     margin:
                    //     const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                    //     child: const TextField(
                    //         keyboardType: TextInputType.text,
                    //         decoration: InputDecoration(
                    //           isCollapsed: true,
                    //           contentPadding:
                    //           EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    //           hintText: '飼料熱量(每100克)',
                    //           hintStyle: TextStyle(
                    //             color: Color(0xFFfd9340),
                    //           ),
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.all(
                    //               Radius.circular(13),
                    //             ),
                    //             borderSide: BorderSide(
                    //               color: Color(0xFFDADADA),
                    //               width: 1,
                    //             ),
                    //           ),
                    //         ))),
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
                              hintText: '照顧建議',
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
                                        'type': selectedType,
                                        'birthday':dateFormatter.format(selectedDateTime),
                                        'content': Contentcontroller.text,
                                        'weight': Weightcontroller.text,
                                        'gender': selectedpetGender,
                                        'is_neutered': selectedpetis_neutered,
                                        'activity_level': selectedpetactivity_level,
                                      });
                                      if(await repository.editPet(PetCreateformdata,id)){
                                        showeditsuccess(context,repository,int.parse(id));
                                      }
                                      else{
                                        print("object");
                                      }
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

Future<void> showeditsuccess(BuildContext context,PetRepository repository,int id) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return
        AlertDialog(
          title: Text('寵物資訊編輯成功'),
          content: const Text('編輯成功'),
          actions: <Widget>[
            TextButton(
              child: const Text('確認'),
              onPressed: () {
                repository.getPetinfo(id).then((value) =>
                    Navigator.push(
                      context,MaterialPageRoute(
                      builder: (context) => PetInfoPage(),
                      settings: RouteSettings(
                        arguments: value, // 傳值過去PetInfoPage
                      ),
                    ),
                    ),
                );
              },
            ),
          ],
        );
    },
  );
}