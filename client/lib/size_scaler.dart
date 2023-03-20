// // Import packages.
// import 'package:flutter/material.dart';
// import 'dart:math';

// // We create a class to keep everything responsive.
// class SizeScaler {
//   // We keep as variables the resolution used while building the app so we can scale everything on different screens based on the dev env. 
//   int defaultWidth;
//   int defaultHeight;
//   double maxScaleFactor;
//   double minScaleFactor;
//   /// We use the common pc screen as default values and a max scaling factor of times 2.
//   SizeScaler({this.defaultWidth = 1920, this.defaultHeight = 1080, this.maxScaleFactor = 1.0, this.minScaleFactor = 0.80});
  
//   double getTextScaleFactor(BuildContext context, {conditional = true}) {
//     // In cas we only want to scale up to a certain point, we let the possibility of inputing a condition as a function argument.
//     if (conditional) {
//       // Get the current screen resolutions.
//       double currentWidth = MediaQuery.of(context).size.width;
//       double currentHeight = MediaQuery.of(context).size.height;

//       // Compute the ratio between the current and developement resolutions.
//       double differenceRatio = ((currentWidth+currentHeight) / (defaultWidth));

//       // Return the scaling factor which is either the ratio or the defined bounds, if the former goes beyond the latter.
//       return max(minScaleFactor, min(maxScaleFactor, differenceRatio));
//     } else {
//       return 1.0;
//     }
//   }
// }