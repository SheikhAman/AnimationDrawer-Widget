import 'package:flutter/material.dart';
import 'package:fancy_drawer/fancy_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CurvedNavigationDrawer(),
    );
  }
}

class CurvedNavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late FancyDrawerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FancyDrawerWrapper(
        backgroundColor: Colors.white,
        controller: _controller,
        drawerItems: <Widget>[
          Text(
            "Go to home",
            style: TextStyle(
              fontSize: 18,
              color: Colors.purple.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "About us",
            style: TextStyle(
              fontSize: 18,
              color: Colors.purple.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Our products",
            style: TextStyle(
              fontSize: 18,
              color: Colors.purple.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Support us",
            style: TextStyle(
              fontSize: 18,
              color: Colors.purple.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Log out",
            style: TextStyle(
              fontSize: 18,
              color: Colors.purple.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            elevation: 4.0,
            title: Text(
              "Animated Navigation Drawer",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                _controller.toggle();
              },
            ),
          ),
          body: Center(
            child: Text("Body"),
          ),
        ),
      ),
    );
  }
}
