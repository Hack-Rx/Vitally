import 'package:flutter/material.dart';
import 'package:vitally/Login_SignUp/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vitally/pageTransitions/pagetransition.dart';

const bodytxt = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.normal);

const titletxt = TextStyle(
  fontSize: 26.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const buttontxt = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat');

const Uigrn = Color(0xFF00CDAC);
const Uiblu = Color(0xFF5433FF);

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController(viewportFraction: 2);

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Uigrn,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: phoneHeight / 1.354,
              child: PageView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 150, bottom: 50),
                          child: Container(
                              height: phoneHeight / 4.52,
                              child: Image.asset('assets/1.png')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 15),
                          child: Text(
                            'Track your Calories',
                            style: titletxt,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: phoneHeight / 8.12,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 15.0, right: 15, bottom: 25),
                            child: Text(
                              'View your health data, weight loss, fat loss progress & daily calories at a glance',
                              textAlign: TextAlign.center,
                              style: bodytxt,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 150.0, bottom: 50),
                          child: Container(
                              height: phoneHeight / 4.52,
                              child: Image.asset('assets/2.png')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 15),
                          child: Text(
                            'Reach Your Goals',
                            style: titletxt,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: phoneHeight / 8.12,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 15.0, right: 15, bottom: 25),
                            child: Text(
                              'Set your goals and track your goals from dashboard',
                              textAlign: TextAlign.center,
                              style: bodytxt,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 150.0, bottom: 50),
                          child: Container(
                              height: phoneHeight / 4.52,
                              child: Image.asset('assets/3.png')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 15),
                          child: Text(
                            'Get into Shape',
                            style: titletxt,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: phoneHeight / 8.12,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 15.0, right: 15, bottom: 25),
                            child: Text(
                              'Discover Your Best Version with Vitally',
                              textAlign: TextAlign.center,
                              style: bodytxt,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect:
                    WormEffect(dotColor: Colors.white, activeDotColor: Uiblu),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 90),
              child: MaterialButton(
                child: Text('Get Started', style: buttontxt),
                height: phoneHeight / 13.54,
                minWidth: phoneWidth / 1.20,
                color: Uiblu,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UserLoginPage();
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already have an Account?',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontFamily: 'Montserrat'),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, ScaleRoute(page: UserLoginPage()));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontFamily: 'Montserrat'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
