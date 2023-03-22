import 'package:flutter/material.dart';

class TemplateThumbnail extends StatelessWidget{
  const TemplateThumbnail({
    this.imageLink = '', 
    this.width = 192, 
    this.height = 216, 
    this.tooltipMessage = '', 
    this.buttonFunction, 
    super.key});

  final String imageLink;
  final double width;
  final double height;
  final String tooltipMessage;
  final buttonFunction;


  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, left: 2.5),
      child: SizedBox(
        width: width,
        height: height,
        child: Tooltip(
          message: tooltipMessage,
          child: ElevatedButton(
            onPressed: buttonFunction,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: FractionalOffset.topCenter,
                  image: AssetImage(imageLink),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
