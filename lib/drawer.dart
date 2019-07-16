import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

final Color backgroundColor = Color(0xFFa3646b);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return Container(
      color: Colors.black,
      child: SlideTransition(
          
          position: _slideAnimation,
          child: ScaleTransition(
            
            scale: _menuScaleAnimation,
            child: Padding(
      
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Home",
                style: TextStyle(color: Colors.white, fontSize: 22)),
            SizedBox(height: 10),
            Text("Gallery",
                style: TextStyle(color: Colors.white, fontSize: 22)),
            SizedBox(height: 10),
            Text("Events",
                style: TextStyle(color: Colors.white, fontSize: 22)),
            SizedBox(height: 10),
            Text("cluster",
                style: TextStyle(color: Colors.white, fontSize: 22)),
            SizedBox(height: 10),
            Text("core Team",
                style: TextStyle(color: Colors.white, fontSize: 22)),
            SizedBox(height: 10),
            Text("Contact us",
                style: TextStyle(color: Colors.white, fontSize: 22)),
            SizedBox(height: 10),
            Text("About",
                style: TextStyle(color: Colors.white, fontSize: 22)),
          ],
        ),
      ),
            ),
          ),
        ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: backgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(Icons.menu, color: Colors.white),
                        onTap: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();

                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      Text("DSC SASTRA",
                          style: TextStyle(fontSize: 24, color: Colors.white)),
                      Icon(
                        Icons.settings, color:Colors.white
                      )
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Image.asset("assets/flutter.jpg"),
                          
                          color: Colors.white,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Image.asset(
                            "assets/studyjam.jpg"

                          ),
                          color: Colors.blueAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.greenAccent,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                 
                 

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
