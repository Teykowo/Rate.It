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
          child: Container(
            height: 500,
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
                SizedBox(
                  width: 400,
                  height: 50,
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
                    child: const Tooltip(
                      message: "Explore different templates and see what people think.",
                      child: Text("Global Rankings")
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: FloatingActionButton.extended(
                      onPressed: (){},
                      tooltip: "Rate the better of two options until it's decided which you find to be the best.",
                      label: const Text("Solo Rankings"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 400,
                  child: FloatingActionButton.extended(
                    onPressed: (){},
                    tooltip: "Play with friends or viewers and create a collaborative ranking!",
                    label: Text("Party Mode"),
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












// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Rate.It'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   void _incrementCounter() {
//     setState(() {
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(widget.title, 
//                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 100),
//                  textScaleFactor: scaler.getTextScaleFactor(context)
//             ),
//             ButtonBar(alignment: MainAxisAlignment.center, 
//                       buttonPadding:EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                       children: <Widget>[
//                         FloatingActionButton.extended(onPressed: (){},
//                                                       tooltip: 'Increment',
//                                                       label: Text("Explore Templates"),),
//                         FloatingActionButton.extended(onPressed: (){},
//                                                       tooltip: 'Increment',
//                                                       label: Text("Personal Rankings"),),
//                         FloatingActionButton.extended(onPressed: (){},
//                                                       tooltip: 'Increment',
//                                                       label: Text("Party Mode"),),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
