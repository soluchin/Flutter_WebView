import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'src/navigation_controller.dart';
import 'src/web_view_stack.dart';

void main() {
  runApp(const MaterialApp(
    title: 'WebView Demo',
    debugShowCheckedModeBanner: false,
    home: const webViewApp(),
  ));
}

class webViewApp extends StatefulWidget {
  const webViewApp({super.key});

  @override
  State<webViewApp> createState() => _webViewAppState();
}

class _webViewAppState extends State<webViewApp> {
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
        actions: [
          NavigationControls(controller: controller),
        ],
      ),
      body: WebViewStack(
        controller: controller,
        // ganti link ini
        link: 'github.com/soluchin',
      ),
    );
  }
}
