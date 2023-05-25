import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:petapp/Page/petInfo/petInfoPage.dart';

import 'package:petapp/Page/petInsert/petInsertPage.dart';

import 'login/loginPage.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List _imageUrls = [
    "assets/images/swiper1.png",
    "assets/images/swiper2.png",
    "assets/images/swiper3.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scrollbar(
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
                  child: Center(
                    child: Image.asset('assets/images/hometitle.png'),
                  ),
                  width: 341,
                ),
                Row(
                  children: <Widget>[
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 40, top: 30, right: 0, bottom: 0),
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero, // 去除內部填充
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0), // 設置圓角
                            ),
                            backgroundColor: Colors.transparent, // 設置背景為透明
                          ),
                          child: Ink.image(
                            image: AssetImage(
                                'assets/images/addpet.png'), // 按鈕背景圖片
                            fit: BoxFit.cover, // 圖片填充方式
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PetInsertpage()),
                                );
                                // 按鈕點擊事件處理
                              },
                              child: Container(
                                width: 156, // 按鈕寬度
                                height: 156, // 按鈕高度
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 20, top: 30, right: 0, bottom: 0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => PetInfoPage()));
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero, // 去除內部填充
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0), // 設置圓角
                            ),
                            backgroundColor: Colors.transparent, // 設置背景為透明
                          ),
                          child: Ink.image(
                            image: AssetImage(
                                'assets/images/petoverview.png'), // 按鈕背景圖片
                            fit: BoxFit.cover, // 圖片填充方式
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PetInfoPage()),
                                );
                                // 按鈕點擊事件處理
                              },
                              child: Container(
                                width: 156, // 按鈕寬度
                                height: 156, // 按鈕高度
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: 300,
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(
                        left: 0, top: 25, right: 0, bottom: 0),
                    child: Center(
                        child: Text(
                      '為您推薦',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
                  ),
                ),
                Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: Row(
                          children: <Widget>[
                            Container(
                              width: 120,
                              height: 200,
                              margin: EdgeInsets.only(
                                  left: 0, top: 30, right: 0, bottom: 0),
                              child: ElevatedButton(
                                onPressed: () {
                                  // 按鈕點擊事件處理
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  backgroundColor: Colors.white,
                                  elevation: 8,
                                ),
                                child: Column(children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 0, top: 15, right: 0, bottom: 0),
                                    child:
                                        Image.asset('assets/images/peta.png'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 0, top: 10, right: 0, bottom: 0),
                                    child: Center(
                                        child: Text(
                                      '西八',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 0, top: 5, right: 0, bottom: 0),
                                    child: Center(
                                        child: Text(
                                      '巴哥犬',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    )),
                                  ),
                                ]),
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 200,
                              margin: EdgeInsets.only(
                                  left: 40, top: 30, right: 0, bottom: 0),
                              child: ElevatedButton(
                                onPressed: () {
                                  // 按鈕點擊事件處理
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  backgroundColor: Colors.white,
                                  elevation: 8,
                                ),
                                child: Column(children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 0, top: 15, right: 0, bottom: 0),
                                    child:
                                        Image.asset('assets/images/petb.png'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 0, top: 10, right: 0, bottom: 0),
                                    child: Center(
                                        child: Text(
                                      '寇里',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 0, top: 5, right: 0, bottom: 0),
                                    child: Center(
                                        child: Text(
                                      '緬因貓',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    )),
                                  ),
                                ]),
                              ),
                            ),
                          ],
                        )),
                      ]),
                ),

                Center(
                  child: Container(
                    width: 300,
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(
                        left: 0, top: 25, right: 0, bottom: 0),
                    child: Center(
                        child: Text(
                          '新進寵物',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )),
                  ),
                ),

                Center(
                  child: Container(
                    width: 300,
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(
                        left: 0, top: 25, right: 0, bottom: 20),
                    child:  Center(
                        child: Container(
                          width: 260,
                          height: 232,
                          child: Swiper(
                              itemCount: _imageUrls.length,
                            autoplay: false,
                            itemBuilder: (BuildContext context, int index){
                                  return Image.asset(
                                    _imageUrls[index],
                                    fit: BoxFit.fill,
                                  );
                            },
                            scrollDirection: Axis.horizontal,
                            control: new SwiperControl(),
                          ),
                        )
                    ),
                  ),
                ),
              ],
            );
          }),
    ));
  }
}

