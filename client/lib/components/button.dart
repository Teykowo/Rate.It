import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget{
  const BorderButton({
    super.key,
    this.tooltipMessage = '',
    this.buttonText = '',
    this.buttonFunction});

  final String tooltipMessage;
  final String buttonText;
  final buttonFunction;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        width: 400,
        height: 50,
        child: Tooltip(
          message: tooltipMessage,
          child: ElevatedButton(
            onPressed: buttonFunction,
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
            child: Text(buttonText)
          ),
        ),
      ),
    );
  }
}
