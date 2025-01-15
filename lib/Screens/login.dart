import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  bottomSheet: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
          color: Colors.white
    ),
    height: MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom,
    child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: SingleChildScrollView(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
    crossAxisAlignment: CrossAxisAlignment.center,
children: [
  SizedBox(width: 150,),
  Text("Login",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
  Spacer(),

  Container(
    width: 50.0, // Set the width for the circular button
    height: 50.0, // Set the height for the circular button
    decoration: BoxDecoration(
      color: Colors.grey[200], // Light grey background
      shape: BoxShape.circle, // Makes the button circular
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 5,
          spreadRadius: 2,
        ),
      ],
    ),
    child: IconButton(
      onPressed: () {
        print("Button tapped");
      },
      icon: Icon(
        Icons.close,
        color: Colors.grey, // Icon color
        size: 24.0, // Icon size
      ),
    ),
  ),

],
    )
  ],
  ),
  ),
  ),

    ),
    );
  }
}
