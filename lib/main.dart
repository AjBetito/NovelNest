import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

void main() {
  runApp(NovelNestApp());
}

class NovelNestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NovelNest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC0E6F4),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/splash_logo.png', width: 150),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'NovelNest',
                style: GoogleFonts.kaushanScript(
                    color: Colors.black, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC0E6F4),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Text('NovelNest',
            style: GoogleFonts.kaushanScript(color: Colors.black))
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFC0E6F4),
        padding: EdgeInsets.all(1.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                padding: EdgeInsets.all(16),
                children: [
                  NovelCard(title: 'Novel 1'),
                  NovelCard(title: 'Novel 2'),
                  NovelCard(title: 'Novel 1'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditorScreen()),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.blue.shade900,
        child: SizedBox(height: 120),
      ),
    );
  }
}

class NovelCard extends StatelessWidget {
  final String title;
  NovelCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditorScreen()),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(8.0), // Adds padding outside the card
        child: Container(
          width: 156,
          height: 209,
          decoration: BoxDecoration(
            color: Color(0xFF203C80),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(12), // Adds 
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditorScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Untitled', style: GoogleFonts.kaushanScript()),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: 'Start writing here...',
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
