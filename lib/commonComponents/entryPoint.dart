import 'package:flutter/material.dart';
import 'package:petapp/Page/Home.dart';
import 'package:petapp/Page/login/loginPage.dart';
import 'package:petapp/Page/profile/profilePage.dart';
import 'package:petapp/commonComponents/constants.dart';
import 'package:petapp/utils/riveUtils.dart';
import 'package:rive/rive.dart';

import '../Page/chatroom/chatroom.dart';
import '../Page/kibanatutorial/kibanaTutorial.dart';
import '../Page/petInfo/petInfoPage.dart';
import '../Page/petoverview/petOverview.dart';
import '../web.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  int tmp = 0;
  int _page = 0;

  final screen = [
    HomePage(),
    ChatRoom(),
    KibanaTutorial(),
    KibanaWeb(),
    ProfilePage(),
  ];

  void _onItemClick(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _page,
        children: screen,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/home/chartbg.png'), fit: BoxFit.cover),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage((_page == 0
                    ? "assets/Icons/home_1.png"
                    : "assets/Icons/home.png")),
                size: 30,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage((_page == 1
                    ? "assets/Icons/chat_1.png"
                    : "assets/Icons/chat.png")),
                size: 30,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage((_page == 2
                    ? "assets/Icons/internet_1.png"
                    : "assets/Icons/internet.png")),
                size: 30,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage((_page == 3
                    ? "assets/Icons/book_1.png"
                    : "assets/Icons/book.png")),
                size: 30,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage((_page == 4
                    ? "assets/Icons/user_1.png"
                    : "assets/Icons/user.png")),
                size: 30,
                color: Colors.black,
              ),
              label: '',
            ),
          ],
          currentIndex: _page, //目前選擇頁索引值
          fixedColor: Colors.amber, //選擇頁顏色
          onTap: _onItemClick, //BottomNavigationBar 按下處理事件
        ),
      ),
    );
  }
//   RiveAsset selectedBottomNav = bottomNavs.first;
//
//   int selectedPageIndex = 0;
//
//   Widget getSelectedPage() {
//     if (selectedPageIndex == 0) {
//       return HomePage();
//     } else if (selectedPageIndex == 1) {
//       return ChatRoom();
//     } else if (selectedPageIndex == 2) {
//       return KibanaTutorial();
//     } else if (selectedPageIndex == 3) {
//       return KibanaWeb();
//     } else if (selectedPageIndex == 4) {
//       return ProfilePage();
//     }
//     // 添加其他页面的逻辑
//     return LoginPage(); // 默认返回一个空容器
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       body: getSelectedPage(),
//       // body: HomePage(),
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.all(12),
//         margin: EdgeInsets.symmetric(horizontal: 24),
//         decoration: BoxDecoration(
//           color: ThemeConfig.backgroundColor2,
//           borderRadius: BorderRadius.all(
//             Radius.circular(24),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween, //分散
//           children: [
//             ...List.generate(
//               bottomNavs.length,
//               (index) => GestureDetector(
//                 onTap: () {
//                   bottomNavs[index].input!.change(true);
//                   if (bottomNavs[index] != selectedBottomNav) {
//                     setState(() {
//                       selectedBottomNav = bottomNavs[index];
//                       selectedPageIndex = index; // 更新选定的页面索引
//                       print(1111111111);
//                       print(selectedPageIndex);
//                     });
//                   }
//                   Future.delayed(Duration(seconds: 1), () {
//                     bottomNavs[index].input!.change(false);
//                   });
//                 },
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     AnimatedContainer(
//                       duration: const Duration(milliseconds: 100),
//                       margin: const EdgeInsets.only(bottom: 2),
//                       height: 4,
//                       width: bottomNavs[index] == selectedBottomNav ? 20 : 0,
//                       decoration: const BoxDecoration(
//                           color: Color(0xFF81B4FF),
//                           borderRadius: BorderRadius.all(Radius.circular(12))),
//                     ),
//                     SizedBox(
//                       height: 36,
//                       width: 36,
//                       child: Opacity(
//                           opacity:
//                               bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
//                           child: (index == 2 || index == 3
//                               ? Image.asset('assets/Icons/profile_img.png')
//                               : RiveAnimation.asset(
//                                   bottomNavs.first.src,
//                                   artboard: bottomNavs[index].artboard,
//                                   onInit: (artboard) {
//                                     RiveAsset currentNav = bottomNavs[index];
//                                     StateMachineController controller =
//                                         RiveUtils.getRiveController(artboard,
//                                             StateMachineName: bottomNavs[index]
//                                                 .stateMachineName);
//                                     bottomNavs[index].input =
//                                         controller.findSMI("active") as SMIBool;
//                                   },
//                                 ))),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class RiveAsset {
//   final String artboard, stateMachineName, title, src;
//   late SMIBool? input;
//
//   RiveAsset(this.src,
//       {required this.artboard,
//       required this.stateMachineName,
//       required this.title,
//       this.input});
//   set setInput(SMIBool status) {
//     input = status;
//   }
}

// List<RiveAsset> bottomNavs = [
//   RiveAsset("assets/RiveAssets/icons.riv",
//       artboard: "HOME", stateMachineName: "HOME_interactivity", title: "Home"),
//   RiveAsset("assets/RiveAssets/icons.riv",
//       artboard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Chat"),
//   RiveAsset("assets/RiveAssets/Teach.riv",
//       artboard: "New Artboard",
//       stateMachineName: "BELL_Interactivity",
//       title: "Notifications"),
//   RiveAsset("assets/RiveAssets/icons.riv",
//       artboard: "SETTINGS",
//       stateMachineName: "SETTINGS_Interactivity",
//       title: "Settings"),
//   RiveAsset("assets/RiveAssets/icons.riv",
//       artboard: "USER",
//       stateMachineName: "USER_Interactivity",
//       title: "Profile"),
// ];
