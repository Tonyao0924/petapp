import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/Page/petInfo/petInfoPage.dart';

class PetList_dog extends StatefulWidget{
  @override
  _PetList_dog createState() => _PetList_dog();
}

class _PetList_dog extends State<PetList_dog>{
  final TextEditingController _controller = TextEditingController();
  String _query = "";
  //要改成抓API:(
  List<String> nameList = [
    'Liam',
    'Olivia',
    'Noah',
    'Emma',
    'Oliver',
    'Charlotte',
    'Elijah',
    'Amelia',
    'James',
    'Ava',
    'William',
    'Sophia',
    'Benjamin',
    'Isabella',
    'Lucas',
    'Mia',
    'Henry',
    'Evelyn',
    'Theodore',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '狗',
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: nameList
                  .where((element) => _query == "" || filter(element))
                  .length,
              itemBuilder: (BuildContext context, int index) {
                final filteredList = nameList
                    .where((element) => _query == "" || filter(element))
                    .toList();

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/peta.png'),
                  ),
                  title: Text(filteredList[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PetInfoPage(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    ),
    );

  }_PetList_dog() {
    _controller.addListener(() {
      setState(() {
        _query = _controller.text;
      });
    });
  }

  bool filter(element) {
    final nameMatched = element.toUpperCase().contains(_query.toUpperCase());
    return nameMatched;
  }


}
