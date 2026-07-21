import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:versus_app/Providers/auth_providers.dart';
import 'package:versus_app/resuables/formfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isPassword = false;
  bool isCreatePassword = false;
  final _formKey = GlobalKey<FormState>();

  final usernameCon = TextEditingController();
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();
  final confirmPasswordCon = TextEditingController();

  Widget retrotext(text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'PressStart2P',
        fontSize: 8,
        color: Colors.deepPurple,
      ),
    );
  }

  @override
  void dispose() {
    usernameCon.dispose();
    emailCon.dispose();
    passwordCon.dispose();
    confirmPasswordCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 200),
                      padding: EdgeInsets.all(10),
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
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
                          SizedBox(height: 20),
                          Text(
                            "Username",
                            style: TextStyle(
                              fontFamily: 'PressStart2P',
                              fontSize: 8,
                              color: Colors.deepPurple,
                            ),
                          ),
                          SizedBox(height: 7),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Username is required";
                              }

                              if (value.trim().length < 3) {
                                return "Minimum 3 characters";
                              }

                              return null;
                            },
                            controller: usernameCon,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.deepPurple,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Icon(
                                  Icons.person,
                                  size: 30,
                                  color: Colors.deepPurple,
                                ),
                              ),
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

                          SizedBox(height: 20),
                          retrotext("Email"),
                          SizedBox(height: 5),

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
                            controller: emailCon,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.deepPurple,
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  Icons.mail,
                                  size: 30,
                                  color: Colors.deepPurple,
                                ),
                              ),
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

                          SizedBox(height: 20),
                          retrotext("Password"),
                          SizedBox(height: 5),
                          Formfield(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              }

                              if (value.length < 6) {
                                return "Minimum 6 characters";
                              }

                              return null;
                            },
                            prefixicon: Icons.lock,

                            obscuretext: isPassword,
                            controller: passwordCon,
                            onpressed: () {
                              setState(() {
                                isPassword = !isPassword;
                              });
                            },
                            hinttext: "Password",
                          ),
                          SizedBox(height: 20),
                          retrotext("Confirm Password"),
                          SizedBox(height: 5),
                          Formfield(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Confirm your password";
                              }

                              if (value != passwordCon.text) {
                                return "Passwords do not match";
                              }

                              return null;
                            },
                            prefixicon: Icons.lock,

                            obscuretext: isCreatePassword,
                            controller: confirmPasswordCon,
                            onpressed: () {
                              setState(() {
                                isCreatePassword = !isCreatePassword;
                              });
                            },
                            hinttext: "re-enter",
                          ),
                          SizedBox(height: 30),

                          GestureDetector(
                            onTap: () async {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              final success = await context
                                  .read<AuthProvider>()
                                  .signUp(
                                    username: usernameCon.text.trim(),
                                    email: emailCon.text.trim(),
                                    password: passwordCon.text.trim(),
                                  );

                              if (success) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Verification email sent"),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      context
                                              .read<AuthProvider>()
                                              .errorMessage ??
                                          "Signup Failed",
                                    ),
                                  ),
                                );
                              }
                            },
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
          ),
        ],
      ),
    );
  }
}
