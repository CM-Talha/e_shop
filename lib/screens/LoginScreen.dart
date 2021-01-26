import 'package:flutter/material.dart';
import 'package:glass_container/glass_container.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool pass=true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'lib/BG.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
                      child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  GlassContainer(
                    contHeight: height * 0.2,
                    contWidth: width * 0.9,
                    shadowBlurRadius: 50,
                    shadowSpreadRadius: 3,
                    sigmax: 1,
                    sigmay: 1,
                    contColor: Colors.white.withOpacity(0.12),
                    borderRadiusColor: Colors.white.withOpacity(0.15),
                    child: Center(
                      child: Text(
                        'Welcome to E-Shop\nPlease Login First',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GlassContainer(
                    contHeight: height * 0.65,
                    contWidth: width * 0.9,
                    shadowBlurRadius: 50,
                    sigmax: 1,
                    contColor: Colors.white.withOpacity(0.12),
                    borderRadiusColor: Colors.white.withOpacity(0.15),
                    sigmay: 1,
                    shadowSpreadRadius: 3,
                    child: Center(
                      child: SizedBox(
                        width: width * 0.8,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'E-mail',
                                border: OutlineInputBorder().copyWith(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                fillColor: Colors.white.withOpacity(0.15),
                                isDense: true,
                                filled: true,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              obscureText: pass,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        pass == true ? pass = false : pass = true;
                                      });
                                    },
                                    child: pass==true ? Icon(Icons.visibility_off)
                                     :Icon(Icons.visibility),),
                                hintText: 'Password',
                                border: OutlineInputBorder().copyWith(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                fillColor: Colors.white.withOpacity(0.15),
                                isDense: true,
                                filled: true,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              splashColor: Colors.black,
                              child: GlassContainer(
                                contHeight: 50,
                                contColor: Colors.white.withOpacity(0.17),
                                shadowBlurRadius: 80,
                                shadowSpreadRadius: 1,
                                borderRadiusColor: Colors.white.withOpacity(0.1),
                                shadowColor: Colors.black.withOpacity(0.09),
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Or Sign-Up for free',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.popAndPushNamed(context, '/b');
                              },
                              splashColor: Colors.black,
                              child: GlassContainer(
                                contHeight: 50,
                                contColor: Colors.white.withOpacity(0.17),
                                shadowBlurRadius: 80,
                                shadowSpreadRadius: 1,
                                borderRadiusColor: Colors.white.withOpacity(0.1),
                                shadowColor: Colors.black.withOpacity(0.09),
                                child: Center(
                                  child: Text(
                                    'Sign-Up',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.1,
                            ),
                            GestureDetector(
                              onTap: () {
                                print('Having Trouble ');
                              },
                              child: Text.rich(
                                TextSpan(
                                  text: 'Having Trouble  ',
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Click Here',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                        )),
                                    // can add more TextSpans here...
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                print('Terms & Conditions');
                              },
                              child: Text(
                                'Terms & Conditions',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 100,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
