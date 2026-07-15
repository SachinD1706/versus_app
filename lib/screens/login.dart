import 'package:flutter/material.dart';
import 'package:versus_app/resuables/formfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool IsPassword = false;
  bool IsCreatePassword = false;
  Widget retrotext(text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'PressStart2P',
        fontSize: 10,
        color: Colors.deepPurple,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "assets/images/signup.jpg",
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 200),
                      padding: EdgeInsets.all(10),
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.pinkAccent),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                fontFamily: 'PressStart2P',
                                fontSize: 15,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Username",
                            style: TextStyle(
                              fontFamily: 'PressStart2P',
                              fontSize: 10,
                              color: Colors.deepPurple,
                            ),
                          ),
                          SizedBox(height: 7),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(2),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.deepPurple,
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  Icons.person,
                                  size: 30,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),

                                    hintText: 'Username',
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          retrotext("Email"),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(2),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.deepPurple,
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  Icons.person,
                                  size: 30,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          retrotext("Password"),
                          SizedBox(height: 5),
                          form(
                            Icon1: Icons.lock,
                            Icon2: Icons.visibility,
                            obscuretext: IsPassword,
                            onpressed: () {
                              setState(() {
                                IsPassword = !IsPassword;
                              });
                            },
                            text: "Password",
                          ),
                          SizedBox(height: 20),
                          retrotext("Confirm Password"),
                          SizedBox(height: 5),
                          form(
                            Icon1: Icons.lock,
                            Icon2: Icons.visibility,
                            obscuretext: IsCreatePassword,
                            onpressed: () {
                              setState(() {
                                IsCreatePassword = !IsCreatePassword;
                              });
                            },
                            text: "re-enter",
                          ),
                          SizedBox(height: 30),

                          GestureDetector(
                            child: Container(
                              width: 300,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/button.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
