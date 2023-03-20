// Import external packages.
import 'package:flutter/material.dart';

// Flutter uses the runApp function to inflate (display) the given widget on the screen.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue.shade800,
        fontFamily: 'Roboto',
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [Color(0xff03a1e9), Color(0xff042b4a)],
          center: Alignment.center,
          radius: 0.8,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            height: 600,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                  child: FittedBox(
                    child: Text(
                      "Rate.It",
                      style: TextStyle(
                        color: Color(0xfffbff00),
                        fontWeight: FontWeight.bold, 
                        fontSize: 100),
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: SizedBox(
                    width: 400,
                    height: 50,
                    child: Tooltip(
                      message: "Explore different templates and see what people think.",
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(
                                width: 3, 
                                color:Colors.yellow
                              ),
                            ),
                          ),
                        ),
                        child: const Text("Global Rankings")
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: SizedBox(
                    width: 400,
                    height: 50,
                    child: Tooltip(
                      message: "Rate the better of two options until it's decided which you find to be the best.",
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(
                                width: 3, 
                                color:Colors.yellow
                              ),
                            ),
                          ),
                        ),
                        child: const Text("Solo Rankings")
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: SizedBox(
                    width: 400,
                    height: 50,
                    child: Tooltip(
                      message: "Play with friends or viewers and create a collaborative ranking!",
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(
                                width: 3, 
                                color:Colors.yellow
                              ),
                            ),
                          ),
                        ),
                        child: const Text("Party Mode")
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

