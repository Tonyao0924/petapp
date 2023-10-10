
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatRoom extends StatefulWidget{
  @override
  _ChatRoom createState() => _ChatRoom();
}

class _ChatRoom extends State<ChatRoom>{
  ScrollController scroller = ScrollController();
  final TextEditingController userentertext = TextEditingController();
  @override
  Widget build(BuildContext csontext) {
    final UniqueKey centerKey = UniqueKey();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("照顧建議"
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
      body: Column(
          children: <Widget>[
            CustomScrollView(
              controller: scroller,
              reverse: true,
              center: centerKey,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      var item = newData[index];
                      if (item.type == "Right")
                        return renderRightItem(item);
                      else
                        return renderLeftItem(item);
                    },
                    childCount: newData.length,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.zero,
                  key: centerKey,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      var item = loadMoreData[index];
                      if (item.type == "Right")
                        return renderRightItem(item);
                      else
                        return renderLeftItem(item);
                    },
                    childCount: loadMoreData.length,
                  ),
                ),
              ],
            ),

            Container(
                margin: const EdgeInsets.only(
                    left: 0, top: 0, right: 0, bottom: 0),
                child: TextField(
                    keyboardType: TextInputType.text,
                    controller: userentertext,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 8, vertical: 15),
                      hintText: '請輸入您要詢問何事？',
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

    );
  }
}
