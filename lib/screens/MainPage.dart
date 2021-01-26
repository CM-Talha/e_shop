import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        bottom: TabBar(
          tabs: [
            Icon(Icons.home),
            Icon(Icons.mail),
            Icon(Icons.bookmark),
          ],
          onTap: (a) {
            a += a;
            print(a);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child:ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.amber,
                  );
                 },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
