
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(home: ColabBrowser()));

class ColabBrowser extends StatefulWidget {
  @override
  _ColabBrowserState createState() => _ColabBrowserState();
}

class _ColabBrowserState extends State<ColabBrowser> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")
      ..loadRequest(Uri.parse('https://colab.research.google.com/'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Colab Mobile Pro'), actions: [
        IconButton(icon: Icon(Icons.refresh), onPressed: () => controller.reload()),
      ]),
      body: WebViewWidget(controller: controller),
    );
  }
}
