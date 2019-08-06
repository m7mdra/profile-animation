import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _backgroundHeightController;
  Animation<double> _backgroundHeightAnimation;
  AnimationController _fabController;
  bool isExpanded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _backgroundHeightController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addListener(() => setState(() {}));
    _fabController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() => setState(() {}));
    _backgroundHeightAnimation =
        Tween<double>(begin: MediaQuery.of(context).size.height, end: 0)
            .animate(CurvedAnimation(
                parent: _backgroundHeightController,
                curve: Curves.easeInToLinear));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _backgroundHeightController.dispose();
    _fabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        isExtended: true,
        onPressed: () {
          if (_backgroundHeightAnimation.status == AnimationStatus.completed)
            _backgroundHeightController.reverse();
          else
            _backgroundHeightController.forward();

          if (isExpanded) {
            _fabController.reverse();
            isExpanded = false;
          } else {
            _fabController.forward();
            isExpanded = true;
          }
          setState(() {});
        },
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _fabController,
          size: 40,
          color: Color(0xff0178FF),
        ),
      ),
      body: SafeArea(
        child: Transform.translate(
          offset: Offset(0, _backgroundHeightAnimation.value),
          child: Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xff0064FF),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 150,
                    child: Stack(
                      fit: StackFit.loose,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: ClipOval(
                              child: Container(
                            width: 135,
                            height: 135,
                            decoration: BoxDecoration(
                                color: Color(0xff0178FF),
                                shape: BoxShape.circle),
                            child: Center(
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/image.png',
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: 120,
                                ),
                              ),
                            ),
                          )),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(
                            backgroundColor: Color(0xff0178FF),
                            highlightElevation: 0,
                            onPressed: () {},
                            elevation: 0,
                            child: ClipOval(
                                child: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: Color(0xff0163FF),
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.power_settings_new,
                                      size: 40,
                                    ))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Mohamed Elrasheid',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Divider(
                    color: Colors.white12,
                    height: 1,
                  ),
                  ListTile(
                    onTap: () {},
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    dense: true,
                    title: Text(
                      'Back to landing',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Divider(
                    color: Colors.white12,
                    height: 1,
                  ),
                  ListTile(
                    onTap: () {},
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    leading: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    dense: true,
                    title: Text(
                      'User settings',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Divider(
                    color: Colors.white12,
                    height: 1,
                  ),
                  ListTile(
                    onTap: () {},
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    leading: Icon(
                      Icons.group_work,
                      color: Colors.white,
                    ),
                    dense: true,
                    title: Text(
                      'Teams',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Divider(
                    color: Colors.white12,
                    height: 1,
                  ),
                  ListTile(
                    onTap: () {},
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    leading: Icon(
                      Icons.business,
                      color: Colors.white,
                    ),
                    dense: true,
                    title: Text(
                      'Builds',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Divider(
                    color: Colors.white12,
                    height: 1,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    leading: Icon(
                      Icons.apps,
                      color: Colors.white,
                    ),
                    dense: true,
                    onTap: () {},
                    title: Text(
                      'Apps',
                      style: TextStyle(color: Colors.white, fontSize: 15),
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
