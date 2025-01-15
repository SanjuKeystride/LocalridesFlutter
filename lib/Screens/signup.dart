import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:newtestproject/Screens/forgotPassword.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordBoolValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey,),
      backgroundColor: Colors.grey,
      bottomSheet: Container(
        decoration: BoxDecoration(
          //  borderRadius:BorderRadius.circular(50),
               color: Colors.transparent,
        ),
        child: Padding( padding: const EdgeInsets.all(10.0),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BackButton(
                      onPressed: () {
                        print("back button tapped");
                      },
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      "Finish signup",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                CustomTextField(
                    textController: firstNameController,
                    textHint: "First Name", title: "First Name"),
                SizedBox(height: 10),
                CustomTextField(
                  textController: lastNameController,
                  textHint: "Last Name",
                  title: "Last Name",
                ),
                SizedBox(height: 10),
                CustomTextField(
                  textController: dobController,
                  textHint: "MM/DD/YYYY",
                  title: "BirthDay",
                  icon: Icon(Icons.cake),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  textController:emailController,
                  title: "Email address",
                  endicon: Icon(Icons.message),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  textController: passwordController,
                  title: "Password",
                  endicon: Icon(Icons.password),
                  icon: Icon(Icons.key),
                  textHint: "Enter a password",
                  onChangedPassword:(value) {
                    setState(() {
                    if (value >= 3) {
                      passwordBoolValue = true;

                    }else{
                      passwordBoolValue = false;
                    }


                    });
                  },
                ),
                SizedBox(height: 20),
                PasswordValidation(
                  validationText: "atleast 8 characters",
                  passwordIcon: "assets/check.png",
                  validationBool: passwordBoolValue,
                ),
                SizedBox(height: 20),
                PasswordValidation(
                  validationText: "atleast 8 characters",
                  passwordIcon: "assets/check.png",
                  validationBool: passwordBoolValue,
                ),
                SizedBox(height: 10),
                Text(
                  "by selecting agree and continue, i agree to(and here we have links to all terms and conditions for the app",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    print(firstNameController.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword()));
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        Colors.lightGreenAccent), // Set your desired color
                  ),
                  child: SizedBox(
                    child: Center(child: Text("Agree and continue")),
                    width: double.infinity,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(),
      ),
    );
  }
}

class PasswordValidation extends StatelessWidget {
  PasswordValidation({
    super.key,
    required this.validationText,
    required this.passwordIcon,
    required this.validationBool,
  });

  final String validationText;
  final String passwordIcon;
  final bool validationBool;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          passwordIcon,
          height: 20,
          width: 20,
          color: validationBool ? Colors.lightGreen : Colors.grey,
        ),
        SizedBox(width: 20),
        Text(validationText),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.textHint,
    required this.title,
    this.icon,
    this.endicon,
    this.textController, this.onChangedPassword,
  });

  final String? textHint;
  final String title;
  final Widget? icon;
  final Widget? endicon;
  final TextEditingController? textController;
  final Function? onChangedPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextField(
          controller: textController,
          onChanged: (value) {
           if ( onChangedPassword != null) {
             onChangedPassword!(value.length);
           }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: textHint,
            prefixIcon: icon,
            suffixIcon: endicon,
          ),
        ),
      ],
    );
  }
}

