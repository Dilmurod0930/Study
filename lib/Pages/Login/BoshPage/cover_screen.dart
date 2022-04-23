import 'package:flutter/material.dart';
import 'package:study/core/constants/color_const.dart';

class FirstSplashScreen extends StatelessWidget {
  const FirstSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/rasm.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/rang.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 61,
            child: Column(
              children: [
                _text(
                  """       Hello and 
    welcome here!""",
                  ColorConst.kPrimryColor,
                  36.0,
                  FontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 66),
                  child: _text(
                    """    Get an overview of how you are performing 
   and motivate yourself to achieve even moew.""",
                    const Color(0XFFFFFFFF),
                    16.0,
                    FontWeight.normal,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(149, 56),
                      primary: ColorConst.kPrimaryButtonColor),
                  child: _text(
                    "Let's start",
                    ColorConst.kPrimryColor,
                    17.0,
                    FontWeight.bold,
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/splash2", (route) => false);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 149,
            width: 110,
            height: 35,
            child: Image.asset(
              "assets/images/Logo.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Text _text(text, color, size, FontWeight) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight,
      ),
    );
  }
}
