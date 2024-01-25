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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://zipifly2.vercel.app'));
    return SafeArea(child: Scaffold(
      body: WillPopScope(
        onWillPop: () async{
          var isLastPage = controller.canGoBack();
          if(await isLastPage){
            controller.goBack();
            return false;
          }
          return true;
        },
        child: SafeArea(child: Scaffold(
          body: WebViewWidget(controller: controller),
        )),
      ),
    ));
  }
}

