import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:petapp/Page/login/loginPage.dart';

import '../Page/petInfo/petInfoPage.dart';
import '../Page/petInsert/pet_api.dart';

class DynamicLinkHandler {
  late BuildContext context;
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  DynamicLinkHandler(BuildContext context){
    this.context = context;
  }
  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      final String deepLink = dynamicLinkData.link.toString(); // Get DEEP LINK
      final String path = dynamicLinkData.link.path; // Get PATH
      if(deepLink.isEmpty)  return;
      handleDeepLink(path,context);
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
    initUniLinks();
  }
  Future<void> initUniLinks() async {
    try {
      final initialLink = await dynamicLinks.getInitialLink();
      if(initialLink == null)  return;
      handleDeepLink(initialLink.link.path,context);
    } catch (e) {
      // Error
    }
  }
  void handleDeepLink(String path,BuildContext context) {
    PetRepository repository = PetRepository();
    repository.getPetinfo(1).then((value) =>
        Navigator.push(
          context,MaterialPageRoute(
          builder: (context) => PetInfoPage(),
          settings: RouteSettings(
            arguments: value, // 傳值過去PetInfoPage
          ),
        ),
        ),
    );
    print(path);
  }
}
