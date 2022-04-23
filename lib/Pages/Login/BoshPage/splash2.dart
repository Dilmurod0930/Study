import 'package:flutter/material.dart';
import 'package:study/core/constants/color_const.dart';

class SecondSplashScreen extends StatelessWidget {
  const SecondSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/rasm2.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: _text(
                    "Find your favorite class",
                    ColorConst.kPrimaryBlack,
                    24.0,
                    FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    left: 32,
                    right: 32,
                    bottom: 72,
                  ),
                  child: _text(
                    """Lorem ipsum dolor sit amet, consectetur
adipiscing elit. Sit enim, ac amet ultrices.""",
                    Color(0xff64748B),
                    16.0,
                    FontWeight.normal,
                  ),
                ),
                SizedBox(
                  width: 50.0,
                  height: 15,
                  child: Image.asset(
                    "assets/images/Slider.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/signup");
                        },
                        child: _text(
                          "Skip",
                          ColorConst.kPrimaryButtonColor,
                          22.0,
                          FontWeight.normal,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/sign_In", (route) => false);
                        },
                        child: const CircleAvatar(
                          backgroundColor: ColorConst.kPrimaryButtonColor,
                          radius: 30,
                          child: Icon(Icons.arrow_forward_outlined),
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
