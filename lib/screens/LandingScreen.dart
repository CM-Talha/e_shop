import 'package:flutter/material.dart';
import 'package:glass_container/glass_container.dart';
import 'SliderModel.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/BG.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Align(
            alignment: Alignment.topCenter,
            child: GlassContainer(
              contHeight: MediaQuery.of(context).size.height - 130,
              contWidth: MediaQuery.of(context).size.width * 0.95,
               shadowBlurRadius: 50,
                  shadowSpreadRadius: 3,
                  sigmax: 1,
                  sigmay: 1,
                  contColor: Colors.white.withOpacity(0.12),
                  borderRadiusColor: Colors.white.withOpacity(0.15),
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    slideIndex = index;
                  });
                },
                children: <Widget>[
                  SlideTile(
                    imagePath: mySLides[0].getImageAssetPath(),
                    title: mySLides[0].getTitle(),
                    desc: mySLides[0].getDesc(),
                  ),
                  SlideTile(
                    imagePath: mySLides[1].getImageAssetPath(),
                    title: mySLides[1].getTitle(),
                    desc: mySLides[1].getDesc(),
                  ),
                  SlideTile(
                    imagePath: mySLides[2].getImageAssetPath(),
                    title: mySLides[2].getTitle(),
                    desc: mySLides[2].getDesc(),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomSheet: slideIndex != 2
            ? Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/BG.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: GlassContainer(
                  contHeight: MediaQuery.of(context).size.height * 0.1,
                  contWidth: double.infinity,
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            controller.animateToPage(2,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.linear);
                          },
                          splashColor: Colors.blue[50],
                          child: Text(
                            "SKIP",
                            style: TextStyle(
                                color: Color(0xFF0074E4),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              for (int i = 0; i < 3; i++)
                                i == slideIndex
                                    ? _buildPageIndicator(true)
                                    : _buildPageIndicator(false),
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            print("this is slideIndex: $slideIndex");
                            controller.animateToPage(slideIndex + 1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.linear);
                          },
                          splashColor: Colors.blue[50],
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                                color: Color(0xFF0074E4),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : InkWell(
                onTap: () {
                  print("Get Started Now");
                  setState(() {
                    Navigator.popAndPushNamed(context, '/a');
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/BG.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: GlassContainer(
                    contHeight: MediaQuery.of(context).size.height * 0.095,
                    contWidth: double.infinity,
                    contColor: Colors.white.withOpacity(0.1),
                    child: Center(
                      child: Text(
                        "GET STARTED NOW",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SlideTile extends StatelessWidget {
  String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(
            height: 40,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(desc,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14))
        ],
      ),
    );
  }
}
