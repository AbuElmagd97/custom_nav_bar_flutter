import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomBottomNavBar(),
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 90,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomPaint(
                    size: Size(size.width, 90),
                    painter: BNBCustomPainter(),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    width: size.width,
                    height: 90,
                    child: Column(
                      children: [
                        SizedBox(height:15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.home,
                                color: currentIndex == 0 ? Colors.orange : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(0);
                              },
                              splashColor: Colors.white,
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.restaurant_menu,
                                  color: currentIndex == 1 ? Colors.orange : Colors.grey.shade400,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(1);
                                }),
                            Container(
                              width: size.width * 0.10,
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.bookmark,
                                  color: currentIndex == 2 ? Colors.orange : Colors.grey.shade400,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(2);
                                }),
                            IconButton(
                                icon: Icon(
                                  Icons.notifications,
                                  color: currentIndex == 3 ? Colors.orange : Colors.grey.shade400,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(3);
                                }),
                          ],
                        ),
                        Stack(
                          children: [
                            CustomPaint(
                              size: Size(size.width, 25),
                              painter: BNBCustomPainter2(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


///first half circle paint
class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color(0xFF68ff68).withOpacity(0.4) /// fill color
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 40); /// Start
    path.quadraticBezierTo(size.width * 0.15, 0, size.width * 0.50, 0);
    path.quadraticBezierTo(size.width * 0.50, 0, size.width * 0.50, 0);
    path.arcToPoint(Offset(size.width * 0.50, 0),radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.50, 0, size.width * 0.55, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 40);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

/// the second half circle paint
class BNBCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color(0xff41AA6F).withOpacity(0.6)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 40); // Start
    path.quadraticBezierTo(size.width * 0.15, 0, size.width * 0.50, 0);
    path.quadraticBezierTo(size.width * 0.50, 0, size.width * 0.50, 0);
    path.arcToPoint(Offset(size.width * 0.50, 0),radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.50, 0, size.width * 0.55, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 40);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}