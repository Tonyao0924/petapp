import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetOverview extends StatefulWidget {
  @override
  _PetOverview createState() => _PetOverview();
}

class _PetOverview extends State<PetOverview> {
  final TextEditingController findController = TextEditingController();

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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Center(
                          child: TextField(
                            controller: findController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(),
                              hintText: 'Search Name',
                            ),
                          ),
                        ),
                      ),
                      ...List.generate(
                        OverViewNavs.length,
                            (index) => Center(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 25, top: 30, right: 25, bottom: 0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero, // 去除內部填充
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(15.0), // 設置圓角
                                ),
                                elevation: 0,
                                backgroundColor: Colors.transparent, // 設置背景為透明
                              ),
                              child: Ink.image(
                                image: AssetImage(
                                    OverViewNavs[index].src), // 按鈕背景圖片
                                fit: BoxFit.cover, // 圖片填充方式
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      OverViewNavs[index].route
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
                      ),
                    ],
                  );
                })));
  }
}
class OverViewAsset {
  final String src;
  final Route route;

  OverViewAsset(this.src,
      {required this.route});
}

List<OverViewAsset> OverViewNavs = [
  OverViewAsset("assets/images/dog_type.png",
      route: MaterialPageRoute(builder: (context) => PetOverview())),
  OverViewAsset("assets/images/cat_type.png",
      route: MaterialPageRoute(builder: (context) => PetOverview())),
  OverViewAsset("assets/images/mouse_type.png",
      route: MaterialPageRoute(builder: (context) => PetOverview())),
  OverViewAsset("assets/images/other_type.png",
      route: MaterialPageRoute(builder: (context) => PetOverview())),
];
