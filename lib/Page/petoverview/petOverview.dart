import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetOverview extends StatefulWidget {
  @override
  _PetOverview createState() => _PetOverview();
}

class _PetOverview extends State<PetOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '寵物總覽',
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
        body: Scrollbar(
            thumbVisibility: true,
            child: ListView.builder(
                primary: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 25 , top: 30, right: 25, bottom: 0),
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero, // 去除內部填充
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0), // 設置圓角
                              ),
                              elevation: 0,
                              backgroundColor: Colors.transparent, // 設置背景為透明
                            ),
                            child: Ink.image(
                              image: AssetImage(
                                  'assets/images/dog_type.png'), // 按鈕背景圖片
                              fit: BoxFit.cover, // 圖片填充方式
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PetOverview()),
                                  );
                                  // 按鈕點擊事件處理
                                },
                                child: Container(
                                  width: 310, // 按鈕寬度
                                  height: 180, // 按鈕高度
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 25 , top: 30, right: 25, bottom: 0),
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero, // 去除內部填充
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0), // 設置圓角
                              ),
                              elevation: 0,
                              backgroundColor: Colors.transparent, // 設置背景為透明
                            ),
                            child: Ink.image(
                              image: AssetImage(
                                  'assets/images/cat_type.png'), // 按鈕背景圖片
                              fit: BoxFit.cover, // 圖片填充方式
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PetOverview()),
                                  );
                                  // 按鈕點擊事件處理
                                },
                                child: Container(
                                  width: 310, // 按鈕寬度
                                  height: 180, // 按鈕高度
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 25 , top: 30, right: 25, bottom: 0),
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero, // 去除內部填充
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0), // 設置圓角
                              ),
                              elevation: 0,
                              backgroundColor: Colors.transparent, // 設置背景為透明
                            ),
                            child: Ink.image(
                              image: AssetImage(
                                  'assets/images/mouse_type.png'), // 按鈕背景圖片
                              fit: BoxFit.cover, // 圖片填充方式
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PetOverview()),
                                  );
                                  // 按鈕點擊事件處理
                                },
                                child: Container(
                                  width: 310, // 按鈕寬度
                                  height: 180, // 按鈕高度
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 25 , top: 30, right: 25, bottom: 0),
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero, // 去除內部填充
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0), // 設置圓角
                              ),
                              elevation: 0,
                              backgroundColor: Colors.transparent, // 設置背景為透明
                            ),
                            child: Ink.image(
                              image: AssetImage(
                                  'assets/images/other_type.png'), // 按鈕背景圖片
                              fit: BoxFit.cover, // 圖片填充方式
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PetOverview()),
                                  );
                                  // 按鈕點擊事件處理
                                },
                                child: Container(
                                  width: 310, // 按鈕寬度
                                  height: 180, // 按鈕高度
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                })));
  }
}
