// ignore: import_of_legacy_library_into_null_safe
// Import for Android features.

// Import for iOS features.
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';

class ArticleScreen extends StatefulWidget {
  final String blogurl;
  const ArticleScreen({super.key, required this.blogurl});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  late WebViewController controller;

@override
  void initState() {
    super.initState();
      controller = WebViewController();
    controller..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith(widget.blogurl)) {
            return NavigationDecision.navigate;
          }
          return NavigationDecision.prevent;
        },
      ),
    )
    ..loadRequest(Uri.parse(widget.blogurl));
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
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
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
