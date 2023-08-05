
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/Page/petInfo/petInfoPage.dart';

import '../petInsert/pet_api.dart';

class PetList extends StatefulWidget{
  @override
  _PetList createState() => _PetList();
}

class _PetList extends State<PetList>{
  PetRepository repository = PetRepository();
  final TextEditingController _controller = TextEditingController();
  String _query = "";
  //要改成抓API:(
  @override
  Widget build(BuildContext context) {
    final PetList = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            PetList[0]['type']['typename'],
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
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                hintText: '搜尋寵物名稱',
              ),
            ),
          ),
        ),
        Expanded(
          child:
          ListView.builder(
              primary: true,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    ...List.generate(
                    PetList.length,
                (index) => ListTile(
                            leading: CircleAvatar(
                              backgroundImage: PetList[index]['image'] != null
                                  ? NetworkImage("http://140.125.207.230:8000"+PetList[index]['image'])
                                  : null,
                            ),
                            title: Text(PetList[index]['name']),
                            subtitle:Text(PetList[index]['type']['typename']),// 應該要新增一個寵物的品種，類似柴犬、八哥犬等 (目前後端沒有這個key)
                            onTap: () {
                              print("PetList[index]['id']");
                              print(PetList[index]['id']);
                              repository.getPetinfo(PetList[index]['id']).then((value) =>
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
                          ))
                  ],
                );
              })
        ),
        // Expanded(
        //   child: Padding(
        //     padding: const EdgeInsets.all(20),
        //     child: ListView.builder(
        //       itemCount: nameList
        //           .where((element) => _query == "" || filter(element))
        //           .length,
        //       itemBuilder: (BuildContext context, int index) {
        //         final filteredList = nameList
        //             .where((element) => _query == "" || filter(element))
        //             .toList();
        //         return ListTile(
        //           leading: CircleAvatar(
        //             backgroundImage: AssetImage('assets/images/peta.png'),
        //           ),
        //           title: Text(filteredList[index]),
        //           onTap: () {
        //             Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (context) => PetInfoPage(),
        //               ),
        //             );
        //           },
        //         );
        //       },
        //     ),
        //   ),
        // ),
      ],
    ),
    );

  }

  bool filter(element) {
    final nameMatched = element.toUpperCase().contains(_query.toUpperCase());
    return nameMatched;
  }


}
