import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:finance_app_test/decor.dart';

class PasswordPage extends StatefulWidget {
  PasswordPage({Key key}) : super(key: key);

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  var _bgColorInactive = Colors.white;
  var _textStyleInactive = TextStyle(color: AppColor.primary1Comp, fontSize: 20, fontFamily: 'Medium');

  var _bgColorActive = AppColor.primary;
  var _textStyleActive = TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Medium');

  PageController _controller;
  int _selectedPage = 1;

  bool _isObscure;
  Icon _visibleIcon;

  TextEditingController textController = TextEditingController();

  bool numberChar = false;
  bool specialChar = false;
  bool lowerCaseChar = false;
  bool upperCaseChar = false;
  bool lengthChar = false;

  String pass='';

  int passStrength = 0; //range: 0 very weak 1 weak 2 adequeate 3 strong 4 very strong

  @override
  void initState() {
    _isObscure = true;
    _visibleIcon = Icon(
      Icons.visibility,
    );

    textController.addListener(() {
      setState(() {
        lengthChar = textController.text.length > 9;
        numberChar = textController.text.contains(RegExp(r'\d'), 0);
        lowerCaseChar = textController.text.contains(new RegExp(r'[a-z]'), 0);
        upperCaseChar = textController.text.contains(new RegExp(r'[A-Z]'), 0);
        specialChar = textController.text.isNotEmpty &&
            !textController.text.contains(RegExp(r'^[\w&.-]+$'), 0);
      });
    });
  }

  int passwordStrength(String password) {
    int strengthMeter;
    if (password.isEmpty || password=='') strengthMeter = -1;
    else if (RegExp(r'^[a-z]*$').hasMatch(password)) {
      strengthMeter = 1;
    } else if (RegExp(r'^[a-z0-9]*$').hasMatch(password)) {
      strengthMeter = 2;
    } else if (RegExp(r'^[a-zA-Z]*$').hasMatch(password)) {
      strengthMeter = 2;
    } else if (RegExp(r'^[a-z\-_!?]*$').hasMatch(password)) {
      strengthMeter = 3;
    } else if (RegExp(r'^[a-zA-Z0-9]*$').hasMatch(password)) {
      strengthMeter = 4;
    } else {
      strengthMeter = 5;
    }

    return strengthMeter;
  }

