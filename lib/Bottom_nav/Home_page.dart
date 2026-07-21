import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          actionsPadding: EdgeInsets.only(right: 10),
          backgroundColor: const Color.fromARGB(255, 2, 68, 122),
          leading: Icon(Icons.menu, size: 28),
          centerTitle: true,
          title: Text(
            "Versus Festival",
            style: TextStyle(
              fontFamily: "PressStart2P",
              fontSize: 18,
              color: Colors.pinkAccent,
            ),
          ),
          actions: [Icon(Icons.notifications, size: 28, color: Colors.white)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/images/ryu.png")),
                    Expanded(
                      child: Stack(
                        children: [
                          Text(
                            "Versus Festival 2024 ",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "PressStart2P",
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..color = Colors.pink
                                ..strokeWidth = 2,
                            ),
                          ),
                          Text(
                            "Versus Festival 2024",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "PressStart2P",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
