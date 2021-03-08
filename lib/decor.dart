import 'package:flutter/material.dart';

class AppColor {
  static Color primary   = Color.fromARGB(255, 9, 208, 176);
  static Color primary90 = Color.fromARGB(230, 9, 208, 176);
  static Color primary80 = Color.fromARGB(204, 9, 208, 176);
  static Color primary75 = Color.fromARGB(192, 9, 208, 176);
  static Color primary70 = Color.fromARGB(178, 9, 208, 176);
  static Color primary60 = Color.fromARGB(153, 9, 208, 176);
  static Color primary50 = Color.fromARGB(128, 9, 208, 176);
  static Color primary40 = Color.fromARGB(102, 9, 208, 176);
  static Color primary30 = Color.fromARGB (76, 9, 208, 176);
  static Color primary25 = Color.fromARGB (64, 9, 208, 176);
  static Color primary20 = Color.fromARGB (51, 9, 208, 176);
  static Color primary10 = Color.fromARGB (25, 9, 208, 176);

  static Color primaryLight   = Color.fromARGB(255, 2, 207, 232);
  static Color primaryLight90 = Color.fromARGB(230, 2, 207, 232);
  static Color primaryLight80 = Color.fromARGB(204, 2, 207, 232);
  static Color primaryLight75 = Color.fromARGB(192, 2, 207, 232);
  static Color primaryLight70 = Color.fromARGB(178, 2, 207, 232);
  static Color primaryLight60 = Color.fromARGB(153, 2, 207, 232);
  static Color primaryLight50 = Color.fromARGB(128, 2, 207, 232);
  static Color primaryLight40 = Color.fromARGB(102, 2, 207, 232);
  static Color primaryLight30 = Color.fromARGB (76, 2, 207, 232);
  static Color primaryLight25 = Color.fromARGB (64, 2, 207, 232);
  static Color primaryLight20 = Color.fromARGB (51, 2, 207, 232);
  static Color primaryLight10 = Color.fromARGB (25, 2, 207, 232);

  static Color primaryDark   = Color.fromARGB(255, 0, 144, 112);
  static Color primaryDark90 = Color.fromARGB(230, 0, 144, 112);
  static Color primaryDark80 = Color.fromARGB(204, 0, 144, 112);
  static Color primaryDark75 = Color.fromARGB(192, 0, 144, 112);
  static Color primaryDark70 = Color.fromARGB(178, 0, 144, 112);
  static Color primaryDark60 = Color.fromARGB(153, 0, 144, 112);
  static Color primaryDark50 = Color.fromARGB(128, 0, 144, 112);
  static Color primaryDark40 = Color.fromARGB(102, 0, 144, 112);
  static Color primaryDark30 = Color.fromARGB (76, 0, 144, 112);
  static Color primaryDark25 = Color.fromARGB (64, 0, 144, 112);
  static Color primaryDark20 = Color.fromARGB (51, 0, 144, 112);
  static Color primaryDark10 = Color.fromARGB (25, 0, 144, 112);

  static Color primary1Comp   = Color.fromARGB(255, 108, 29, 209);
  static Color primary1Comp90 = Color.fromARGB(230, 108, 29, 209);
  static Color primary1Comp80 = Color.fromARGB(204, 108, 29, 209);
  static Color primary1Comp75 = Color.fromARGB(192, 108, 29, 209);
  static Color primary1Comp70 = Color.fromARGB(178, 108, 29, 209);
  static Color primary1Comp60 = Color.fromARGB(153, 108, 29, 209);
  static Color primary1Comp50 = Color.fromARGB(128, 108, 29, 209);
  static Color primary1Comp40 = Color.fromARGB(102, 108, 29, 209);
  static Color primary1Comp30 = Color.fromARGB (76, 108, 29, 209);
  static Color primary1Comp25 = Color.fromARGB (64, 108, 29, 209);
  static Color primary1Comp20 = Color.fromARGB (51, 108, 29, 209);
  static Color primary1Comp10 = Color.fromARGB (25, 108, 29, 209);

