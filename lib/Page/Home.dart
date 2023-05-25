import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
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
                    child: Image.asset('assets/images//hometitle.png'),
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
                            // 按鈕點擊事件處理
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
                            // 按鈕點擊事件處理
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
                Row(
                  children: <Widget>[
                    Center(
                      child: Container(
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
                              child: Image.asset('assets/images/peta.png'),
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
                          ]),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 20, top: 30, right: 0, bottom: 0),
                        child: ElevatedButton(
                          onPressed: () {
                            // 按鈕點擊事件處理
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
                        child: const TextField(
                            keyboardType: TextInputType.text,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isCollapsed: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 15),
                              hintText: '女',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ))),
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
                        child: const TextField(
                            keyboardType: TextInputType.text,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isCollapsed: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 15),
                              hintText: '5kg',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ))),
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
                        child: const TextField(
                            keyboardType: TextInputType.text,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isCollapsed: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 15),
                              hintText: '是',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ))),
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
                        child: const TextField(
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
                              hintText:
                                  'Gorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan.',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
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
                                                BorderRadius.circular(18.76)))),
                                onPressed: () {},
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
