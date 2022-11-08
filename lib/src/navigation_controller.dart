import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationControls extends StatelessWidget {
  const NavigationControls({required this.controller, super.key});

  final Completer<WebViewController> controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: controller.future,
      builder: (context, snapshot) {
        final WebViewController? controller = snapshot.data;
        if (snapshot.connectionState != ConnectionState.done ||
            controller == null) {
          return Row(
            children: const <Widget>[
              Icon(Icons.arrow_back_ios),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.arrow_forward_ios),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.replay),
              SizedBox(
                width: 20,
              ),
            ],
          );
        }

        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () async {
                if (await controller.canGoBack()) {
                  await controller.goBack();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No back history item')),
                  );
                  return;
                }
              },
            ),
            SizedBox(
              width: 15,
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () async {
                if (await controller.canGoForward()) {
                  await controller.goForward();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No forward history item')),
                  );
                  return;
                }
              },
            ),
            SizedBox(
              width: 15,
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: () {
                controller.reload();
              },
            ),
            SizedBox(
              width: 20,
            ),
          ],
        );
      },
    );
  }
}
