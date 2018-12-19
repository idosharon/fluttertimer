import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
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

class _MyHomePageState extends State<MyHomePage> {

  int ender = 0;
  int latesI = 21;
  int timerDowner = 1;
  static AudioCache Gong = new AudioCache();


  int i = 21;
  bool working = false;
  // ignore: non_constant_identifier_names
  void StartTimer() {
    // ignore: unused_local_variable
    if(working) return;
    var timer = new Timer.periodic(Duration(seconds: timerDowner), callback);
    i = i * 60;
    i += 11;
  }

  void pausePlayer(Timer timer) {
    print("End");
    Gong.play("gongfile.mp3");
    Future.delayed(Duration(milliseconds: 1500), Sound2);
    setState(() {
      this.i = latesI;
      timer.cancel();
    });
    working = false;
  }

  void startSound() {
    if(working) return;
    Gong.play("gongfile.mp3");

  }
  void Sound2() {
    Gong.play("gongfile.mp3");
    Future.delayed(Duration(milliseconds: 1500), Sound3);
  }
  void Sound3() {
    Gong.play("gongfile.mp3");
  }
  void callback(Timer timer) {
    if(i == ender){
      print("End");
      Gong.play("gongfile.mp3");
      Future.delayed(Duration(milliseconds: 1500), Sound2);
      setState(() {
        this.i = latesI;
        timer.cancel();
      });
      working = false;
    } else {
      print("time is " + (i).toString());
      working = true;
      setState(() {
        i--;
      });
    }
    if(i == (latesI * 60)){
      Gong.play("gongfile.mp3");
      Future.delayed(Duration(milliseconds: 1500), Sound2);
    }

  }

  void changer(i) {
    if(working){
      return;
    } else{
      this.i;

      setState(() {
        i == this.i;
      });


    }


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Hedgehog Timer", textAlign: TextAlign.center,style: TextStyle(color: Colors.black)) ),
        backgroundColor: Colors.white,

        elevation: 0.2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.network("https://source.unsplash.com/collection/3680221/1600x900"),
            ),
            Text(
              "The Timer Say:"
            ),
            Text(
              (i).toString(),
              style: TextStyle(fontSize: 100),
            ),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          StartTimer();
          startSound();
        },
        elevation: 4.0,
        icon: working ? Icon(Icons.pause) : Icon(Icons.play_arrow),
        label: Text("Start"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.local_pizza),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                if (working) return;
                Gong.play("gongfile.mp3");
                setState(() {
                  this.i = {42: 63, 63: 1, 1: 7, 7: 21, 21: 42}[this.i];
                  latesI = this.i;
                });

              },
            )
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
