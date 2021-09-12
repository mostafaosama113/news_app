import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String link;
  final String title;
  WebViewScreen(this.link, this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        titleSpacing: .5,
      ),
      body: WebView(
        initialUrl: link,
      ),
    );
  }
}
