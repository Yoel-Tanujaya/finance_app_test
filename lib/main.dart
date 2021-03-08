import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:finance_app_test/decor.dart';
import 'package:finance_app_test/password.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'IDX Finance',
      theme: ThemeData(
        fontFamily: 'Regular',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RegExp _emailPattern = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  TextEditingController _controller = TextEditingController();

  String _email='';
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, backgroundColor: AppColor.primary, elevation: 0,),
      body: Container(
        color: Colors.white,
          child: Stack(
            children: [
              ClipPath(
                clipper: CustomShapeClass(),
                child: Container(
                  height: 225,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColor.primary1Comp, AppColor.primary],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(24, 40, 24, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                          text: 'Welcome to',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          children: [
                            TextSpan(
                              text: '\nIDX ',
                              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Bold'),
                            ),
                            TextSpan(
                              text: 'Finance\n\n',
                              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Bold'),
                            ),
                            TextSpan(
                              text: 'Your One-stop Financial Solutions. Manage, track, and grow your accounts with just a tap.',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ]
                      ),
                    ),
                    Container(
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                          border: _isValid ? Border.all(color: Colors.grey, width: 0.5, style: BorderStyle.solid) : Border.all(color: Colors.red, width: 0.5, style: BorderStyle.solid)
                      ),
                      margin: EdgeInsets.fromLTRB(0, 56, 0, 4),
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: Icon(Icons.mail, color: Colors.grey,),
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: 'Email Address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            _isValid = true;
                            _email = value;
                          });
                        },
                      ),
                    ),
                    _isValid ? Container() : Text('Empty Email Address or it is Invalid', style: TextStyle(color: Colors.red, fontSize: 12),)
                  ],
                )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  height: 48,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.primary1Comp.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(2, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: RaisedButton(
                    onPressed: (){
                      setState(() {
                        if (_email.isNotEmpty && _emailPattern.hasMatch(_email)) Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordPage()));
                        else _isValid = false;
                      });
                    },
                    color: AppColor.primary1Comp,
                    child: Text('Register', style: TextStyle(fontFamily: 'Medium', color: Colors.white, fontSize: 18),),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
