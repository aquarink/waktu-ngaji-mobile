import 'package:flutter/material.dart';

import 'screens/terbaru.dart';
import 'screens/lainnya.dart';
import 'screens/terdekat.dart';
import 'screens/profilustadz.dart';

import 'screens/waktusolat_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pebri - Waktu Ngaji By Flutter',
      theme: ThemeData(
        primarySwatch: Colors.brown
      ),
      home: Home(),
      routes: <String , WidgetBuilder> {
        "/WaktuSolat" : (BuildContext context) => WaktuSolatRoute()
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainStates();
  }
}

class _MainStates extends State<Home> {
  int _currentIndex = 0;

  // List untuk penentuan index nya - effect di baris 96
  // body: _children[_currentIndex],

  final List<Widget> _screens = [
    terbaru(),
    lainnya(),
    terdekat(),
    profilustadz()
  ];

  @override
  Widget build(BuildContext context) {
    print("Context " + context.toString());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Column(
          children: <Widget>[
            Text("وقت NGAJI",
                style: TextStyle(color: Colors.white, fontSize: 25.0)),
            Text("WAKTUNYA RAMAIKAN PENGAJIAN",
                style: TextStyle(color: Colors.white, fontSize: 9.0)),
          ],
        ),
      ),
      drawer: Drawer(
          elevation: 20.0,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: new Text("John Doe"),
              ),
              ListTile(
                leading: Icon(Icons.timelapse),
                title: Text('Waktu Solat'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/WaktuSolat');
                },
              ),
              Divider(
                height: 2.0,
              ),
              ListTile(
                leading: Icon(Icons.control_point_duplicate),
                title: Text('Daftar Akun'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/DaftarAkun');
                },
              ),
              Divider(
                height: 2.0,
              ),
              ListTile(
                leading: Icon(Icons.input),
                title: Text('Masuk Akun'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/MasukAkun');
                },
              ),
            ],
          )),
      // body: _children[_currentIndex],
      body: _screens[_currentIndex],
      // _currentIndex effected dari 121
      // void onBottomNavigationTabTapped
      bottomNavigationBar: BottomNavigationBar(
        onTap: onBottomNavigationTabTapped, // new
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            title: Text('Terbaru'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Lainnya'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Terdekat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Profil Ustdaz'),
          ),
        ],
      ),
    );
  }

  void onBottomNavigationTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    print("Container clicked " + index.toString());
  }
}
