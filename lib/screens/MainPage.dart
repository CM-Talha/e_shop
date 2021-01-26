import 'package:flutter/material.dart';
import 'package:glass_container/glass_container.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.lighten),
            image: AssetImage('lib/BG.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'a'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'b'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'c'),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/BG.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GlassContainer(
                    contHeight: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GlassContainer(
                    contHeight: 200,
                  ),
                ),
                Container(
                  height: 300,
                ),
                Container(
                  height: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
