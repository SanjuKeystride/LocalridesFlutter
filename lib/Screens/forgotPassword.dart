import 'package:flutter/material.dart';
import 'package:newtestproject/Screens/filter.dart';
import 'package:newtestproject/Screens/home.dart';
import 'package:newtestproject/Screens/login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.grey,
      // ),
       backgroundColor: Colors.white,
      bottomSheet: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            MediaQuery.of(context).padding.bottom,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // Start content from the top
              crossAxisAlignment: CrossAxisAlignment.center,
              // Align content to the start horizontally
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BackButton(
                      onPressed: () {
                        print("Back Button Tapped");
                      },
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email_outlined,
                      size: 100,
                      color: Colors.deepOrange,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Check your Email",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "we sent a email password reset link to",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: [
                        TextSpan(
                            text: " kmsanju8@gmail.com",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                FilledButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.lightGreenAccent), // Set your desired color
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(child: Text("open email app")),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive the email? ",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        print("resend Tapped");
                      },
                      child: Text(
                        "Tap to resend",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BackButton(
                      onPressed: () {
                        print("Back Button Tapped");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Filter()));
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Back to login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
