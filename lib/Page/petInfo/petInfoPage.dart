import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/Page/petlist/petList.dart';
import 'package:petapp/Page/petoverview/petOverview.dart';

import '../petEdit/petEditPage.dart';
import '../petInsert/pet_api.dart';

class PetInfoPage extends StatefulWidget {
  @override
  _PetInfoPage createState() => _PetInfoPage();
}

class _PetInfoPage extends State<PetInfoPage> {
  PetRepository repository = PetRepository();
   bool read = true;

  @override
  Widget build(BuildContext context) {

    final Petinfo = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    var gender = "";
    var is_neutered = "";
    if(Petinfo['gender']){
      gender = "男";
    }
    else{
      gender = "女";
    }
    if(Petinfo['is_neutered']){
      is_neutered = "已絕育";
    }
    else{
      is_neutered = "未絕育";
    }
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '寵物資訊',
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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => PetOverview()),
                    (route) => false,
              );
            },
          ),
        ),
        body: Scrollbar(
          thumbVisibility: true,
          child: ListView.builder(
              primary: true,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 0, top: 30, right: 0, bottom: 0),
                      child: Text(
                        '寵物資訊',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      width: 341,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: 30, top: 30, right: 20, bottom: 0),
                          color: Colors.grey,
                          child: Center(
                            child: Image.network(Petinfo['image']),
                          ),
                          width: 330,
                          height: 150,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: 50,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(
                                left: 25, top: 20, right: 0, bottom: 0),
                            child: TextFormField(
                                keyboardType: TextInputType.text,
                                readOnly: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 15),
                                  hintText: '名字',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ))),
                        Container(
                          margin: EdgeInsets.only(
                              left: 5, top: 25, right: 5, bottom: 0),
                          color: Colors.black,
                          width: 3,
                          height: 20,
                        ),
                        Container(
                            width: 200,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(
                                left: 0, top: 20, right: 0, bottom: 0),
                            child: TextFormField(
                                initialValue: Petinfo['name'],
                                readOnly: true,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 15),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                            )
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: 50,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(
                                left: 25, top: 10, right: 0, bottom: 0),
                            child: const TextField(
                                keyboardType: TextInputType.text,
                                readOnly: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 15),
                                  hintText: '種類',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ))),
                        Container(
                          margin: EdgeInsets.only(
                              left: 5, top: 15, right: 5, bottom: 0),
                          color: Colors.black,
                          width: 3,
                          height: 20,
                        ),
                        Container(
                            width: 200,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(
                                left: 0, top: 10, right: 0, bottom: 0),
                            child:
                            FutureBuilder<Map<String, dynamic>>(
                              future: repository.getPettype(Petinfo['type']),
                              builder:(BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  if (snapshot.hasError) {
                                    // 请求失败，显示错误
                                    return Text("Error: ${snapshot.error}");
                                  } else {
                                    // 请求成功，显示数据
                                    return TextFormField(
                                        initialValue: snapshot.data['typename'],
                                        readOnly: true,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          isCollapsed: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 15),
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        )
                                    );
                                  }
                                } else {
                                  // 请求未结束，显示loading
                                  return CircularProgressIndicator();
                                }
                              }
                            ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: 50,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(
                                left: 25, top: 10, right: 0, bottom: 0),
                            child: const TextField(
                                keyboardType: TextInputType.text,
                                readOnly: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 15),
                                  hintText: '生日',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ))),
                        Container(
                          margin: EdgeInsets.only(
                              left: 5, top: 15, right: 5, bottom: 0),
                          color: Colors.black,
                          width: 3,
                          height: 20,
                        ),
                        Container(
                            width: 200,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(
                                left: 0, top: 10, right: 0, bottom: 0),
                            child: TextFormField(
                                initialValue: Petinfo['birthday'],
                                readOnly: true,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 15),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                            )),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: 50,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(
                                left: 25, top: 10, right: 0, bottom: 0),
                            child: const TextField(
                                keyboardType: TextInputType.text,
                                readOnly: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 15),
                                  hintText: '性別',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ))),
                        Container(
                          margin: EdgeInsets.only(
                              left: 5, top: 15, right: 5, bottom: 0),
                          color: Colors.black,
                          width: 3,
                          height: 20,
                        ),
                        Container(
                            width: 200,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(
                                left: 0, top: 10, right: 0, bottom: 0),
                            child: TextFormField(
                                initialValue: gender, //後端需要新增一個性別的key
                                readOnly: true,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 15),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                            )),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: 50,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(
                                left: 25, top: 10, right: 0, bottom: 0),
                            child: const TextField(
                                keyboardType: TextInputType.text,
                                readOnly: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 15),
                                  hintText: '體重',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ))),
                        Container(
                          margin: EdgeInsets.only(
                              left: 5, top: 15, right: 5, bottom: 0),
                          color: Colors.black,
                          width: 3,
                          height: 20,
                        ),
                        Container(
                            width: 200,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(
                                left: 0, top: 10, right: 0, bottom: 0),
                            child: TextFormField(
                                initialValue: Petinfo['weight'], // 後端需要新增一個體重的key
                                readOnly: true,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 15),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                            )),
                      ],
                    ),Row(
                      children: <Widget>[
                        Container(
                            width: 50,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(
                                left: 25, top: 10, right: 0, bottom: 0),
                            child: const TextField(
                                keyboardType: TextInputType.text,
                                readOnly: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 15),
                                  hintText: '活躍',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ))),
                        Container(
                          margin: EdgeInsets.only(
                              left: 5, top: 15, right: 5, bottom: 0),
                          color: Colors.black,
                          width: 3,
                          height: 20,
                        ),
                        Container(
                            width: 200,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(
                                left: 0, top: 10, right: 0, bottom: 0),
                            child: TextFormField(
                                initialValue: Petinfo['activity_level'], // 後端需要新增一個體重的key
                                readOnly: true,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 15),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                            )),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: 50,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(
                                left: 25, top: 10, right: 0, bottom: 0),
                            child: const TextField(
                                keyboardType: TextInputType.text,
                                readOnly: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 15),
                                  hintText: '絕育',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ))),
                        Container(
                          margin: EdgeInsets.only(
                              left: 5, top: 15, right: 5, bottom: 0),
                          color: Colors.black,
                          width: 3,
                          height: 20,
                        ),
                        Container(
                            width: 200,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(
                                left: 0, top: 10, right: 0, bottom: 0),
                            child: TextFormField(
                                initialValue: is_neutered, // 後端需要新增一個絕育的key
                                readOnly: true,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 15),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                            )),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 350,
                          alignment: Alignment.bottomLeft,
                          margin: const EdgeInsets.only(
                              left: 25, top: 10, right: 0, bottom: 0),
                          child: const Text("照顧建議:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                        ),
                        Container(
                            width: 341,
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(
                                left: 0, top: 15, right: 0, bottom: 0),
                            child: TextFormField(
                              initialValue: Petinfo['content'],
                              readOnly: true,
                                keyboardType: TextInputType.multiline,
                                maxLines: 8,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(13),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 10,
                                    ),
                                  ),
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 10),
                                ))),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 0, top: 20, right: 0, bottom: 0),
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
                                      color: Colors.orange,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
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
                                                BorderRadius.circular(
                                                    18.76)))),
                                    onPressed: () {
                                      repository.getPetinfo(Petinfo['id']).then((value) =>
                                          Navigator.push(
                                            context,MaterialPageRoute(
                                            builder: (context) => PetEditPage(),
                                            settings: RouteSettings(
                                              arguments: value, // 傳值過去PetInfoPage
                                            ),
                                          ),
                                          ),
                                      );
                                    },
                                    child: Text(
                                      '編輯資訊',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
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
        ));
  }
}
