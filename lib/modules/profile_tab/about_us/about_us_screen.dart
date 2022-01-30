import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About us'),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://www.google.com',
            javascriptMode: JavascriptMode.unrestricted,
            onProgress: (loadProgress) {
              setState(() {
                progress = loadProgress;
              });
            },
          ),
          progress < 100
              ? Center(
                  child: CircularProgressIndicator(
                    value: progress / 100,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
