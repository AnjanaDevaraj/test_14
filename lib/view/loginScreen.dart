import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mar14/providers/homeProvider.dart';
import '../providers/authProvider.dart';
import '../storage/dbFns.dart';
import '../utilites/appAssets.dart';
import '../utilites/appRoutes.dart';
import '../utilites/customText.dart';
import '../utilites/customTextButton.dart';
import '../utilites/customTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginSection(),
    );
  }
}

class LoginSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child)
    {
      double screenHeight = MediaQuery
          .of(context)
          .size
          .height;
      return SingleChildScrollView(
        child: Container(
          height: screenHeight,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppAssets.movieRoll,
                  // height: imageHeight,
                ),
                fit: BoxFit.cover,
              )),
          child: const Stack(
            children: [
              //Top image
              Positioned(
                bottom: 0,
                left: -120,
                right: -120,
                child: BottomSection(),
              )
            ],
          ),
        ),
      );
    });}
}

class BottomSection extends StatelessWidget {
 const BottomSection({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    void loginUser(String email, String pwd) async {
        var data = await SQLHelperLogin.checkUserExist(email, pwd);
        if (data.isNotEmpty) {
          Navigator.pushNamed(context, AppRoutes.home);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Invalid credentials")));
        }

    }

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      double screenHeight = MediaQuery.of(context).size.height;
      double bottomHeight = screenHeight * 0.60;
      return Container(
        height: bottomHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.9),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(320),
            topRight: Radius.circular(320),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 60),
            const CustomText(
              text: "Login To",
              weight: FontWeight.bold,
              size: 30,
            ),
            const CustomText(
              text: "Continue",
              color: Colors.deepOrange,
              weight: FontWeight.bold,
              size: 30,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: CustomTextField(
                  controller: emailController,
                  hintText: "Enter email"),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: CustomTextField(
                  controller: passwordController,
                  hintText: "Enter password"),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextButton(
              onPressed: () {
                loginUser(emailController.text,passwordController.text);
              },
              height: 60,
              color: Colors.deepOrange,
              text: "Login",
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                 // Provider.of<HomeProvider>(context,listen: false).callForMovies();
                  Navigator.pushNamed(context, AppRoutes.register);
                },
                child: RichText(
                  text: TextSpan(
                      text: 'Not a user? ',
                      style: TextStyle(color: Colors.black54),
                      children: [
                        TextSpan(
                            text: "Signup",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ))
                      ]),
                ))

          ],
        ),
      );
    });
  }
}
