import 'package:flutter/material.dart';
import 'package:glass_container/glass_container.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count=5;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: LimitedBox(
                  maxHeight: 200,
                  child: GlassContainer(
                    contHeight: 200,
                    shadowBlurRadius: 50,
                    sigmax: 1,
                    contColor: Colors.white.withOpacity(0.2),
                    borderRadiusColor: Colors.white.withOpacity(0.15),
                    sigmay: 1,
                    shadowSpreadRadius: 3,
                    child: LimitedBox(
                      child: CarouselSlider.builder(
                        itemCount: count,
                        options: CarouselOptions(),
                        itemBuilder: (context, a) {
                          return GlassContainer(
                            child: Container(color: Colors.redAccent,),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              buildContainer(),
              buildContainer(),
              buildContainer(),
              buildContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

Padding buildContainer({Widget child}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: LimitedBox(
      maxHeight: 200,
      child: GlassContainer(
        contHeight: 200,
        shadowBlurRadius: 50,
        sigmax: 1,
        contColor: Colors.white.withOpacity(0.2),
        borderRadiusColor: Colors.white.withOpacity(0.15),
        sigmay: 1,
        shadowSpreadRadius: 3,
        child: child,
      ),
    ),
  );
}
