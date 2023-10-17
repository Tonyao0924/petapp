

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Api/chatGPTAPI.dart';
import 'RightMessage.dart';
import 'LeftMessage.dart';
class ChatRoom extends StatefulWidget{
  @override
  _ChatRoom createState() => _ChatRoom();
}
class _ChatRoom extends State<ChatRoom>{
  // ScrollController scroller = ScrollController();
  final TextEditingController userentertext = TextEditingController();
  final List<Map<String, dynamic>>newData = [];
  @override
  Widget build(BuildContext csontext) {
    final UniqueKey centerKey = UniqueKey();
    ScrollController scroller = ScrollController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '照顧建議',
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
      Column(
          children: <Widget>[
            Expanded(child:
            CustomScrollView(
              controller: scroller,
              reverse: true,
              center: centerKey,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      var item = newData[index];
                      if (item['role'] == "user"){
                        print(item);
                        return Container(
                          child: RightMessage(item['message']),);
                      }
                      else{
                        print(item);
                        return Container(
                          child: LeftMessage(item['message']));
                      }
                    },
                    childCount: newData.length,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.zero,
                  key: centerKey,
                ),
              ],
            ),
            ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 0, top: 0, right: 0, bottom: 0),
                  child: SizedBox(
                    width: 250,
                    child: TextField(
                        keyboardType: TextInputType.text,
                        controller: userentertext,
                        decoration: InputDecoration(
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
                        )
                    ),),
                ),
                Center(
                  child:
                  Container(
                    alignment: Alignment.center,
                    child:
                    TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(18.76)))),
                      onPressed: () async {
                        print("send");
                        newData.add({'role':'user','message':userentertext.text});
                        final data =await getChatGPTResponse(userentertext.text);
                        setState(() {
                          newData.add({'role':'system','message':data});
                        });
                        print(newData);
                        userentertext.clear();
                      },
                      child: Text(
                        '發送訊息',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
          ],
        ),
    );
  }
}

class Message {
  final String role;
  final String message;

  Message(this.role,this.message);

  Message.fromJson(Map<String, dynamic> json)
      : role = json['role'],
        message = json['message'];

  Map<String, dynamic> toJson() => {
    'role': role,
    'message': message,
  };
}
