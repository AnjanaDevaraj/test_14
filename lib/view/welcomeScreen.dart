import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../utilites/appAssets.dart';
import '../utilites/appRoutes.dart';
import '../utilites/customTextButton.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeSection(),
    );
  }
}

class HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenHeight * 0.75;
    double bottomHeight = screenHeight * 0.40;
    return SizedBox(
      height: screenHeight,
      child:
      Stack(
        children: [
          Lottie.asset(AppAssets.welcomeLottie,height: imageHeight, fit: BoxFit.fitWidth),
          Positioned(
            bottom: 0,
            left: -120,
            right: -120,
            child: BottomSection(
                bottomHeight: bottomHeight, screenWidth: screenWidth),
          )
        ],
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    super.key,
    required this.bottomHeight,
    required this.screenWidth,
  });

  final double bottomHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bottomHeight,
      width: screenWidth,
      decoration:  BoxDecoration(
        //color: Colors.white.withOpacity(.9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(360),
          topRight: Radius.circular(360),
        ),
      ),
      child: Column(
        children: [
         // SizedBox(height: 50),
          Text("Watch your Favourite",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          Text("Movies",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 20,),
          CustomTextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.login);
            },
            height: 60,
            color: Colors.yellow[700],
            text: "Get Started",
          )
        ],
      ),
    );
  }
}
