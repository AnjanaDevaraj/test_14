import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/authProvider.dart';
import '../utilites/appAssets.dart';
import '../utilites/appRoutes.dart';
import '../utilites/appStringConstants.dart';
import '../utilites/customText.dart';
import '../utilites/customTextButton.dart';
import '../utilites/customTextField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterSection(),
    );
  }
}

class RegisterSection extends StatelessWidget {
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

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController professionController = TextEditingController(text: 'Accountant');

    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      double screenHeight = MediaQuery.of(context).size.height;
      double bottomHeight = screenHeight * 0.80;
      return Container(
        height: bottomHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.9),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(240),
            topRight: Radius.circular(240),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CustomText(
              text: "Register To",
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
                  controller: nameController,
                  hintText: "Name"),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: CustomTextField(
                  controller: emailController,
                  hintText: "Email"),
            ),const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: CustomTextField(
                  controller: passwordController,
                  hintText: "Password"),
            ),const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: CustomTextField(
                  controller: phoneController,
                  hintText: "Phone"),
            ),const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 146),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Light grey background color
                  borderRadius: BorderRadius.circular(8), // Border radius of 8
                  border: Border.all(
                    color: Colors.black.withOpacity(0.2), // Light black border color
                  ),
                ),
                height: 60,
              //  margin: EdgeInsets.symmetric(horizontal: 24),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey), // Set border color to grey
                    ),
                    //contentPadding: EdgeInsets.symmetric(horizontal: 12),
                     border: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.grey),
                     ),
                  ),
                  items: AppStringConstants.profession.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.grey[600]),),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    professionController.text = newValue!;
                  },
                  value: professionController.text,
                ),
              ),
            ),

            const SizedBox(
              height: 40,
            ),
            CustomTextButton(
              onPressed: () {
                // Navigator.pushNamed(context, AppRoutes.Register);
              },
              height: 60,
              color: Colors.green,
              text: "Register",
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.home);
                },
                child: RichText(
                  text: const TextSpan(
                      text: 'Already a user?',
                      style: TextStyle(color: Colors.black54),
                      children: [
                        TextSpan(
                            text: "Login",
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
