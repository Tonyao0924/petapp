import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class KibanaWeb extends StatefulWidget {
  @override
  _KibanaWeb createState() => _KibanaWeb();
}

class _KibanaWeb extends State<KibanaWeb> {
  late final WebViewController controller;
@override
void initState() {
  super.initState();

  controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
      ),
    )
    ..loadRequest(Uri.parse('https://kibana.server-fan9704.eu.org/app/home#/'));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kibana')),
      body: WebViewWidget(controller: controller),
    );
  }
}
