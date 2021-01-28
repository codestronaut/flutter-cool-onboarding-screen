import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cool On Boarding',
      theme: ThemeData(
        primaryColor: '6686D8'.toColor(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // content state
  int contentState = 0;

  // List of title
  List<String> titles = [
    'Let us take care of you',
    'Always use a mask',
    'Work from home',
  ];

  // List of descriptions
  List<String> descriptions = [
    'We are here to take care of you \nwith pleasure. besides that we will \nmonitor your condition 24/Day',
    'always use a mask when you want\nto travel and keep your\nbody immunity',
    'to avoid the spread of covid 19. \nyou can do office work from home and\nalways be close to your family',
  ];

  // List of images path
  List<String> images = [
    'assets/illustration1.png',
    'assets/illustration2.png',
    'assets/illustration3.png',
  ];

  // Get Title
  String getTitle(int contentState) {
    if (contentState == 0) {
      return titles[0];
    } else if (contentState == 1) {
      return titles[1];
    } else {
      return titles[2];
    }
  }

  // Get Description
  String getDescription(int contentState) {
    if (contentState == 0) {
      return descriptions[0];
    } else if (contentState == 1) {
      return descriptions[1];
    } else {
      return descriptions[2];
    }
  }

  // Get Images
  String getImage(int contentState) {
    if (contentState == 0) {
      return images[0];
    } else if (contentState == 1) {
      return images[1];
    } else {
      return images[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 'ECF8FF'.toColor(),
      body: SafeArea(
        child: Stack(
          children: [
            // Image Illustration
            Container(
              margin: const EdgeInsets.only(top: 24.0),
              child: Image(
                height: 640.0,
                image: AssetImage(getImage(contentState)),
              ),
            ),
            // Top Components
            Container(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  contentState != 0
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              contentState--;
                              print(contentState);
                            });
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 18.0,
                          ),
                        )
                      : SizedBox(),
                  contentState != 2
                      ? Text(
                          'Skip',
                          style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            // Content
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: Container(
                  width: double.infinity,
                  color: 'FBFDFF'.toColor(),
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      Text(
                        getTitle(contentState),
                        style: GoogleFonts.poppins(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      // Description
                      Text(
                        getDescription(contentState),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: '878F95'.toColor(),
                          letterSpacing: 2.0,
                          height: 2.0,
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      // Bottom Components
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Indicator
                          Row(
                            children: [
                              // 0
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  height: 4.0,
                                  width: contentState == 0 ? 18.0 : 12.0,
                                  color: contentState == 0
                                      ? '6686D8'.toColor()
                                      : 'CBD6F3'.toColor(),
                                ),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              // 1
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  height: 4.0,
                                  width: contentState == 1 ? 18.0 : 12.0,
                                  color: contentState == 1
                                      ? '6686D8'.toColor()
                                      : 'CBD6F3'.toColor(),
                                ),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              // 2
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  height: 4.0,
                                  width: contentState == 2 ? 18.0 : 12.0,
                                  color: contentState == 2
                                      ? '6686D8'.toColor()
                                      : 'CBD6F3'.toColor(),
                                ),
                              ),
                            ],
                          ),
                          // Button Next
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (contentState <= 2) {
                                  contentState++;
                                }
                                print(contentState);
                              });
                            },
                            child: Container(
                              child: Image(
                                height: 40.0,
                                width: 40.0,
                                image: AssetImage('assets/next.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
