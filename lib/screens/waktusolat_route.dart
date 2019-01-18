import 'package:flutter/material.dart';

class WaktuSolatRoute extends StatelessWidget {

  // final String judul;
  // WaktuSolatRoute(this.judul);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Column(
          children: <Widget>[
            Text("وقت NGAJI",
                style: TextStyle(color: Colors.white, fontSize: 25.0)),
            Text("WAKTUNYA RAMAIKAN PENGAJIAN",
                style: TextStyle(color: Colors.white, fontSize: 9.0)),
          ],
        ),
      ),
      body: Center(
        child: Text('Waktu Solat'),
      ),
    );
  }
}