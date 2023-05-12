import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';


class ArticleScreen extends StatefulWidget {
  final String blogurl;
  const ArticleScreen({super.key, required this.blogurl});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(
            text: const TextSpan(children: [
          TextSpan(
              text: "Tech",
              style: TextStyle(color: Colors.black, fontSize: 20)),
          TextSpan(
              text: "News", style: TextStyle(fontSize: 20, color: Colors.blue))
        ])),
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.blogurl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
