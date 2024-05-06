import 'package:flutter/material.dart';

class PilganCard extends StatelessWidget {

  final String answer;
  final String selectedAnswer;
  final ValueChanged<String?> onChanged;

  PilganCard({
    required this.answer,
    required this.selectedAnswer,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xff0093AC),
          width: 1
        )
      ),
      child: Row(
        children: [
          Radio<String>(
            value: answer, 
            groupValue: selectedAnswer, 
            onChanged: onChanged),
          Text(
            answer,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black
            ),
          )
        ],
      ),
    );
  }
}