import 'package:flutter/material.dart';

import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Intro to Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({ Key key, @required this.title }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  GifController _gifController;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _gifController = GifController(vsync: this, duration: Duration(milliseconds: 400));
    _gifController.animateTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.widget.title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            color: Colors.blueAccent,
          ),
        )
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 50
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.4),
                border: Border.all(
                  color: ThemeData.dark().backgroundColor,
                  width: 1
                ),
              ),
              child: Text(
                'Score: $score',
                style: GoogleFonts.dosis(
                  textStyle: TextStyle(
                    fontSize: 40,
                    color: Colors.pinkAccent
                  )
                ),
              ),
            ),
            SizedBox(height: 20),
            GifImage(
              controller: _gifController,
              image: AssetImage("assets/giphy.gif"),
              height: 350,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {

                    _gifController.value = 0;
                    _gifController.animateTo(7);
                    
                    setState(() {
                      score++;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.greenAccent,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(24)
                  ),
                  child: Icon(Icons.thumb_up, size: 40, color: ThemeData.dark().backgroundColor)
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.orangeAccent,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(24)
                  ),
                  onPressed: () {
                    setState(() => score = 0);
                  }, 
                  child: Text(
                    'Reset',
                    style: GoogleFonts.dosis(
                      textStyle: TextStyle(
                        fontSize: 30
                      )
                    )
                  )
                )
              ],
            )
          ],
        ),
      )
    );
  }
}