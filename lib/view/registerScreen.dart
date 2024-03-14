import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/authProvider.dart';
import '../storage/dbFns.dart';
import '../utilites/appAssets.dart';
import '../utilites/appRoutes.dart';
import '../utilites/appStringConstants.dart';
import '../utilites/customText.dart';
import '../utilites/customTextButton.dart';
import '../utilites/customTextField.dart';

class RegisterScreen extends StatefulWidget {
  // bool _passwordVisible = false;
  // bool _cpasswordVisible = false;

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
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      double screenHeight = MediaQuery.of(context).size.height;
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
    });
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController cpasswordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController professionController =
    TextEditingController(text: 'Accountant');

    var is_PwdHidden = true;

    void registerUser(String name, String phone, String email, String password,
        String profession) async {
      var id = await SQLHelperLogin.create(
          name, phone, email, password, profession);
      print(id);
      if (id != null) {
        Navigator.pushNamed(context, AppRoutes.home);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Registration Failed")));
      }
    }

    void validator(String name, String phone, String email, String password,
        String cpassword, String profession) {
      if (name.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Name cannot be empty")));
      } else if (phone.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Phone cannot be empty")));
      } else if (email.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Email cannot be empty")));
      } else if (password != cpassword) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Passwords does not match")));
      } else {
        registerUser(name, phone, email, password, profession);
      }
    }

    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        double screenHeight = MediaQuery.of(context).size.height;
        double bottomHeight = screenHeight * 0.86;
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: CustomTextField(
                  controller: nameController,
                  hintText: "Name",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  child: TextFormField(
                    obscureText: is_PwdHidden,
                    controller: passwordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          is_PwdHidden = !is_PwdHidden;
                        },
                        icon: Icon(
                          is_PwdHidden ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                      hintText: "Password",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  child: TextField(
                    obscureText: true,
                    controller: cpasswordController,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: CustomTextField(
                  controller: phoneController,
                  hintText: "Phone",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 146),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  height: 60,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    items: AppStringConstants.profession.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
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
                height: 36,
              ),
              CustomTextButton(
                onPressed: () {
                  validator(
                    nameController.text,
                    phoneController.text,
                    emailController.text,
                    passwordController.text,
                    cpasswordController.text,
                    professionController.text,
                  );
                },
                height: 60,
                color: Colors.deepOrangeAccent,
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
                    text: 'Already a user? ',
                    style: TextStyle(color: Colors.black54),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

