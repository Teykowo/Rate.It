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
  String? _genresBarParameter = '';

  List<DropdownMenuEntry<String>> _genresList = <DropdownMenuEntry<String>>[];
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

  // ----------------------------------- Get genres from SQL servers -----------------------------------
  void updateGenresList() async{
    List<DropdownMenuEntry<String>> newGenresListDropDown = <DropdownMenuEntry<String>>[];

    List<String> newGenresList = [
      "Anime",
      "Food",
      "Architecture",
      "Video Games",
      "Movies",
      "Nature",
      "Music",
      "Flags",
      "Animals",
      "Weapons",
      "Miscellaneous",
    ];

    for (String genre in newGenresList){
      newGenresListDropDown.add(DropdownMenuEntry<String>(value: genre, label: genre));
    }

    setState(() {
      _genresList = newGenresListDropDown;
    });
  }
  // ---------------------------------------------------------------------------------------------------

  // ---------------------------------- State Initialization Function ----------------------------------
  @override
  void initState() {
    updateGenresList();
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
            // ------------------------------ Center ------------------------------
            title: SizedBox(
              height: 100,
              width: 900,
              child: ListView(
                shrinkWrap: true,
                children: [
                  // --------------------------- App Bar Title ---------------------------
                  const Text("Navigate Templates",
                    textAlign: TextAlign.center,
                  ),
                  // ---------------------------------------------------------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // ------------------------ Template search Bar ------------------------
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          height: 50,
                          width: 500,
                          child: TextField(
                            decoration: InputDecoration(
                              // --------------------- -focused Search Bar style ---------------------
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                borderSide: const BorderSide(
                                  color: Color(0xfffbff00),
                                  width: 2,
                                ),
                              ),
                              // ---------------------------------------------------------------------

                              // ----------------------- base Search Bar style -----------------------
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              // ---------------------------------------------------------------------
                              labelText: 'Search Templates',
                              suffixIcon: const Icon(
                                Icons.search,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // ---------------------------------------------------------------------

                      // ------------------------ Template Genre Menu ------------------------
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 30.0),
                        child: DropdownMenu(
                          initialSelection: " ",
                          controller: TextEditingController(),
                          label: const Text("Genres"),
                          dropdownMenuEntries: _genresList,
                          onSelected: (String? genre){
                            setState(() {
                              _genresBarParameter = genre;
                            });
                            updateGenresList();
                            updateThumbnailList();
                          },
                        ),
                      ),
                      // ---------------------------------------------------------------------
                    ],
                  ),
                ],
              ),
            ),
            // ---------------------------------------------------------------------
            // ------------------------------ Trailing ------------------------------
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
            // ---------------------------------------------------------------------
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