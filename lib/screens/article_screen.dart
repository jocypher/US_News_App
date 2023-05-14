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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black,),
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
        // child: WebViewWidget(
        //     controller: ,
        // ),
      ),
    );
  }
}