  static Color primary2Comp   = Color.fromARGB(255, 22, 108, 158);
  static Color primary2Comp90 = Color.fromARGB(230, 22, 108, 158);
  static Color primary2Comp80 = Color.fromARGB(204, 22, 108, 158);
  static Color primary2Comp75 = Color.fromARGB(192, 22, 108, 158);
  static Color primary2Comp70 = Color.fromARGB(178, 22, 108, 158);
  static Color primary2Comp60 = Color.fromARGB(153, 22, 108, 158);
  static Color primary2Comp50 = Color.fromARGB(128, 22, 108, 158);
  static Color primary2Comp40 = Color.fromARGB(102, 22, 108, 158);
  static Color primary2Comp30 = Color.fromARGB (76, 22, 108, 158);
  static Color primary2Comp25 = Color.fromARGB (64, 22, 108, 158);
  static Color primary2Comp20 = Color.fromARGB (51, 22, 108, 158);
  static Color primary2Comp10 = Color.fromARGB (25, 22, 108, 158);
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = AppColor.primary;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.1433);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.245,
        size.width * 0.5, size.height * 0.1833);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.1216,
        size.width * 1.0, size.height * 0.2233);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CustomShapeClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width - size.width / 4, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class StyleText {
  TextStyle appBarTitleColor(Color _color) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: _color
    );
  }

  TextStyle appBarTitle() {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: Colors.black
    );
  }

  TextStyle superTitle() {
    return TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black
    );
  }

  TextStyle superTitleColor(Color _color) {
    return TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: _color
    );
  }

  TextStyle title16() {
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black
    );
  }

  TextStyle title16Color(Color _color) {
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: _color
    );
  }

  TextStyle title() {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black
    );
  }

  TextStyle titleColor(Color _color) {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: _color
    );
  }

  TextStyle subtitle1() {
    return TextStyle(
        fontSize: 14,
        color: Colors.black
    );
  }

  TextStyle subtitle1Color(Color _color) {
    return TextStyle(
        fontSize: 14,
        color: _color
    );
  }

  TextStyle subtitle2() {
    return TextStyle(
        fontSize: 12,
        color: Colors.black54
    );
  }

  TextStyle subtitle2Color(Color _color) {
    return TextStyle(
        fontSize: 12,
        color: _color
    );
  }

  TextStyle subtitle3() {
    return TextStyle(
        fontSize: 10,
        color: Colors.black54
    );
  }

  TextStyle subtitle3Color(Color _color) {
    return TextStyle(
        fontSize: 10,
        color: _color
    );
  }

  TextStyle overlayText11Color(Color _color) {
    return TextStyle(
        fontSize: 11,
        color: _color,
        fontWeight: FontWeight.bold
    );
  }

  TextStyle overlayText() {
    return TextStyle(
        fontSize: 10,
        color: Colors.white,
        fontWeight: FontWeight.bold
    );
  }

  TextStyle overlayTextColor(Color _color) {
    return TextStyle(
        fontSize: 10,
        color: _color,
        fontWeight: FontWeight.bold
    );
  }

  TextStyle sectionTitle16() {
    return TextStyle(
      letterSpacing: 1.5,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  TextStyle sectionTitle16Color(Color _color) {
    return TextStyle(
      letterSpacing: 1.5,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: _color,
    );
  }

  TextStyle sectionTitle() {
    return TextStyle(
      letterSpacing: 1.5,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  TextStyle sectionTitleColor(Color _color) {
    return TextStyle(
      letterSpacing: 1.5,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: _color,
    );
  }

  TextStyle sectionSubtitle() {
    return TextStyle(
        fontSize: 12,
        letterSpacing: 1.5,
        color: Colors.black54
    );
  }

  TextStyle sectionSubtitleColor(Color _color) {
    return TextStyle(
        fontSize: 12,
        letterSpacing: 1.5,
        color: _color
    );
  }

  TextStyle sectionTitle12Color(Color _color) {
    return TextStyle(
      fontSize: 12,
      color: _color,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle buttonLabel(Color _color) {
    return TextStyle(
      letterSpacing: 1.5,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: _color,
    );
  }

  TextStyle buttonLabel12(Color _color) {
    return TextStyle(
      letterSpacing: 1.5,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: _color,
    );
  }

  TextStyle normalTextBlack() {
    return TextStyle(
      fontSize: 14,
      color: Colors.black,
    );
  }

}

class CustomWidget {
  String lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu augue eu eros placerat sollicitudin. Phasellus auctor erat id purus eleifend porttitor. '
      '\n\nCras suscipit suscipit sem sed accumsan. Cras arcu libero, placerat eget lorem ut, molestie feugiat eros. Suspendisse condimentum rhoncus dolor nec dapibus. Nunc augue nisl, interdum a tristique sed, efficitur sit amet magna. Nullam efficitur cursus nibh, et pretium ex feugiat et. Donec finibus, nisl sed dapibus lacinia, diam lorem cursus tortor, in finibus purus arcu in est. '
      '\n\nMauris vehicula sem convallis semper iaculis. Mauris nec urna ornare, dapibus turpis at, semper ipsum. Nulla facilisi. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam at diam metus. Quisque feugiat pulvinar ligula ut maximus.Aliquam sollicitudin est eget condimentum iaculis. Sed at pulvinar nisi. Nullam accumsan ultrices ante. '
      '\n\nEtiam mattis rhoncus finibus. Ut eget elit id odio dignissim auctor id eu sem. Nunc iaculis scelerisque turpis vel fermentum. Donec erat orci, pellentesque sit amet fringilla eget, pharetra sit amet lorem. Cras et dolor bibendum, pulvinar lorem quis, fringilla lectus. In non eros egestas, vulputate lorem eu, interdum tortor. Nulla sollicitudin consequat diam sit amet fermentum. ';

  Widget locationWidget(String _loc, Color _color) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.near_me,
            size: 12,
            color: _color,
          ),
          Padding(
            padding: EdgeInsets.only(right: 2),
          ),
          Expanded(
            child: Text(
              _loc,
              style: TextStyle(
                fontSize: 11,
                color: _color,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  Widget stockIndicatorWidget(String _stock, double _marginTop, double _marginLeft){
    return Container(
      margin: EdgeInsets.only(top: _marginTop, left: _marginLeft),
      padding:
      EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        _stock,
        style: TextStyle(
          fontSize: 10,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget modalSheetIndicator() {
    return Container(
      height: 6,
      width: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.black12
      ),
    );
  }

  Widget empty() {
    return Padding(padding: EdgeInsets.all(0),);
  }

  Widget loading() {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(8), child: CircularProgressIndicator(),),
            Text('Memuat data...', style: StyleText().titleColor(Colors.black),)
          ],
        ),
      ),
    );
  }
}

class MyLinearProgressIndicator extends LinearProgressIndicator
    implements PreferredSizeWidget {
  MyLinearProgressIndicator({
    Key key,
    double value,
    Color backgroundColor,
    Animation<Color> valueColor,
  }) : super(
    key: key,
    value: value,
    backgroundColor: backgroundColor,
    valueColor: valueColor,
  ) {
    preferredSize = Size(double.infinity, 1.0);
  }

  @override
  Size preferredSize;
}

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;

  const CustomSwitch({Key key, this.value, this.onChanged, this.activeColor})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _circleAnimation = AlignmentTween(
        begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
        parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
            onTap: () {
              if (_animationController.isCompleted) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }
              widget.value == false
                  ? widget.onChanged(true)
                  : widget.onChanged(false);
            },
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 40,
                    height: 16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: widget.value ? AppColor.primary : Colors.white),
                  ),
                ),
                Container(
                  width: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(),
                      Expanded(
                        child: Align(
                          alignment: _circleAnimation.value,
                          child: Container(
                              width: 25.0,
                              height: 25.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: widget.value ? Colors.white : AppColor.primary
                              ),
                              child: widget.value ? Icon(Icons.view_module, color: AppColor.primaryDark, size: 16,) : Icon(Icons.view_headline, color: Colors.black, size: 16,)
                          ),
                        ),
                      ),
                      Container(),
                    ],
                  ),
                ),
              ],
            )
        );
      },
    );
  }
}