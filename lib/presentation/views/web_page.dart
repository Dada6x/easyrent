import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(
          'https://stripe.com/en-nl?utm_campaign=EMEA_NL_en_Google_Search_Brand_Stripe_EXA-20981195258&utm_medium=cpc&utm_source=google&ad_content=689219303694&utm_term=stripe&utm_matchtype=e&utm_adposition=&utm_device=c&gad_source=1&gad_campaignid=20981195258&gclid=CjwKCAjwravBBhBjEiwAIr30VAWiHFuTgDz6EvSSXwEwnNftWNMUj-9AtaPKHL6U6XiMsQa3VIAj3BoCIrAQAvD_BwE '));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment  ')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
