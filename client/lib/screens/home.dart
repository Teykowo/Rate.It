// Import external packages.
import 'package:flutter/material.dart';
// Import components.
import 'package:client/components/button.dart';
// Import pages.
import 'package:client/screens/templates_navigation.dart';

// --------------------------------------------- Page Main Function ---------------------------------------------
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
// --------------------------------------------------------------------------------------------------------------

// -------------------------------------------- -Page State Function --------------------------------------------
class _HomePageState extends State<HomePage> {
  // ------------------------------------------ -Build Function ------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ----------------------------- -BG Image -----------------------------
        Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage("assets/bgImage.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // ---------------------------------------------------------------------

        // ---------------------------- BG Gradient ----------------------------
        Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [Color(0xff03a1e9), Color.fromARGB(131, 4, 42, 74)],
              center: Alignment.center,
              radius: 0.8,
            )
          ),
        // ----------------------------------------------------------------------
          child: Scaffold(
            backgroundColor: Colors.transparent,
            // ------------------------------- Title -------------------------------
            body: Center(
              child: SizedBox(
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
            // ---------------------------------------------------------------------

                    // --------------------------- Global Button ---------------------------
                    BorderButton(
                      tooltipMessage: "Explore different templates and see what people think.", 
                      buttonText: "Global Rankings",
                      buttonFunction: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TemplatesNavPage(),
                          ),
                        );
                      },
                    ),
                    // ---------------------------------------------------------------------
                    // ---------------------------- Solo Button ----------------------------
                    BorderButton(
                      tooltipMessage: "Rate the better of two options until it's decided which you find to be the best.", 
                      buttonText: "Solo Rankings",
                      buttonFunction: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TemplatesNavPage(),
                          ),
                        );
                      },
                    ),
                    // ---------------------------------------------------------------------
                    // --------------------------- -Party Button ---------------------------
                    BorderButton(
                      tooltipMessage: "Play with friends or viewers and create a collaborative ranking!", 
                      buttonText: "Party Mode",
                      buttonFunction: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TemplatesNavPage(),
                          ),
                        );
                      },
                    ),
                    // ---------------------------------------------------------------------
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
// -----------------------------------------------------------------------------------------------------