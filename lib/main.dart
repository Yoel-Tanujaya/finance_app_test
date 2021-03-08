import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light
  ));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IDX Finance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, backgroundColor: Color(0xff12c4f3), elevation: 0,),
      body: Container(
          color: Color(0xff12c4f3),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(24, 48, 24, 32),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                          text: 'Welcome to',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          children: [
                            TextSpan(
                              text: '\nIDX ',
                              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                            TextSpan(
                              text: 'Finance\n\n',
                              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            TextSpan(
                              text: 'Your One-stop Financial Solutions. Manage, track, and grow your accounts with just a tap.',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ]
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.green,
                  width: MediaQuery.of(context).size.width,
                  height: 72,
                ),
              )
            ],
          )
      ),
    );
  }
}
