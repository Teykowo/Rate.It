// Import external packages.
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:io';
// Import components.
import 'package:client/components/template_thumbnail.dart';

// --------------------------------------------- Page Main Function ---------------------------------------------
class TemplatesNavPage extends StatefulWidget{
  const TemplatesNavPage({super.key});

  @override
  State<TemplatesNavPage> createState() => _TemplatesNavPageState();
}
// --------------------------------------------------------------------------------------------------------------

// -------------------------------------------- -Page State Function --------------------------------------------
class _TemplatesNavPageState extends State<TemplatesNavPage> {
  // String _searchBarParameters = '';
  // String _genreBarParameter = '';

  List<TemplateThumbnail> _templatesList = [];

  // ---------------------------------- Change Thumbnails List Function ----------------------------------
  void updateThumbnailList() async {
    List<TemplateThumbnail> newTemplatesList = [];

    await for (var results in Directory('assets/TEMPLIST/').list()){
      newTemplatesList.add(TemplateThumbnail(
        imageLink: results.path,
        tooltipMessage: results.path,
      )); 
    }

    // The documentation states that the setState function should only be called to change the variable once all computations are done.
    setState(() {
      _templatesList = newTemplatesList;
    });
  }
  // ---------------------------------------------------------------------------------------------------

  // ---------------------------------- State Initialization Function ----------------------------------
  @override
  void initState() {
    updateThumbnailList();
    super.initState();
  }
  // -----------------------------------------------------------------------------------------------------

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
        ),
        // ----------------------------------------------------------------------
        Scaffold(
          backgroundColor: Colors.transparent,
          // ------------------------------ App Bar ------------------------------
          appBar: AppBar(
            backgroundColor: Colors.blue.shade800,
            centerTitle: true,
            toolbarHeight: 200,
            title: SizedBox(
              height: 100,
              width: 500,
              child: ListView(
                shrinkWrap: true,
                children: const [
                  // --------------------------- App Bar Title ---------------------------
                  Text("Navigate Templates",
                    textAlign: TextAlign.center,
                  ),
                  // ---------------------------------------------------------------------
                  // ------------------------ Template Search Bar ------------------------
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      height: 50,
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Search Templates',
                          suffixIcon: Icon(
                            Icons.search,
                          ),
                        )
                      ),
                    ),
                  ),
                  // ---------------------------------------------------------------------
                ],
              ),
            ),
            actions: [
              // ------------------------ Add Template Button ------------------------
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SizedBox(
                  width: 100,
                  child: FloatingActionButton(
                    onPressed:() => {},
                    tooltip: "Add a new template",
                    child: const Icon(
                      Icons.add,
                      size: 50,
                      ),
                  ),
                ),
              )
              // ---------------------------------------------------------------------
            ],
          ),
          // ---------------------------------------------------------------------

          // -------------------------- Thumbnails List --------------------------
          body: GridView.count(
            crossAxisCount: max(1, (MediaQuery.of(context).size.width ~/ 192).toInt()),
            childAspectRatio: 192/216,
            children: _templatesList,
          ),
          // ---------------------------------------------------------------------
        ),
      ],
    );
  }
  // -----------------------------------------------------------------------------------------------------
}
// -----------------------------------------------------------------------------------------------------