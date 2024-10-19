import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webview Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyLoadingWidget(),
    );
  }
}

class MyLoadingWidget extends StatelessWidget {
  const MyLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyWebView(
                              loadLocalHtml: true,
                            )));
              },
              child: const Text("Load local html")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyWebView(
                              loadLocalHtml: false,
                            )));
              },
              child: const Text("Load flutter.dev")),
        ],
      ),
    );
  }
}

class MyWebView extends StatefulWidget {
  final bool loadLocalHtml;
  const MyWebView({required this.loadLocalHtml, super.key});

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );

    if (widget.loadLocalHtml) {
      controller.loadHtmlString(getHtmlString());
    } else {
      controller.loadRequest(Uri.parse('https://flutter.dev'));
    }
  }

  String getHtmlString() {
    return '''
    <!DOCTYPE html>
    <html>
    <head>
    <title>Flutter WebView Example</title>
    </head>
    <body>
    <h1>Flutter WebView Example</h1>
    <p>This is a simple example of WebView in Flutter.</p>
    <p>Click <a href="https://flutter.dev">here</a> to visit Flutter website.</p>
    <p>Click <a href="https://www.youtube.com/">here</a> to visit YouTube website.</p>
    </body>
    </html>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Webview Demo')),
      body: WebViewWidget(controller: controller),
    );
  }
}
