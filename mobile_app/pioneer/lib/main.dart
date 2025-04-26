import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'about_page.dart';
import 'gallery.dart';
import 'informational_page.dart';
import 'future_releases_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PIONEER',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    WelcomePage(),
    InformationalPage(),
    AboutPage(),
    GalleryPage(),
    FutureReleasesPage(),
  ];

  final List<String> _titles = [
    'Добре дошли',
    'Информация',
    'За нас',
    'Галерия',
    'Бъдещи реализации',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: AppBar(
          title: Text(
            _titles[_selectedIndex],
            style: TextStyle(color: Colors.white),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: Image.asset('assets/images/icon.png'),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 100,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 87, 111, 229),
          child: ListView(
            padding: EdgeInsets.zero,  
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'PIONEER',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 35,
                    fontFamily: 'Blanka',
                  ),
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 116, 19, 201),
                ),
              ),
              ListTile(
                title: Text(
                  'Добре дошли',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  _onItemTapped(0);
                },
              ),
              ListTile(
                title: Text(
                  'Информация',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  _onItemTapped(1);
                },
              ),
              ListTile(
                title: Text('За нас', style: TextStyle(color: Colors.white)),
                onTap: () {
                  _onItemTapped(2);
                },
              ),
              ListTile(
                title: Text('Галерия', style: TextStyle(color: Colors.white)),
                onTap: () {
                  _onItemTapped(3);
                },
              ),
              ListTile(
                title: Text(
                  'Бъдещи реализации',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  _onItemTapped(4);
                },
              ),
            ],
          ),
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