  Widget passwordStrengthText(int strength) {
    switch(strength) {
      case 0: return Text('Very Weak', style: TextStyle(color: Colors.redAccent, fontSize: 14, fontFamily: 'Medium'));
      break;
      case 1: return Text('Weak', style: TextStyle(color: Colors.orangeAccent, fontSize: 14, fontFamily: 'Medium'));
      break;
      case 2: return Text('Adequate', style: TextStyle(color: Colors.yellow, fontSize: 14, fontFamily: 'Medium'));
      break;
      case 3: return Text('Strong', style: TextStyle(color: Colors.green, fontSize: 14, fontFamily: 'Medium'));
      break;
      case 4: return Text('Strong', style: TextStyle(color: Colors.greenAccent, fontSize: 14, fontFamily: 'Medium'));
      break;
      case 5: return Text('Very Strong', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Medium'));
      break;
      default: return Text('', style: TextStyle(color: Colors.red, fontSize: 14, fontFamily: 'Medium'));
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary1Comp,
        elevation: 0,
      ),
      body: Container(
          decoration: BoxDecoration(
            color: AppColor.primary1Comp
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 0, 24, 24),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Text('1', style: _selectedPage == 1 ? _textStyleActive : _textStyleInactive),
                            backgroundColor: _selectedPage == 1 ? _bgColorActive : _bgColorInactive,
                            radius: 24,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Divider(
                                color: Colors.white,
                                thickness: 0.5,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            child: Text('2', style: _selectedPage == 2 ? _textStyleActive : _textStyleInactive),
                            backgroundColor: _selectedPage == 2 ? _bgColorActive : _bgColorInactive,
                            radius: 24,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Divider(
                                color: Colors.white,
                                thickness: 0.5,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            child: Text('3', style: _selectedPage == 3 ? _textStyleActive : _textStyleInactive),
                            backgroundColor: _selectedPage == 3 ? _bgColorActive : _bgColorInactive,
                            radius: 24,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Divider(
                                color: Colors.white,
                                thickness: 0.5,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            child: Text('4', style: _selectedPage == 4 ? _textStyleActive : _textStyleInactive),
                            backgroundColor: _selectedPage == 4 ? _bgColorActive : _bgColorInactive,
                            radius: 24,
                          ),
                        ],
                    )
                  ),
                  Expanded(
                    child: PageView(
                      children: [
                        _buildPagePassword(),
                        Container(color: Colors.red,)
                      ],
                      controller: _controller,
                      onPageChanged: (index) {
                        setState(() {
                          _selectedPage = index;
                        });
                      },
                      physics: NeverScrollableScrollPhysics(),
                      pageSnapping: true,
                    ),
                  )
                ],
              ),
            ],
          )
      ),
    );
  }

  Widget _buildPagePassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Create Password', style: TextStyle(color: Colors.white, fontFamily: 'Medium', fontSize: 18),),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 4, 0, 20),
            child: Text('Password will be used to login to your account', style: TextStyle(color: Colors.white, fontFamily: 'Regular', fontSize: 14),),
          ),
          Container(
            height: 48,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey, width: 0.5, style: BorderStyle.solid)
            ),
            child: TextField(
              controller: textController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: _isObscure,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(Icons.lock_rounded, color: Colors.grey,),
                suffixIcon: GestureDetector(
                  child: _visibleIcon,
                  onTap: (){
                    setState(() {
                      _isObscure = !_isObscure;
                      _isObscure ? _visibleIcon = Icon(Icons.visibility,) : _visibleIcon = Icon(Icons.visibility_off,);
                    });
                  },
                ),
                hintText: 'Password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none
                ),
              ),
              onChanged: (String value) {
                setState(() {
                  pass = value;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(right: 4), child: Text('Password Strength:', style: TextStyle(color: Colors.white, fontFamily: 'Medium', fontSize: 14),),),
                passwordStrengthText(passwordStrength(pass))
              ],
            )
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 48, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        lowerCaseChar ? CircleAvatar(
                          child: Icon(Icons.check, color: Colors.black,),
                          backgroundColor: Colors.greenAccent,
                          radius: 20,
                        ) : CircleAvatar(
                          child: Text('ab', style: TextStyle(color: Colors.white, fontSize: 28)),
                          backgroundColor: Colors.transparent,
                          radius: 20,
                        ),
                        Padding(padding: EdgeInsets.only(top: 8), child: Text('Lowercase', style: TextStyle(color: Colors.white, fontSize: 12),),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        upperCaseChar ? CircleAvatar(
                          child: Icon(Icons.check, color: Colors.black,),
                          backgroundColor: Colors.greenAccent,
                          radius: 20,
                        ) : CircleAvatar(
                          child: Text('Aa', style: TextStyle(color: Colors.white, fontSize: 28)),
                          backgroundColor: Colors.transparent,
                          radius: 20,
                        ),
                        Padding(padding: EdgeInsets.only(top: 8), child: Text('Uppercase', style: TextStyle(color: Colors.white, fontSize: 12),),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        numberChar ? CircleAvatar(
                          child: Icon(Icons.check, color: Colors.black,),
                          backgroundColor: Colors.greenAccent,
                          radius: 20,
                        ) : CircleAvatar(
                          child: Text('12', style: TextStyle(color: Colors.white, fontSize: 28)),
                          backgroundColor: Colors.transparent,
                          radius: 20,
                        ),
                        Padding(padding: EdgeInsets.only(top: 8), child: Text('Numbers', style: TextStyle(color: Colors.white, fontSize: 12),),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        specialChar ? CircleAvatar(
                          child: Icon(Icons.check, color: Colors.black,),
                          backgroundColor: Colors.greenAccent,
                          radius: 20,
                        ) : CircleAvatar(
                          child: Text('!?', style: TextStyle(color: Colors.white, fontSize: 28)),
                          backgroundColor: Colors.transparent,
                          radius: 20,
                        ),
                        Padding(padding: EdgeInsets.only(top: 8), child: Text('Special', style: TextStyle(color: Colors.white, fontSize: 12),),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        lengthChar ? CircleAvatar(
                          child: Icon(Icons.check, color: Colors.black,),
                          backgroundColor: Colors.greenAccent,
                          radius: 20,
                        ) : CircleAvatar(
                          child: Text('9+', style: TextStyle(color: Colors.white, fontSize: 28)),
                          backgroundColor: Colors.transparent,
                          radius: 20,
                        ),
                        Padding(padding: EdgeInsets.only(top: 8), child: Text('Length', style: TextStyle(color: Colors.white, fontSize: 12),),)
                      ],
                    ),
                  ),
                ],
              )
          ),
          Expanded(child: Container(),),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 24),
            height: 48,
            child: FlatButton(
              onPressed: (){},
              color: Colors.white.withOpacity(0.25),
              child: Text('Next', style: TextStyle(fontFamily: 'Medium', color: Colors.white, fontSize: 18),),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }


}
