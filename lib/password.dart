import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:finance_app_test/decor.dart';
import 'package:finance_app_test/main.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class PasswordPage extends StatefulWidget {
  PasswordPage({Key key}) : super(key: key);

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> with SingleTickerProviderStateMixin {
  var _bgColorInactive = Colors.white;
  var _textStyleInactive = TextStyle(color: AppColor.primary1Comp, fontSize: 20, fontFamily: 'Medium');

  var _bgColorActive = AppColor.primary;
  var _textStyleActive = TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Medium');

  PageController _controller = PageController();
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

  bool _passError = false;

  AnimationController _animationController;
  Tween<double> _tween = Tween(begin: 1, end: 0.75);

  String dateText;
  String timeText;

  DateTime selectedDate;
  TimeOfDay selectedTime;

  bool _timeError = false;
  bool _dateError = false;

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

    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 1))..repeat(reverse: true);

    initializeDateFormatting('id_ID');

    dateText = '- Choose Date -';
    timeText = '- Choose Time -';
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
    } else if (RegExp(r'^[a-zA-Z0-9\-_!?]*$').hasMatch(password) && password.length > 9) {
      strengthMeter = 5;
    } else  {
      strengthMeter = 4;
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

  bool _passValid() {
    return lengthChar && lowerCaseChar && upperCaseChar && specialChar && numberChar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary1Comp,
        elevation: 0,
        automaticallyImplyLeading: _selectedPage == 4 ? true : false,
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
                          _selectedPage == 1 ? CircleAvatar(
                            child: Text('1', style: _textStyleActive),
                            backgroundColor: _bgColorActive,
                            radius: 24,
                          ) : _selectedPage > 1 ? CircleAvatar(
                            child: Icon(Icons.check, color: Colors.white,),
                            backgroundColor: _bgColorActive,
                            radius: 24,
                          ) : CircleAvatar(
                            child: Text('1', style: _textStyleInactive),
                            backgroundColor: _bgColorInactive,
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
                          _selectedPage == 2 ? CircleAvatar(
                            child: Text('2', style: _textStyleActive),
                            backgroundColor: _bgColorActive,
                            radius: 24,
                          ) : _selectedPage > 2 ? CircleAvatar(
                            child: Icon(Icons.check, color: Colors.white,),
                            backgroundColor: _bgColorActive,
                            radius: 24,
                          ) : CircleAvatar(
                            child: Text('2', style: _textStyleInactive),
                            backgroundColor: _bgColorInactive,
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
                          _selectedPage == 3 ? CircleAvatar(
                            child: Text('3', style: _textStyleActive),
                            backgroundColor: _bgColorActive,
                            radius: 24,
                          ) : _selectedPage > 3 ? CircleAvatar(
                            child: Icon(Icons.check, color: Colors.white,),
                            backgroundColor: _bgColorActive,
                            radius: 24,
                          ) : CircleAvatar(
                            child: Text('3', style: _textStyleInactive),
                            backgroundColor: _bgColorInactive,
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
                          _selectedPage == 4 ? CircleAvatar(
                            child: Icon(Icons.check, color: Colors.white,),
                            backgroundColor: _bgColorActive,
                            radius: 24,
                          ) : CircleAvatar(
                            child: Icon(Icons.check, color: AppColor.primary1Comp,),
                            backgroundColor: _bgColorInactive,
                            radius: 24,
                          ),
                        ],
                    )
                  ),
                  Expanded(
                    child: PageView(
                      children: [
                        _buildPagePassword(),
                        _buildPersonalInfo(),
                        _buildVerification(),
                        _buildSuccess(),
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
                prefixIcon: Icon(Icons.lock_rounded, color: _passError ? Colors.red : Colors.grey,),
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
                  _passError = false;
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
              onPressed: (){
                setState(() {
                  if (_passValid()) {
                    FocusScope.of(context).unfocus();
                    Timer(Duration(milliseconds: 250), () {
                      _controller.nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease).then((value) {setState(() {_selectedPage = 2;});});
                    });
                  }
                  else _passError = true;
                });
              },
              color: Colors.white.withOpacity(0.25),
              child: Text('Next', style: TextStyle(fontFamily: 'Medium', color: Colors.white, fontSize: 18),),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _goal = ['- Choose Option -','Non-Cash Transaction', 'Savings', 'Credit Card Application', 'E-money'];
  List<String> _income = ['- Choose Option -','1.000.000 - 3.000.000', '3.000.000 - 5.000.000', '5.000.000 - 7.000.000', '7.000.000 - 10.000.000', '> 10.000.000'];
  List<String> _expense = ['- Choose Option -','1.000.000 - 3.000.000', '3.000.000 - 5.000.000', '5.000.000 - 7.000.000', '7.000.000 - 10.000.000', '> 10.000.000'];

  String _selectedGoal='- Choose Option -',_selectedIncome='- Choose Option -',_selectedExpenses='- Choose Option -';

  bool _isPersonalInfoValid() {
    return _selectedGoal!='- Choose Option -' && _selectedIncome!='- Choose Option -' && _selectedExpenses!='- Choose Option -';
  }

  Widget _buildPersonalInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Personal Information', style: TextStyle(color: Colors.white, fontFamily: 'Medium', fontSize: 18),),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 4, 0, 20),
            child: Text('Please fill in the information below and your goal for digital savings', style: TextStyle(color: Colors.white, fontFamily: 'Regular', fontSize: 14),),
          ),
          Text('Goal for Activation', style: TextStyle(color: Colors.white),),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(0, 4, 0, 16),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey, width: 0.5, style: BorderStyle.solid)
            ),
            child: InputDecorator(
                decoration: InputDecoration(
                  hintText: '- Choose Option -',
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    value: _selectedGoal,
                    items: _goal.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (selectedItem) => setState(() => _selectedGoal = selectedItem,
                    ),
                  ),
                )
            ),
          ),
          Text('Monthly Income', style: TextStyle(color: Colors.white),),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(0, 4, 0, 16),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey, width: 0.5, style: BorderStyle.solid)
            ),
            child: InputDecorator(
                decoration: InputDecoration(
                  hintText: '- Choose Option -',
                  border: const OutlineInputBorder(),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: true, // Reduces the dropdowns height by +/- 50%
                    icon: Icon(Icons.keyboard_arrow_down),
                    value: _selectedIncome,
                    items: _income.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (selectedItem) => setState(() => _selectedIncome = selectedItem,
                    ),
                  ),
                )
            ),
          ),
          Text('Monthly Expenses', style: TextStyle(color: Colors.white),),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(0, 4, 0, 16),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey, width: 0.5, style: BorderStyle.solid)
            ),
            child: InputDecorator(
                decoration: InputDecoration(
                  hintText: '- Choose Option -',
                  border: const OutlineInputBorder(),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: true, // Reduces the dropdowns height by +/- 50%
                    icon: Icon(Icons.keyboard_arrow_down),
                    value: _selectedExpenses,
                    items: _expense.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (selectedItem) => setState(() => _selectedExpenses = selectedItem,
                    ),
                  ),
                )
            ),
          ),
          Expanded(child: Container(),),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 24),
            height: 48,
            child: FlatButton(
              onPressed: (){
                setState(() {
                  if (_isPersonalInfoValid()) {
                    _controller.nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease).then((value) {setState(() {_selectedPage = 3;});});
                  }
                });
              },
              color: Colors.white.withOpacity(0.25),
              child: Text('Next', style: TextStyle(fontFamily: 'Medium', color: Colors.white, fontSize: 18),),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2023),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      setState(() {
        dateText = '${DateFormat.EEEE('id_ID').format(pickedDate)}, ${DateFormat.yMMMd('id_ID').format(pickedDate)}';
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
    );
    if (pickedTime != null) {
      selectedTime = pickedTime;
      setState(() {
        timeText = pickedTime.toString().substring(10, 15);
      });
    }
  }

  Widget _buildVerification() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  radius: 32,
                ),
                ScaleTransition(
                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.ease)),
                    child: CircleAvatar(
                      child: Icon(Icons.today_rounded, color: Colors.blue, size: 36,),
                      backgroundColor: Colors.white,
                      radius: 32,
                    )
                ),
              ],
            )
          ),
          Text('Schedule Video Call', style: TextStyle(color: Colors.white, fontFamily: 'Medium', fontSize: 18),),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 20),
            child: Text('Choose the date and time that you preferred, we will send you a link via email to conduct video call at the given time', style: TextStyle(color: Colors.white, fontFamily: 'Regular', fontSize: 14),),
          ),
          Text('Date', style: TextStyle(color: Colors.white),),
          InkWell(
            onTap: (){
              setState(() {
                _dateError = false;
                _timeError = false;
              });
              _selectDate(context);
            },
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(0, 4, 0, 16),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: _dateError ? Colors.red[100] : Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey, width: 0.5, style: BorderStyle.solid)
              ),
              child: Align(alignment: Alignment.centerLeft, child: Text(dateText, style: TextStyle(fontSize: 16),),)
            ),
          ),
          Text('Time', style: TextStyle(color: Colors.white),),
          InkWell(
            onTap: (){
              setState(() {
                _dateError = false;
                _timeError = false;
              });
              _selectTime(context);
            },
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(0, 4, 0, 16),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: _timeError ? Colors.red[100] : Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey, width: 0.5, style: BorderStyle.solid)
              ),
                child: Align(alignment: Alignment.centerLeft, child: Text(timeText, style: TextStyle(fontSize: 16),),)
            ),
          ),
          Expanded(child: Container(),),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 24),
            height: 48,
            child: FlatButton(
              onPressed: (){
                setState(() {
                  if (selectedTime == null || selectedDate == null) {
                    if (selectedTime == null) _timeError = true;
                    if (selectedDate == null) _dateError = true;
                  } else {
                    _controller.nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease).then((value) {setState(() {_selectedPage = 4;});});
                  }
                });
              },
              color: Colors.white.withOpacity(0.25),
              child: Text('Finish', style: TextStyle(fontFamily: 'Medium', color: Colors.white, fontSize: 18),),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccess() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 48, 0, 12),
              child: CircleAvatar(
                radius: 104,
                backgroundColor: AppColor.primary,
                child: Icon(Icons.thumb_up_rounded, size: 96, color: Colors.white,),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: Text('Registration Success', style: TextStyle(color: Colors.white, fontFamily: 'Bold', fontSize: 24),),
            ),
            Text('You have completed the registration process. Our team will be contacting you to do account verification via video call at your selected schedule', style: TextStyle(color: Colors.white, fontFamily: 'Regular', fontSize: 16), textAlign: TextAlign.center,),
            Expanded(child: Container(),),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 24),
              height: 48,
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                  });
                },
                color: Colors.white.withOpacity(0.25),
                child: Text('Return to Home', style: TextStyle(fontFamily: 'Medium', color: Colors.white, fontSize: 18),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
