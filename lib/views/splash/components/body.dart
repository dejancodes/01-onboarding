import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_join/config/colors.dart';
import 'package:just_join/models/splash.dart';
import 'package:just_join/views/splash/components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Splash> splashData = [
    const Splash(
      title: "Read",
      description: "A lot of interesting books on your favorite topics!",
      image: "assets/images/splash_01.png",
      imageHeight: 310,
    ),
    const Splash(
      title: "Explore",
      description: "Big library of different articles and videos!",
      image: "assets/images/splash_02.png",
      imageHeight: 310,
    ),
    const Splash(
      title: "Grow",
      description: "Earn start and grow your own monster!",
      image: "assets/images/splash_03.png",
      imageHeight: 270,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/circle.png",
              width: MediaQuery.of(context).size.width / 3,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        itemCount: splashData.length,
                        itemBuilder: (context, index) => SplashContent(
                          title: splashData[index].title,
                          description: splashData[index].description,
                          image: splashData[index].image,
                          imageHeight: splashData[index].imageHeight,
                        ),
                      ),
                      Positioned(
                        top: 300,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            splashData.length,
                            (index) => buildDot(index),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                      ),
                      TextButton(
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 5),
                              ),
                            ],
                            gradient: primaryGradientColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 110,
                          ),
                          child: Text(
                            "Continue",
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            // Implement last page trigger
                            currentPage++;
                          });
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          // Skip the splash
                        },
                        child: Text(
                          "Skip",
                          style: GoogleFonts.nunito(
                              color: primaryColor,
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              shadows: [
                                Shadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: const Offset(3, 3),
                                    blurRadius: 15),
                              ]),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 8),
      child: CircleAvatar(
        backgroundColor: currentPage == index ? secondaryColor : dotInactive,
        radius: 6,
      ),
    );
  }
}
