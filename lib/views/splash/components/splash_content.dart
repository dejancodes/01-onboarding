import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_join/config/colors.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.imageHeight,
  });
  final String title, description, image;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: imageHeight,
        ),
        const Spacer(flex: 5),
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: Text(
            description,
            style: GoogleFonts.nunito(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
