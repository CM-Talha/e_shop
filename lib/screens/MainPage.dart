import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_shop/screens/LoginScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:glass_container/glass_container.dart';

import 'Home.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

class _MainPageState extends State<MainPage> {
  int _page = 0;
  final tabPages = <Widget>[
    Center(child: Home()),
    Center(child: Login()),
    Center(child: Home()),
    Center(child: Login()),
    //  ProfilePage()
  ];
  List<Widget> titles = <Widget>[
    const Text('Select Category',
        style:
            TextStyle(color: Color(0x75000000), fontWeight: FontWeight.bold)),
    const Text('Search',
        style:
            TextStyle(color: Color(0x75000000), fontWeight: FontWeight.bold)),
    const Text('Add Project',
        style:
            TextStyle(color: Color(0x75000000), fontWeight: FontWeight.bold)),
    const Text('My Profile',
        style:
            TextStyle(color: Color(0x75000000), fontWeight: FontWeight.bold)),
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize =
        MediaQuery.of(context).size; // To get the size of Host Screen
    final drawerItems = ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            // User profile Image with his cover image
            Stack(
              children: <Widget>[
                Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: CircleAvatar(
                        radius: screenSize.height / 10,
                        backgroundImage: NetworkImage(
                            'https://m.economictimes.com/thumb/msid-76258442,width-1200,height-900,resizemode-4,imgsize-102340/japan-robot-retu.jpg'), //User's Profile Image
                      ),
                    ),
                  ),
                  height: screenSize.height / 4.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://blogs.3ds.com/northamerica/wp-content/uploads/sites/4/2019/08/Robots-Square.jpg'), // User's Cover Image
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ],
        ),
        // User Name with Email
        GlassContainer(
          shadowBlurRadius: 50,
          sigmax: 1,
          contColor: Colors.white.withOpacity(0.1),
          borderRadiusColor: Colors.white.withOpacity(0.001),
          shadowColor: Colors.white.withOpacity(0.06),
          sigmay: 1,
          shadowSpreadRadius: 0,
          radius: BorderRadius.zero,
          child: ListTile(
            title: Center(
                child: Text(
              'Alexa Stunner',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ), // User Name
            )),
            subtitle: Center(
                child: Text(
              'alexastunner@example.com', // User Email
            )),
          ),
        ),
      ],
    );
    return Scaffold(
      key: _scaffoldKey,
      drawer: SafeArea(
        child: Drawer(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/BG.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
            child: GlassContainer(
              shadowBlurRadius: 50,
              shadowSpreadRadius: 1,
              radius: BorderRadius.circular(0),
              sigmax: 100,
              sigmay: 100,
              contColor: Colors.white.withOpacity(0.12),
              borderRadiusColor: Colors.white.withOpacity(0.15),
              child: drawerItems,
            ),
          ),
        ),
      ),
      appBar: MyCustomAppBar(
        height: 100,
        title: titles[_page],
      ),
      bottomNavigationBar: Container(
        height: 78,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/BG.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: GlassContainer(
          shadowBlurRadius: 50,
          shadowSpreadRadius: 1,
          sigmax: 100,
          sigmay: 100,
          contColor: Colors.white.withOpacity(0.12),
          borderRadiusColor: Colors.white.withOpacity(0.15),
          child: CurvedNavigationBar(
            color: Colors.indigo[100],
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Colors.transparent,
            items: [
              Icon(Icons.home,
                  color: _page == 0
                      ? Colors.white
                      : Colors.black.withOpacity(0.7)),
              Icon(Icons.list,
                  color: _page == 1
                      ? Colors.white
                      : Colors.black.withOpacity(0.7)),
              Icon(Icons.add,
                  color: _page == 2
                      ? Colors.white
                      : Colors.black.withOpacity(0.7)),
              Icon(
                Icons.perm_identity,
                color:
                    _page == 3 ? Colors.white : Colors.black.withOpacity(0.7),
              )
            ],
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
          ),
        ),
      ),
      body: tabPages[_page],
    );
  }
}

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget title;
  const MyCustomAppBar({
    Key key,
    @required this.height,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/BG.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
          child: GlassContainer(
            radius: BorderRadius.circular(0),
            contHeight: height,
            shadowBlurRadius: 50,
            shadowSpreadRadius: 1,
            sigmax: 100,
            sigmay: 100,
            contColor: Colors.white.withOpacity(0.12),
            borderRadiusColor: Colors.white.withOpacity(0.15),
            child: Padding(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      size: 25,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  title,
                  Icon(Icons.shopping_cart,color: Colors.black.withOpacity(0.6),),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
