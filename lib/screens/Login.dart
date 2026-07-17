import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

Widget retrotext(text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'PressStart2P',
      fontSize: 8,
      color: Colors.blue,
    ),
  );
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  bool password = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage("assets/images/login1.jpg"),
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(top: 250),
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'PressStart2P',
                                color: Colors.red,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          retrotext("Email/Username >>>"),
                          SizedBox(height: 10),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Email is required";
                              }

                              final emailRegex = RegExp(
                                r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                              );

                              if (!emailRegex.hasMatch(value.trim())) {
                                return "Enter a valid email";
                              }

                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.blue,
                                size: 30,
                              ),
                              hintText: "Enter your email or username",
                              hintStyle: TextStyle(color: Colors.deepOrange),
                            ),
                            style: TextStyle(color: Colors.deepOrange),
                          ),
                          SizedBox(height: 10),
                          retrotext("Password"),
                          SizedBox(height: 10),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Password required";
                              }
                              if (value.trim().length < 6) {
                                return "minimum 6 characters";
                              }
                              if (value.trim().length > 12) {
                                return "maximum 12 characters";
                              }
                            },
                            obscureText: password,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.blue,
                                size: 30,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    password = !password;
                                  });
                                },
                                icon: Icon(
                                  password
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),

                              hintText: "Enter your Password",
                              hintStyle: TextStyle(color: Colors.deepOrange),
                            ),
                            style: TextStyle(color: Colors.deepOrange),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),

                          SizedBox(height: 20),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                              },
                              child: Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/loginbtn.jpg",
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "OR",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/signupbtn.jpg",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
